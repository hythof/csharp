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

    static void loopArgument(System.Func<IEnumerator> func)
    {
        IEnumerator enumerator = func();
        while(enumerator.MoveNext())
        {
            Console.WriteLine(enumerator.Current);
        }
    }

    static void Main()
    {
        // case1
        IEnumerator enumerator = loop1();
        while(enumerator.MoveNext())
        {
            Console.WriteLine(enumerator.Current);
        }
        Console.WriteLine("--");

        // case2
        enumerator = loop2();
        while(enumerator.MoveNext())
        {
            Console.WriteLine(enumerator.Current);
        }

        // case3
        // *** Can't execution case
        // - error CS1624: The body of `Enumerator.Main()' cannot be an iterator block because `void' is not an iterator interface type
        // loopArgument(() => {
        //     for(int i=0; i<10; i++)
        //     {
        //         yield return i;
        //     }
        // });
    }
}
