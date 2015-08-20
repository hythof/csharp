using System.Threading;
using System.IO;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Net;
using System.Net.Sockets;

namespace Rpc
{
    using Rpc.Sender;

    public class RpcClientForUnity
    {
        public readonly Writer Writer = new Writer();
        public readonly Reader Reader = new Reader();
        public Action<Exception> OnException = Console.WriteLine;
        public bool Ready;
        readonly object lockObject = new object();
        List<Action<Writer>> recvEvents = new List<Action<Writer>>();
        NetworkStream networkStream;
        BufferedStream bufferedStream;
        readonly IPEndPoint endPoint;

        public RpcClientForUnity(IPEndPoint end)
        {
            endPoint = end;
        }

        public void Stop()
        {
            Ready = false;
        }

        public IEnumerator Start()
        {
            using (var client = new TcpClient())
            {
                client.Connect(endPoint);
                using (networkStream = client.GetStream())
                using (bufferedStream = new BufferedStream(networkStream))
                {
                    Ready = true;

                    ThreadPool.QueueUserWorkItem(new WaitCallback(_ => recvLoop()));

                    while (true)
                    {
                        while (recvEvents.Count == 0)
                        {
                            if(Ready)
                            {
                                yield return null;
                            }
                            else
                            {
                                yield break;
                            }
                        }

                        List<Action<Writer>> xs;
                        lock (lockObject)
                        {
                            xs = recvEvents;
                            recvEvents = new List<Action<Writer>>();
                        }

                        foreach (var x in xs)
                        {
                            x(Writer);
                        }
                        Flush();
                        yield return null;
                    }
                }
            }
        }

        public void Flush()
        {
            if (!Ready)
            {
                return;
            }

            try
            {
                var length = (int)Writer.Stream.Position;
                if (length > 0)
                {
                    Writer.Stream.Position = 0;
                    networkStream.Write(Writer.Stream.GetBuffer(), 0, length);
                }
            }
            catch (Exception ex)
            {
                OnException(ex);
                Ready = false;
            }
        }

        void recvLoop()
        {
            try
            {
                Flush(); // send packet before connect start

                while (Ready)
                {
                    Reader.Stream = recv((int)RpcHeader.HeaderLength);
                    var header = Reader.ReadHeader();

                    Reader.Stream = recv((int)header.Length);
                    var action = Reader.Dispatch(header);

                    lock (lockObject)
                    {
                        recvEvents.Add(action);
                    }
                }
            }
            catch(Exception ex)
            {
                if(Ready)
                {
                    OnException(ex);
                }
            }
            finally
            {
                Ready = false;
            }
        }

        MemoryStream recv(int length)
        {
            var buf = new byte[length];
            int rest = length;
            while (rest > 0)
            {
                rest -= bufferedStream.Read(buf, 0, rest);
            }
            return new MemoryStream(buf, 0, length);
        }
    }
}