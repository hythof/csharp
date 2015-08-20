using NUnit.Framework;
using System;
using System.Net;
using System.Threading.Tasks;

namespace Rpc
{
    [TestFixture]
    public class TestRpcWithTcp
    {
        const int port = 9999;

        [Test]
        public void TestReadWrite()
        {
            testReadWrite().Wait();
        }

        async Task testReadWrite()
        {
            var packet = new Sender.FullType();
            Receiver.FullType recvPacket = null;
            Sender.FullType replyPacket = null;

            var end = new IPEndPoint(IPAddress.Loopback, port);
            var server = new RpcServer(end);
            var serverTask = server.Start((r, w) =>
                {
                    r.OnEcho = x => recvPacket = x;
                });
            var client = new RpcClientForUnity(end);
            client.Reader.OnEcho = x =>
            {
                replyPacket = x;
            };
            var clientTask = Task.Run(() =>
                {
                    var e = client.Start();
                    while (e.MoveNext())
                    {
                        // nothing
                    }
                });
            
            client.Writer.RequestEcho(packet);
            client.Flush();
            await Task.Delay(100).ConfigureAwait(false);
            client.Stop();
            server.Stop().Wait();
            await Task.Delay(100).ConfigureAwait(false);

            var expect = packet.ToString().Replace("null", "");
            Assert.IsNotNull(recvPacket, "recv packet");
            Assert.IsNotNull(replyPacket, "reply packet");
            Assert.AreEqual(expect, recvPacket.ToString());
            Assert.AreEqual(expect, replyPacket.ToString());
            Assert.True(await withTimeout(clientTask).ConfigureAwait(false), "wait stop client");
            Assert.True(await withTimeout(serverTask).ConfigureAwait(false), "wait stop server");
        }

        async Task<bool> withTimeout(Task t)
        {
            var timeout = Task.Delay(100);
            return timeout != await Task.WhenAny(timeout, t).ConfigureAwait(false);
        }
    }
}