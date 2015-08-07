using System;
using System.Reflection;

class Target
{
    public static int Mul(int a, int b)
    {
        return a * b;
    }
    public int Add(int a, int b)
    {
        return a + b;
    }
    private int Sub(int a, int b)
    {
        return a - b;
    }
}


class Method
{
    public static void Main()
    {
        Target t = new Target();
        int a = t.Add(1,2);
        int b = (int)t.GetType().GetMethod("Add").Invoke(t, new object[]{ 1, 2 });
        int c = (int)t.GetType().GetMethod("Sub", BindingFlags.NonPublic | BindingFlags.Instance).Invoke(t, new object[]{ 4, 3 });
        int d = (int)typeof(Target).GetMethod("Mul", BindingFlags.Public | BindingFlags.Static).Invoke(null, new object[]{ 2, 5 });
        Console.WriteLine("1 + 2 = " + a);
        Console.WriteLine("1 + 2 = " + b);
        Console.WriteLine("4 - 3 = " + c);
        Console.WriteLine("2 * 5 = " + d);
    }
}
