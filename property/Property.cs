using System;

public class SecondsFormat
{
    class P
    {
        public string Name { get; private set; }
        public void Setup()
        {
            Name = "foo";
        }
    }

    public static void Main()
    {
        var p = new P();
        Console.WriteLine(p.Name);
        Console.WriteLine(p.Name == null);
        p.Setup();
        Console.WriteLine(p.Name);
    }

}
