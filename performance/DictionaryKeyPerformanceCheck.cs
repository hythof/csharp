using System;
using System.Linq;
using System.Diagnostics;
using System.Collections.Generic;

public class DictionaryKeyPerformanceCheck
{
    const int benchmarkTestCount = 1000;
    const int hitTestCount = 1000;

    class Member : IEquatable<Member>
    {  
        public string name;
        public int age;
        public Member(string name_, int age_)
        {
            name = name_;
            age = age_;
        }

        public override int GetHashCode()
        {
            return age;
        }

        public override bool Equals(object o)
        {
            return Equals(o);
        }

        public bool Equals(Member a)
        {
            return name == a.name && age == a.age;
        }
    }

    static Dictionary<T, Member> caseNew<T>(Func<int, T> convert)
    {
        var dict = new Dictionary<T, Member>();
        dict[convert(0)] = new Member("hit", 30);
        for(int i=1; i<hitTestCount; ++i)
        {
            T key = convert(i);
            dict[key] = new Member(i.ToString(), i);
        }
        return dict;
    }

    static int caseContainsKeyHit<T>(Func<int, T> convert, Dictionary<T, Member> dict)
    {
        int sum = 0;
        T key = convert(0);
        for(int i=0; i<hitTestCount; i++)
        {
            if(dict.ContainsKey(key))
            {
                sum += 1;
            }
        }
        return sum;
    }

    static int caseContainsKeyMiss<T>(Func<int, T> convert, Dictionary<T, Member> dict)
    {
        int sum = 0;
        T key = convert(-1);
        for(int i=0; i<hitTestCount; i++)
        {
            if(dict.ContainsKey(key))
            {
                sum += 1;
            }
        }
        return sum;
    }

    static int caseTryGetValueHit<T>(Func<int, T> convert, Dictionary<T, Member> dict)
    {
        int sum = 0;
        T key = convert(0);
        Member v;
        for(int i=0; i<hitTestCount; i++)
        {
            if(dict.TryGetValue(key, out v))
            {
                sum += v.age;
            }
        }
        return sum;
    }

    static int caseTryGetValueMiss<T>(Func<int, T> convert, Dictionary<T, Member> dict)
    {
        int sum = 0;
        T key = convert(-1);
        Member v;
        for(int i=0; i<hitTestCount; i++)
        {
            if(dict.TryGetValue(key, out v))
            {
                sum += v.age;
            }
        }
        return sum;
    }

    static int caseIndexHit<T>(Func<int, T> convert, Dictionary<T, Member> dict)
    {
        int sum = 0;
        T key = convert(0);
        for(int i=0; i<hitTestCount; i++)
        {
            sum += dict[key].age;
        }
        return sum;
    }

    static int caseIndexMiss<T>(Func<int, T> convert, Dictionary<T, Member> dict)
    {
        int sum = 0;
        T key = convert(-1);
        for(int i=0; i<hitTestCount; i++)
        {
            try
            {
                sum += dict[key].age;
            }
            catch(KeyNotFoundException)
            {
                // nothing
            }
        }
        return sum;
    }

    static int caseForeach<T>(Func<int, T> convert, Dictionary<T, Member> dict)
    {
        int sum = 0;
        foreach(var kv in dict)
        {
            sum += kv.Value.age;
        }
        return sum;
    }

    static int caseKeys<T>(Func<int, T> convert, Dictionary<T, Member> dict)
    {
        int sum = 0;
        foreach(var k in dict.Keys)
        {
            sum += 1;
        }
        return sum;
    }

    static int caseValues<T>(Func<int, T> convert, Dictionary<T, Member> dict)
    {
        int sum = 0;
        foreach(var v in dict.Values)
        {
            sum += v.age;
        }
        return sum;
    }

    static void Main()
    {
        show(
            calcScore<int>(x => x),
            calcScore<uint>(x => (uint)x),
            calcScore<long>(x => (long)x),
            calcScore<ulong>(x => (ulong)x),
            calcScore<string>(x => x.ToString()),
            calcScore<Member>(x => new Member(x.ToString(), x))
        );
    }

    static void show(params Score[] xs)
    {
        var keys = xs[0].Detail.Keys;
        var len = keys.Select(x => x.Length).OrderByDescending(x => x).First();
        var overviewFormat = "{0:0.0000}  {1}";
        var titleFormat = "{0,6}  ";
        var labelFormat = "{0, " + len + "}  ";
        var numberFormat = "{0:0.0000}  ";
        xs = xs.OrderBy(x => x.Total).ToArray();

        // show overview
        Console.WriteLine();
        foreach(var x in xs)
        {
            Console.WriteLine(string.Format(overviewFormat, x.Total, x.Title));
        }

        // show score header
        Console.WriteLine();
        int n = 0;
        Console.Write(string.Format(labelFormat, ""));
        foreach(var x in xs)
        {
            ++n;
            Console.Write(string.Format(titleFormat, n));
        }
        Console.WriteLine();

        // show score body
        foreach(var key in keys)
        {
            Console.Write(string.Format(labelFormat, key));
            foreach(var x in xs)
            {
                Console.Write(string.Format(numberFormat, x.Detail[key]));
            }
            Console.WriteLine();
        }
    }

    class Score
    {
        public string Title;
        public float Total;
        public Dictionary<string, float> Detail;
    }

    static Score calcScore<T>(Func<int, T> convert)
    {
        Console.WriteLine("benchmark " + typeof(T).ToString() + " ...");
        var dict = caseNew<T>(convert);
        var detail = new Dictionary<string, float>();
        detail["new"]               = benchmark(() => caseNew<T>(convert));
        detail["ContainsKey(hit)"]  = benchmark(() => caseContainsKeyHit<T>(convert, dict));
        detail["ContainsKey(miss)"] = benchmark(() => caseContainsKeyMiss<T>(convert, dict));
        detail["TryGetValue(hit)"]  = benchmark(() => caseTryGetValueHit<T>(convert, dict));
        detail["TryGetValue(miss)"] = benchmark(() => caseTryGetValueMiss<T>(convert, dict));
        detail["[key](hit)"]        = benchmark(() => caseIndexHit<T>(convert, dict));
        detail["[key](miss)"]       = benchmark(() => caseIndexMiss<T>(convert, dict));
        detail["foreach"]           = benchmark(() => caseForeach<T>(convert, dict));
        detail["keys"]              = benchmark(() => caseKeys<T>(convert, dict));
        detail["values"]            = benchmark(() => caseValues<T>(convert, dict));
        return new Score() {
            Title = typeof(T).ToString(),
            Total = detail.Values.Sum(),
            Detail = detail
        };
    }

    private static float benchmark(Action action)
    {
        GC.Collect();
        action.Invoke();
        Stopwatch sw = Stopwatch.StartNew();
        for(int i=0; i<benchmarkTestCount; i++)
        {
            action.Invoke();
        }
        sw.Stop();
        return sw.ElapsedMilliseconds / (float)benchmarkTestCount;
    }
}
