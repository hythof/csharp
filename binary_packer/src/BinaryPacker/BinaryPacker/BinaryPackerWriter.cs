namespace BinaryPacker
{
    using System;
    using System.IO;

    class BinaryPackerWriter : BinaryWriter
    {
        public BinaryPackerWriter(Stream s) : base(s)
        {
        }

        public void WriteArray(Byte[] xs)
        {
            Write7BitEncodedInt(xs.Length);
            foreach(var x in xs)
            {
                Write(x);
            }
        }

        public void WriteArray(Int16[] xs)
        {
            Write7BitEncodedInt(xs.Length);
            foreach(var x in xs)
            {
                Write(x);
            }
        }

        public void WriteArray(Int32[] xs)
        {
            Write7BitEncodedInt(xs.Length);
            foreach(var x in xs)
            {
                Write(x);
            }
        }

        public void WriteArray(Int64[] xs)
        {
            Write7BitEncodedInt(xs.Length);
            foreach(var x in xs)
            {
                Write(x);
            }
        }

        public void WriteArray(UInt16[] xs)
        {
            Write7BitEncodedInt(xs.Length);
            foreach(var x in xs)
            {
                Write(x);
            }
        }

        public void WriteArray(UInt32[] xs)
        {
            Write7BitEncodedInt(xs.Length);
            foreach(var x in xs)
            {
                Write(x);
            }
        }

        public void WriteArray(UInt64[] xs)
        {
            Write7BitEncodedInt(xs.Length);
            foreach(var x in xs)
            {
                Write(x);
            }
        }

        public void WriteArray(Single[] xs)
        {
            Write7BitEncodedInt(xs.Length);
            foreach(var x in xs)
            {
                Write(x);
            }
        }

        public void WriteArray(Double[] xs)
        {
            Write7BitEncodedInt(xs.Length);
            foreach(var x in xs)
            {
                Write(x);
            }
        }

        public void WriteArray(Boolean[] xs)
        {
            Write7BitEncodedInt(xs.Length);
            foreach(var x in xs)
            {
                Write(x);
            }
        }

        public void WriteArray(String[] xs)
        {
            Write7BitEncodedInt(xs.Length);
            foreach(var x in xs)
            {
                Write(x);
            }
        }
    }
}