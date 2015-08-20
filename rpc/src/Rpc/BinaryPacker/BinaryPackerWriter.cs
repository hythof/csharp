namespace BinaryPacker
{
    using System;
    using System.IO;

    public class BinaryPackerWriter : BinaryWriter
    {
        public BinaryPackerWriter(Stream s)
            : base(s)
        {
        }

        public override void Write(string value)
        {
            base.Write(value ?? "");
        }

        public override void Write(Byte[] xs)
        {
            if (xs == null)
            {
                Write7BitEncodedInt(0);
                return;
            }

            Write7BitEncodedInt(xs.Length);
            foreach (var x in xs)
            {
                Write(x);
            }
        }

        public void Write(Int16[] xs)
        {
            if (xs == null)
            {
                Write7BitEncodedInt(0);
                return;
            }

            Write7BitEncodedInt(xs.Length);
            foreach (var x in xs)
            {
                Write(x);
            }
        }

        public void Write(Int32[] xs)
        {
            if (xs == null)
            {
                Write7BitEncodedInt(0);
                return;
            }

            Write7BitEncodedInt(xs.Length);
            foreach (var x in xs)
            {
                Write(x);
            }
        }

        public void Write(Int64[] xs)
        {
            if (xs == null)
            {
                Write7BitEncodedInt(0);
                return;
            }

            Write7BitEncodedInt(xs.Length);
            foreach (var x in xs)
            {
                Write(x);
            }
        }

        public void Write(UInt16[] xs)
        {
            if (xs == null)
            {
                Write7BitEncodedInt(0);
                return;
            }

            Write7BitEncodedInt(xs.Length);
            foreach (var x in xs)
            {
                Write(x);
            }
        }

        public void Write(UInt32[] xs)
        {
            if (xs == null)
            {
                Write7BitEncodedInt(0);
                return;
            }

            Write7BitEncodedInt(xs.Length);
            foreach (var x in xs)
            {
                Write(x);
            }
        }

        public void Write(UInt64[] xs)
        {
            if (xs == null)
            {
                Write7BitEncodedInt(0);
                return;
            }

            Write7BitEncodedInt(xs.Length);
            foreach (var x in xs)
            {
                Write(x);
            }
        }

        public void Write(Single[] xs)
        {
            if (xs == null)
            {
                Write7BitEncodedInt(0);
                return;
            }

            Write7BitEncodedInt(xs.Length);
            foreach (var x in xs)
            {
                Write(x);
            }
        }

        public void Write(Double[] xs)
        {
            if (xs == null)
            {
                Write7BitEncodedInt(0);
                return;
            }

            Write7BitEncodedInt(xs.Length);
            foreach (var x in xs)
            {
                Write(x);
            }
        }

        public void Write(Boolean[] xs)
        {
            if (xs == null)
            {
                Write7BitEncodedInt(0);
                return;
            }

            Write7BitEncodedInt(xs.Length);
            foreach (var x in xs)
            {
                Write(x);
            }
        }

        public void Write(String[] xs)
        {
            if (xs == null)
            {
                Write7BitEncodedInt(0);
                return;
            }

            Write7BitEncodedInt(xs.Length);
            foreach (var x in xs)
            {
                Write(x);
            }
        }
    }
}