using System;
using System.Diagnostics;

class Program
{
    static void Main()
    {
        sayHello();
    }

    [DebuggerHidden]
    static void sayHello()
    {
        Console.WriteLine("hello");
    }
}
