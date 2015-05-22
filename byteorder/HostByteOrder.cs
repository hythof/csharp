using System;
using System.IO;

static class Program
{
    public static void Main()
    {
        Console.WriteLine("byteorder = " + (BitConverter.IsLittleEndian ? "little" : "big"));

        int x = (1 << 24)
              + (2 << 16)
              + (3 <<  8)
              + 4;
        Console.WriteLine("int = " + x);
        Console.WriteLine("int dump = " + BitConverter.ToString(BitConverter.GetBytes(x), 0));

        using(var m = new MemoryStream())
        {
            using(var w = new BinaryWriter(m))
            {
                w.Write(x);
                m.Seek(0, SeekOrigin.Begin);
                var buf = m.GetBuffer();
                Array.Resize(ref buf, 4);
                Console.WriteLine("read = " + BitConverter.ToInt32(buf, 0));
                Console.WriteLine("dump = " + BitConverter.ToString(buf, 0));
            }
        }
    }
}
