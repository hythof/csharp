using System;

class Test
{
    public static void Main()
    {
        Console.WriteLine(DateTime.Parse("2014-11-27 18:23:25.652532+09:00"));
        Console.WriteLine(DateTime.Parse("2014-11-27 18:23:25.652532+00:00"));
        Console.WriteLine(DateTime.Parse("2014-11-27 18:23:25.652532+09:00").ToUniversalTime());
        Console.WriteLine(DateTime.Parse("2014-11-27 18:23:25.652532+00:00").ToUniversalTime());
        var dt1 = DateTime.Now;
        var dt2 = dt1.AddHours(1f);
        Console.WriteLine(DateTime.Now);
        Console.WriteLine(dt1);
        Console.WriteLine(dt2);
    }
}
