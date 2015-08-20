using System;
using Rpc;
using System.Net;
using System.Threading.Tasks;
using System.Threading;
using System.Linq;
using System.Net.Sockets;
using Rpc.Sender;
using System.Collections.Generic;
using System.IO;
using System.Diagnostics;

namespace Benchmark
{
    class MainClass
    {
        const int port = 8080;
        static int serverCounter;
        static int clientCounter;
        static int sendCounter;
        static int okCounter;
        static int ngCounter;

        public static void Main(string[] args)
        {
            var timer = Stopwatch.StartNew();
            int worker = 1;
            int count = 50000;
            var tasks = new Task[]
            {
                runAll(worker, count),
                showStatusTask(10),
            };
            Task.WaitAny(tasks);
            timer.Stop();

            var msg = string.Format("Request Per Seconds({0}) count({1}/{2}) seconds({3})",
                          (worker * count) / (timer.ElapsedMilliseconds / 1000.0),
                          okCounter,
                          worker * count,
                          timer.ElapsedMilliseconds / 1000.0
                      );
            showStatus();
            Console.WriteLine(msg);
        }

        static async Task showStatusTask(int seconds)
        {
            for (int i = 0; i < seconds; ++i)
            {
                await Task.Delay(1 * 1000).ConfigureAwait(false);
                showStatus();
            }
        }

        static void showStatus()
        {
            var msg = string.Format("status server={0} client={1} send={2} ok={3} ng={4}",
                          serverCounter, 
                          clientCounter, 
                          sendCounter,
                          okCounter,
                          ngCounter);
            Console.WriteLine(msg);
        }

        static Task runAll(int worker, int count)
        {
            var tasks = new List<Task>();
            tasks.Add(runServer(worker * count));
            tasks.AddRange(Enumerable.Range(1, worker).Select(_ => runClientRetry(count)));
            return Task.WhenAll(tasks);
        }

        static async Task runClientRetry(int count)
        {
            while (count > 0)
            {
                count = await runClient(count).ConfigureAwait(false);
            }
        }

        static async Task<int> runClient(int count)
        {
            int restCount = count;
            using (var client = new TcpClient())
            {
                await client.ConnectAsync(IPAddress.Loopback, port).ConfigureAwait(false);
                using (var s = client.GetStream())
                {
                    var w = new Writer();
                    var r = new Reader();
                    var expect = 7;
                    r.OnAdd = x =>
                    {
                        if (expect == x)
                        {
                            Interlocked.Decrement(ref restCount);
                            Interlocked.Increment(ref okCounter);
                        }
                        else
                        {
                            Interlocked.Increment(ref ngCounter);
                            Console.WriteLine("expect: " + expect);
                            Console.WriteLine("fact  : " + x);
                        }
                    };
                    var t1 = Task.Run(async () =>
                        {
                            try
                            {
                                using (var b = new BufferedStream(s))
                                {
                                    for (int i = 0; i < count; ++i)
                                    {
                                        r.Stream = await recv(b, (int)RpcHeader.HeaderLength).ConfigureAwait(false);
                                        var header = r.ReadHeader();

                                        r.Stream = await recv(b, (int)header.Length).ConfigureAwait(false);
                                        r.Dispatch(header)(null);
                                        Interlocked.Increment(ref clientCounter);
                                    }
                                }
                            }
                            catch (Exception ex)
                            {
                                Console.WriteLine("client recv: " + ex.Message);
                                Console.WriteLine(ex);
                            }
                        });
                    var t2 = Task.Run(async () =>
                        {
                            try
                            {
                                for (int i = 0; i < count; ++i)
                                {
                                    w.RequestAdd(3, 4);
                                    int length = (int)w.Stream.Length;
                                    w.Stream.Position = 0;
                                    await s.WriteAsync(w.Stream.GetBuffer(), 0, length).ConfigureAwait(false);
                                    Interlocked.Increment(ref sendCounter);
                                }
                            }
                            catch (Exception ex)
                            {
                                Console.WriteLine("client recv: " + ex.Message);
                            }
                        });
                    await Task.WhenAll(t1, t2).ConfigureAwait(false);
                }
            }

            if (restCount > 0)
            {
                Console.WriteLine("retry: " + restCount);
            }
            return restCount;
        }


        static async Task<MemoryStream> recv(BufferedStream b, int n)
        {
            var buf = new byte[n];
            int rest = n;
            while (rest > 0)
            {
                rest -= await b.ReadAsync(buf, n - rest, rest).ConfigureAwait(false);
            }
            return new MemoryStream(buf, false);
        }

        static Task runServer(int limit)
        {
            var server = new RpcServer(new IPEndPoint(IPAddress.Loopback, port));
            server.OnException = x => Console.WriteLine("server: " + x.Message);
            return server.Start((r, w) =>
                {
                    r.OnAdd = (x, y) =>
                    {
                        if (limit == Interlocked.Increment(ref serverCounter))
                        {
                            server.Stop().Wait();
                        }
                        return x + y;
                    };
                });
        }
    }
}