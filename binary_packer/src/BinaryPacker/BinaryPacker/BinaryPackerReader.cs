namespace BinaryPacker
{
    using System;
    using System.IO;

    class BinaryPackerReader : BinaryReader
    {
        public BinaryPackerReader(Stream s) : base(s)
        {
        }

        public Byte[] ReadByteArray()
        {
            int count = Read7BitEncodedInt();
            Byte[] xs = new Byte[count];
            for(int i=0; i<count; ++i)
            {
                xs[i] = ReadByte();
            }
            return xs;
        }

        public Int16[] ReadInt16Array()
        {
            int count = Read7BitEncodedInt();
            Int16[] xs = new Int16[count];
            for(int i=0; i<count; ++i)
            {
                xs[i] = ReadInt16();
            }
            return xs;
        }

        public Int32[] ReadInt32Array()
        {
            int count = Read7BitEncodedInt();
            Int32[] xs = new Int32[count];
            for(int i=0; i<count; ++i)
            {
                xs[i] = ReadInt32();
            }
            return xs;
        }

        public Int64[] ReadInt64Array()
        {
            int count = Read7BitEncodedInt();
            Int64[] xs = new Int64[count];
            for(int i=0; i<count; ++i)
            {
                xs[i] = ReadInt64();
            }
            return xs;
        }

        public UInt16[] ReadUInt16Array()
        {
            int count = Read7BitEncodedInt();
            UInt16[] xs = new UInt16[count];
            for(int i=0; i<count; ++i)
            {
                xs[i] = ReadUInt16();
            }
            return xs;
        }

        public UInt32[] ReadUInt32Array()
        {
            int count = Read7BitEncodedInt();
            UInt32[] xs = new UInt32[count];
            for(int i=0; i<count; ++i)
            {
                xs[i] = ReadUInt32();
            }
            return xs;
        }

        public UInt64[] ReadUInt64Array()
        {
            int count = Read7BitEncodedInt();
            UInt64[] xs = new UInt64[count];
            for(int i=0; i<count; ++i)
            {
                xs[i] = ReadUInt64();
            }
            return xs;
        }

        public Single[] ReadSingleArray()
        {
            int count = Read7BitEncodedInt();
            Single[] xs = new Single[count];
            for(int i=0; i<count; ++i)
            {
                xs[i] = ReadSingle();
            }
            return xs;
        }

        public Double[] ReadDoubleArray()
        {
            int count = Read7BitEncodedInt();
            Double[] xs = new Double[count];
            for(int i=0; i<count; ++i)
            {
                xs[i] = ReadDouble();
            }
            return xs;
        }

        public Boolean[] ReadBooleanArray()
        {
            int count = Read7BitEncodedInt();
            Boolean[] xs = new Boolean[count];
            for(int i=0; i<count; ++i)
            {
                xs[i] = ReadBoolean();
            }
            return xs;
        }

        public String[] ReadStringArray()
        {
            int count = Read7BitEncodedInt();
            String[] xs = new String[count];
            for(int i=0; i<count; ++i)
            {
                xs[i] = ReadString();
            }
            return xs;
        }
    }
}