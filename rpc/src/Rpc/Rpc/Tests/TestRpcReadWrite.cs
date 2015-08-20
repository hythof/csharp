using NUnit.Framework;
using System;
using System.IO;

namespace Rpc
{
    [TestFixture]
    public class TestRpcReadWrite
    {
        [Test]
        public void TestReadWrite()
        {
            var util = new ServerClientUtil();
            var packet = new Sender.FullType();
            Receiver.FullType recvPacket = null;
            Sender.FullType replyPacket = null;
            util.Server.Reader.OnEcho = x => recvPacket = x;
            util.Client.Reader.OnEcho = x =>
            {
                replyPacket = x;
            };

            util.Client.Writer.RequestEcho(packet);
            util.Communicate(1, 1);

            var expect = packet.ToString().Replace("null", "");
            Assert.AreEqual(expect, recvPacket.ToString());
            Assert.AreEqual(expect, replyPacket.ToString());
        }
    }
}