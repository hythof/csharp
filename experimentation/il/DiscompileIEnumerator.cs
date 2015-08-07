using System;
using System.Collections;

class Target
{
    public IEnumerator Loop()
    {
        for(int i=0; i<10; ++i)
        {
            yield return i;
        }
    }
}

class Program
{
    static void Main()
    {
        var t = new Target();
        for(var e=t.Loop(); e.MoveNext();)
        {
            Console.WriteLine(e.Current);
        }
    }
}
