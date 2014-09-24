using System;
using System.Collections.Generic;

class Demo
{
    public static void Main()
    {
        List<string> xs = new List<string>();
        xs.Add("hello");
        xs.Add("world");
        string[] ys = xs.ToArray();
        ys[0] = "hi";
        Console.WriteLine(string.Join(" ", xs));
        Console.WriteLine(string.Join(" ", ys));
        Console.WriteLine(xs[0].GetHashCode());
        Console.WriteLine(ys[0].GetHashCode());
        Console.WriteLine(xs[1].GetHashCode());
        Console.WriteLine(ys[1].GetHashCode());
    }
}
