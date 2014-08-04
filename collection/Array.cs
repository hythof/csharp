using System;

class Demo
{
    public static void Main()
    {
        string[] a = new string[] { "hello", "world" };
        string[] b = a;
        b[0] = "hi";
        Console.WriteLine(string.Join(" ", a)); // hi world
        Console.WriteLine(string.Join(" ", b)); // hi world
        Console.WriteLine(a.GetHashCode());
        Console.WriteLine(b.GetHashCode());
        Console.WriteLine(a[0].GetHashCode());
        Console.WriteLine(b[0].GetHashCode());
    }
}
