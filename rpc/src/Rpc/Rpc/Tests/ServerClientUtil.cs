using NUnit.Framework;
using System;
using System.IO;

namespace Rpc
{
    public class ServerClientUtil
    {
        public ServerUtil Server = new ServerUtil();
        public ClientUtil Client = new ClientUtil();

        public class ServerUtil
        {
            public Receiver.Writer Writer = new Receiver.Writer();
            public Receiver.Reader Reader = new Receiver.Reader();

            public MemoryStream Reply(Sender.Writer w, int count)
            {
                var pos = w.Stream.Position;
                var buf = new Receiver.Writer();
                w.Stream.Position = 0;
                w.Stream.CopyTo(Reader.Stream);
                Reader.Stream.Position = 0;

                for (int i = 0; i < count; ++i)
                {
                    var header = Reader.ReadHeader();
                    Reader.Dispatch(header)(buf);
                }

                Assert.AreEqual(pos, buf.Stream.Position);
                Assert.AreEqual(pos, buf.Stream.Length);

                return buf.Stream;
            }
        }

        public class ClientUtil
        {
            public Sender.Writer Writer = new Sender.Writer();
            public Sender.Reader Reader = new Sender.Reader();

            public void Recv(MemoryStream m, int count)
            {
                var w = new Sender.Writer();
                Assert.True(m.Length > 0);
                m.Position = 0;
                m.CopyTo(Reader.Stream);
                Reader.Stream.Position = 0;

                for (int i = 0; i < count; ++i)
                {
                    var header = Reader.ReadHeader();
                    Reader.Dispatch(header)(w);
                }

                Assert.AreEqual(m.Length, Reader.Stream.Length);
                Assert.AreEqual(0, w.Stream.Position);
                Assert.AreEqual(0, w.Stream.Length);
            }
        }

        public void Communicate(int send, int recv)
        {
            var m = Server.Reply(Client.Writer, send);
            Client.Recv(m, recv);
        }
    }
}