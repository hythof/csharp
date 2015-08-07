using System;
using System.Linq;
using System.Collections.Generic;

public class IEnumerableTest
{
    public static void Main()
    {
        int [,] ary = new int[3, 3] {
            {1, 2, 3},
            {4, 5, 6},
            {7, 8, 9}
        };
        Console.WriteLine(ary[1]);
        foreach(var x in ary.Cast<int>())
        {
            Console.WriteLine(x);
        }
    }
}
