using System;
using System.Collections;

public class Enumerator
{
    static IEnumerator loop1()
    {
        for(int i=0; i<10; i++)
        {
            yield return i;
        }
    }

    static IEnumerator loop2()
    {
        IEnumerator enumerator = loop1();
        while(enumerator.MoveNext())
        {
            yield return enumerator.Current;
        }
        yield return "one more";
    }

    static void Main()
    {
        IEnumerator enumerator = loop1();
        while(enumerator.MoveNext())
        {
            Console.WriteLine(enumerator.Current);
        }
        Console.WriteLine("--");

        enumerator = loop2();
        while(enumerator.MoveNext())
        {
            Console.WriteLine(enumerator.Current);
        }
    }
}
