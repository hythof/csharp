using System;
using System.Reflection;

class Demo
{
    public static void Main()
    {
        showString();
        Console.WriteLine("--");
        showInt();
        Console.WriteLine("--");
        showSingle();
        Console.WriteLine("--");
        showDouble();
        Console.WriteLine("--");
        showDecimal();
        Console.WriteLine("--");
        showBool();
        Console.WriteLine("--");
        showByte();
        Console.WriteLine("--");
        showChar();
        Console.WriteLine("--");
        showEnum();
        Console.WriteLine("--");
        showStruct();
    }

    public static void showString()
    {
        string a = string.Empty;
        String b = string.Empty;
        Console.WriteLine(a.GetType());
        Console.WriteLine(b.GetType());
        Console.WriteLine(a == b);
    }

    public static void showInt()
    {
        short a = 0;
        ushort b = 0;
        int c = 0;
        uint d = 0;
        long e = 0L;
        ulong f = 0L;
        Int16 g = 0;
        Int32 h = 0;
        Int64 i = 0;
        UInt16 j = 0;
        UInt32 k = 0;
        UInt64 l = 0;
        Console.WriteLine(a.GetType());
        Console.WriteLine(b.GetType());
        Console.WriteLine(c.GetType());
        Console.WriteLine(d.GetType());
        Console.WriteLine(e.GetType());
        Console.WriteLine(f.GetType());
        Console.WriteLine(g.GetType());
        Console.WriteLine(h.GetType());
        Console.WriteLine(i.GetType());
        Console.WriteLine(j.GetType());
        Console.WriteLine(k.GetType());
        Console.WriteLine(l.GetType());
    }

    public static void showSingle()
    {
        float a = 0f;
        Single b = 0f;
        Console.WriteLine(a.GetType());
        Console.WriteLine(b.GetType());
        Console.WriteLine(a == b);
    }

    public static void showDouble()
    {
        double a = 0d;
        Double b = 0d;
        Console.WriteLine(a.GetType());
        Console.WriteLine(b.GetType());
        Console.WriteLine(a == b);
    }

    public static void showDecimal()
    {
        decimal a = 0.1m;
        Decimal b = 0.1m;
        Console.WriteLine(a.GetType());
        Console.WriteLine(b.GetType());
        Console.WriteLine(a == b);
    }

    public static void showBool()
    {
        bool a = true;
        Boolean b = true;
        Console.WriteLine(a.GetType());
        Console.WriteLine(b.GetType());
        Console.WriteLine(a == b);
    }

    public static void showByte()
    {
        byte a = 0;
        Byte b = 0;
        sbyte c = 0;
        SByte d = 0;
        Console.WriteLine(a.GetType());
        Console.WriteLine(b.GetType());
        Console.WriteLine(c.GetType());
        Console.WriteLine(d.GetType());
        Console.WriteLine(a == b);
        Console.WriteLine(a == b);
        Console.WriteLine(a == c);
        Console.WriteLine(a == d);
        Console.WriteLine(b == b);
        Console.WriteLine(b == c);
        Console.WriteLine(b == d);
        Console.WriteLine(c == d);
    }

    public static void showChar()
    {
        char a = 'a';
        Char b = 'a';
        Console.WriteLine(a.GetType());
        Console.WriteLine(b.GetType());
        Console.WriteLine(a == b);
    }

    enum EnumA { A };
    enum EnumB { B };
    public static void showEnum()
    {
        EnumA a = EnumA.A;
        EnumB b = EnumB.B;
        Console.WriteLine(a);
        Console.WriteLine(b);
        Console.WriteLine(a.GetType());
        Console.WriteLine(b.GetType());
        // Console.WriteLine(a == b); // Can't comparable
    }

    struct StructA { int a; }
    struct StructB { int a; }
    struct StructC { int c; }
    public static void showStruct()
    {
        StructA a = new StructA();
        StructB b = new StructB();
        StructC c = new StructC();
        Console.WriteLine(a);
        Console.WriteLine(b);
        Console.WriteLine(c);
        Console.WriteLine(a.GetType());
        Console.WriteLine(b.GetType());
        Console.WriteLine(c.GetType());
        // Console.WriteLine(a == b); // Can't comparable
        // Console.WriteLine(a == c); // Can't comparabl;
        // Console.WriteLine(b == c); // Can't comparabl;
    }
}
