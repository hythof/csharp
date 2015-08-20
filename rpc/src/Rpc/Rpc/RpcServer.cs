using System.Threading.Tasks;
using System.IO;
using System;
using System.Net.Sockets;
using System.Net;

namespace Rpc
{
    using Rpc.Receiver;

    public class RpcServer
    {
        public Action<Exception> OnException = Console.WriteLine;
        IPEndPoint listenPoint;
        Task startTask;
        bool isStop = false;

        public RpcServer(IPEndPoint end)
        {
            listenPoint = end;
        }

        public Task Start(Action<Reader, Writer> callback)
        {
            startTask = start(callback);
            return startTask;
        }

        public async Task Stop()
        {
            isStop = true;
            using (var dummy = new TcpClient())
            {
                await dummy.ConnectAsync(IPAddress.Loopback, listenPoint.Port).ConfigureAwait(false);
                await startTask.ConfigureAwait(false);
            }
        }

        async Task start(Action<Reader, Writer> callback)
        {
            var listener = new TcpListener(listenPoint);
            listener.Start();
            while (true)
            {
                var client = await listener.AcceptTcpClientAsync().ConfigureAwait(false);
                if (isStop)
                {
                    break;
                }
                handle(client, callback);
            }
            listener.Stop();
        }

        async void handle(TcpClient client, Action<Reader, Writer> callback)
        {
            try
            {
                using (var s = client.GetStream())
                using (var b = new BufferedStream(s))
                {
                    var w = new Writer();
                    var r = new Reader();
                    callback(r, w);

                    while (true)
                    {
                        r.Stream.Position = 0;
                        await recv(b, r, (int)RpcHeader.HeaderLength).ConfigureAwait(false);
                        var header = r.ReadHeader();

                        if(header.Length > r.Buffer.Length)
                        {
                            throw new InvalidDataException("packet too long size=" + header.Length);
                        }

                        await recv(b, r, (int)header.Length).ConfigureAwait(false);
                        r.Dispatch(header)(w);

                        if (w.Stream.Position > 0)
                        {
                            var buf = w.Stream.GetBuffer();
                            var length = (int)w.Stream.Position;
                            await s.WriteAsync(buf, 0, length).ConfigureAwait(false);
                            w.Stream.Position = 0;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                OnException(ex);
            }
            finally
            {
                client.Close();
            }
        }

        async Task recv(Stream b, Reader r, int length)
        {
            r.Stream.Position = 0;
            int rest = length;
            while (rest > 0)
            {
                rest -= await b.ReadAsync(r.Buffer, length - rest, rest).ConfigureAwait(false);
            }
        }
    }
}