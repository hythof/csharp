using NUnit.Framework;
using System;
using System.IO;

namespace BinaryPacker
{
    [TestFixture()]
    public class Test
    {
        readonly string maxString = new string('a', 1024 * 1024);

        [Test()]
        public void TestMin()
        {
            for (int i = 0; i < 3; ++i)
            {
                var m = new MemoryStream();
                var w = new BinaryPackerWriter(m);
                var r = new BinaryPackerReader(m);
                writeMin(i, w);
                m.Seek(0, SeekOrigin.Begin);
                readMin(i, r);
                Assert.AreEqual(m.Length, m.Position);
            }
        }

        [Test()]
        public void TestMax()
        {
            for (int i = 0; i < 3; ++i)
            {
                var m = new MemoryStream();
                var w = new BinaryPackerWriter(m);
                var r = new BinaryPackerReader(m);
                writeMax(i, w);
                m.Seek(0, SeekOrigin.Begin);
                readMax(i, r);
                Assert.AreEqual(m.Length, m.Position);
            }
        }

        [Test()]
        public void TestLongStream()
        {
            var m = new MemoryStream();
            var w = new BinaryPackerWriter(m);
            var r = new BinaryPackerReader(m);
            long pos;

            for (int i = 0; i < 3; ++i)
            {
                pos = m.Position;
                writeMin(i, w);
                m.Seek(pos, SeekOrigin.Begin);
                readMin(i, r);

                pos = m.Position;
                writeMax(i, w);
                m.Seek(pos, SeekOrigin.Begin);
                readMax(i, r);

                Assert.AreEqual(m.Length, m.Position);
            }
        }

        void readMin(int n, BinaryPackerReader r)
        {
            Assert.AreEqual(makeArray<byte>(n, byte.MinValue), r.ReadByteArray());
            Assert.AreEqual(makeArray<Int16>(n, Int16.MinValue), r.ReadInt16Array());
            Assert.AreEqual(makeArray<Int32>(n, Int32.MinValue), r.ReadInt32Array());
            Assert.AreEqual(makeArray<Int64>(n, Int64.MinValue), r.ReadInt64Array());
            Assert.AreEqual(makeArray<UInt16>(n, UInt16.MinValue), r.ReadInt16Array());
            Assert.AreEqual(makeArray<UInt32>(n, UInt32.MinValue), r.ReadInt32Array());
            Assert.AreEqual(makeArray<UInt64>(n, UInt64.MinValue), r.ReadInt64Array());
            Assert.AreEqual(makeArray<Single>(n, Single.MinValue), r.ReadSingleArray());
            Assert.AreEqual(makeArray<Double>(n, Double.MinValue), r.ReadDoubleArray());
            Assert.AreEqual(makeArray<Boolean>(n, false), r.ReadBooleanArray());
            Assert.AreEqual(makeArray<String>(n, ""), r.ReadStringArray());
        }

        void readMax(int n, BinaryPackerReader r)
        {
            Assert.AreEqual(makeArray<byte>(n, byte.MaxValue), r.ReadByteArray());
            Assert.AreEqual(makeArray<Int16>(n, Int16.MaxValue), r.ReadInt16Array());
            Assert.AreEqual(makeArray<Int32>(n, Int32.MaxValue), r.ReadInt32Array());
            Assert.AreEqual(makeArray<Int64>(n, Int64.MaxValue), r.ReadInt64Array());
            Assert.AreEqual(makeArray<UInt16>(n, UInt16.MaxValue), r.ReadUInt16Array());
            Assert.AreEqual(makeArray<UInt32>(n, UInt32.MaxValue), r.ReadUInt32Array());
            Assert.AreEqual(makeArray<UInt64>(n, UInt64.MaxValue), r.ReadUInt64Array());
            Assert.AreEqual(makeArray<Single>(n, Single.MaxValue), r.ReadSingleArray());
            Assert.AreEqual(makeArray<Double>(n, Double.MaxValue), r.ReadDoubleArray());
            Assert.AreEqual(makeArray<Boolean>(n, true), r.ReadBooleanArray());
            Assert.AreEqual(makeArray<String>(n, maxString), r.ReadStringArray());
        }

        void writeMin(int n, BinaryPackerWriter w)
        {
            w.WriteArray(makeArray<byte>(n, byte.MinValue));
            w.WriteArray(makeArray<Int16>(n, Int16.MinValue));
            w.WriteArray(makeArray<Int32>(n, Int32.MinValue));
            w.WriteArray(makeArray<Int64>(n, Int64.MinValue));
            w.WriteArray(makeArray<UInt16>(n, UInt16.MinValue));
            w.WriteArray(makeArray<UInt32>(n, UInt32.MinValue));
            w.WriteArray(makeArray<UInt64>(n, UInt64.MinValue));
            w.WriteArray(makeArray<Single>(n, Single.MinValue));
            w.WriteArray(makeArray<Double>(n, Double.MinValue));
            w.WriteArray(makeArray<Boolean>(n, false));
            w.WriteArray(makeArray<String>(n, ""));
        }

        void writeMax(int n, BinaryPackerWriter w)
        {
            w.WriteArray(makeArray<byte>(n, byte.MaxValue));
            w.WriteArray(makeArray<Int16>(n, Int16.MaxValue));
            w.WriteArray(makeArray<Int32>(n, Int32.MaxValue));
            w.WriteArray(makeArray<Int64>(n, Int64.MaxValue));
            w.WriteArray(makeArray<UInt16>(n, UInt16.MaxValue));
            w.WriteArray(makeArray<UInt32>(n, UInt32.MaxValue));
            w.WriteArray(makeArray<UInt64>(n, UInt64.MaxValue));
            w.WriteArray(makeArray<Single>(n, Single.MaxValue));
            w.WriteArray(makeArray<Double>(n, Double.MaxValue));
            w.WriteArray(makeArray<Boolean>(n, true));
            w.WriteArray(makeArray<String>(n, maxString));
        }

        T[] makeArray<T>(int count, T v)
        {
            T[] xs = new T[count];
            for (int i = 0; i < count; ++i)
            {
                xs[i] = v;
            }
            return xs;
        }
    }
}

