using System;
using System.Reflection;

class Demo
{
    public static void Main()
    {
        int[] xs = new int[]{1, 2, 3};
        foreach(var x in xs)
        {
            Console.WriteLine(x);
        }
        Update(xs);
        foreach(var x in xs)
        {
            Console.WriteLine(x);
        }
    }

    public static void Update(int[] xs)
    {
        xs[0] = xs[2];
    }
}
