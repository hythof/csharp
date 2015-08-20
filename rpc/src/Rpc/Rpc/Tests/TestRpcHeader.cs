using NUnit.Framework;
using System;

namespace Rpc
{
    [TestFixture]
    public class TestRpcHeader
    {
        [Test]
        public void TestPacketHeaderMinRequest()
        {
            var p = new RpcHeader(0);
            Assert.AreEqual(0, p.Request);
            Assert.AreEqual(0x8000000000000000, p.Response(0));
            Assert.AreEqual(0x80000000ffffffff, p.Response(uint.MaxValue));
            Assert.AreEqual(true, p.IsRequest);
            Assert.AreEqual(0, p.MethodId);
            Assert.AreEqual(0, p.PacketId);
            Assert.AreEqual(0, p.Length);
        }

        [Test]
        public void TestPacketHeaderMaxRequest()
        {
            var p = new RpcHeader(Int64.MaxValue);
            Assert.AreEqual(Int64.MaxValue, p.Request);
            Assert.AreEqual(0xffffffff00000000, p.Response(0));
            Assert.AreEqual(0xffffffffffffffff, p.Response(uint.MaxValue));
            Assert.AreEqual(true, p.IsRequest);
            Assert.AreEqual(Int16.MaxValue, p.MethodId);
            Assert.AreEqual(UInt16.MaxValue, p.PacketId);
            Assert.AreEqual(UInt32.MaxValue, p.Length);
        }

        [Test]
        public void TestPacketHeaderMinResponse()
        {
            var p = new RpcHeader(0x8000000000000000);
            Assert.AreEqual(0, p.Request);
            Assert.AreEqual(0x8000000000000000, p.Response(0));
            Assert.AreEqual(0x80000000ffffffff, p.Response(uint.MaxValue));
            Assert.AreEqual(false, p.IsRequest);
            Assert.AreEqual(0, p.MethodId);
            Assert.AreEqual(0, p.PacketId);
            Assert.AreEqual(0, p.Length);
        }

        [Test]
        public void TestPacketHeaderMaxResponse()
        {
            var p = new RpcHeader(UInt64.MaxValue);
            Assert.AreEqual(Int64.MaxValue, p.Request);
            Assert.AreEqual(0xffffffff00000000, p.Response(0));
            Assert.AreEqual(0xffffffffffffffff, p.Response(uint.MaxValue));
            Assert.AreEqual(false, p.IsRequest);
            Assert.AreEqual(Int16.MaxValue, p.MethodId);
            Assert.AreEqual(UInt16.MaxValue, p.PacketId);
            Assert.AreEqual(UInt32.MaxValue, p.Length);
        }

        [Test]
        public void TestPacketHeaderMakeMin()
        {
            var p = new RpcHeader(0, 0, 0);
            Assert.AreEqual(0, p.MethodId);
            Assert.AreEqual(0, p.PacketId);
            Assert.AreEqual(0, p.Length);
        }

        [Test]
        public void TestPacketHeaderMakeMax()
        {
            var p = new RpcHeader(uint.MaxValue, uint.MaxValue, uint.MaxValue);
            Assert.AreEqual(Int16.MaxValue, p.MethodId);
            Assert.AreEqual(UInt16.MaxValue, p.PacketId);
            Assert.AreEqual(UInt32.MaxValue, p.Length);
        }

        [Test]
        public void TestPacketHeaderMakeRoundMethodId()
        {
            var p1 = new RpcHeader(32767, 65535, 0);
            Assert.AreEqual(Int16.MaxValue, p1.MethodId);
            Assert.AreEqual(UInt16.MaxValue, p1.PacketId);

            var p2 = new RpcHeader(32767 + 1, 65535 + 1, 0);
            Assert.AreEqual(0, p2.MethodId);
            Assert.AreEqual(1, p2.PacketId);
        }
    }
}