using System;
using System.Linq;
using System.Collections.Generic;

public class Permutation
{
    public static IEnumerable<T[]> permutation<T>(IEnumerable<T> xs) where T : IComparable
    {
        return _permutation<T>(new List<T>(), xs);
    }
    
    private static IEnumerable<T[]> _permutation<T>(IEnumerable<T> xs, IEnumerable<T> ys) where T : IComparable
    {
        if(ys.Count() == 0)
        {
            yield return xs.ToArray();
        }
        else
        {
            foreach(var y in ys)
            {
                var list = xs.Concat(new T[]{ y });
                var rest = ys.Where(y2 => y2.CompareTo(y) != 0);
                var zs = _permutation (list, rest);
                foreach(var z in zs)
                {
                    yield return z;
                }
            }
        }
    }

    static void Main()
    {
        string[] pattern = new string[] { "foo", "bar", "hoge" };
        foreach(var xs in permutation<string>(pattern))
        {
            Console.WriteLine(string.Join(", ", xs));
        }
    }
}
