using System;
using System.Diagnostics;

class Demo
{
    public static void Main()
    {
        Console.WriteLine("-- is reference of array '=' --");
        check<string>("hello", "world", "override");
        check<int>(1, 2, 3);

        Console.WriteLine("-- memory test --");
        showMemory("before");
        var xs1 = new byte[100 * 1024 * 1024]; // make 100MB
        showMemory("create array");
        var xs2 = xs1; // maybe ref
        showMemory("xs2 = xs1");
        for(int i=0; i<xs1.Length; ++i)
        {
            xs2[i] += 1;
        }
        showMemory("update xs2"); // check write copy
        var xs3 = xs2; // maybe ref
        showMemory("xs3 = xs2"); // check write copy
        for(int i=0; i<xs1.Length; ++i)
        {
            xs3[i] += 1;
        }
        showMemory("update xs3"); // check write copy
        Console.WriteLine(xs1[0] + " : " + xs2[0] + " : " + xs3[0]);
    }

    static void showMemory(string msg)
    {
        var p = Process.GetCurrentProcess();
        p.Refresh();
        Console.WriteLine((p.WorkingSet64 / 1024 / 1024) + "MB: " + msg);
    }

    static void check<T>(T v1, T v2, T v3)
    {
        T[] a = new T[] { v1, v2 };
        T[] b = a;
        b[0] = v3;
        Console.WriteLine(string.Join(" ", a)); // v3, v2
        Console.WriteLine(string.Join(" ", b)); // v3, v2
        Console.WriteLine(a.GetHashCode());
        Console.WriteLine(b.GetHashCode());
        Console.WriteLine(a[0].GetHashCode());
        Console.WriteLine(b[0].GetHashCode());
    }
}
