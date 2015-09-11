using System;
using System.Linq;
using System.Diagnostics;
using System.Threading;
using System.Threading.Tasks;

class Program
{
    public static void Main()
    {
        new BenchmarkLock().Run();
    }
}

class BenchmarkLock
{
    const int concurrency = 128;
    const int count = 1000;
    int index;

    public void Run()
    {
        ThreadPool.SetMinThreads(concurrency, concurrency);
        ThreadPool.SetMaxThreads(concurrency, concurrency);
        Console.WriteLine(string.Format("concurrency {0:n0}", concurrency));
        Console.WriteLine(string.Format("count       {0:n0}", count));
        bench("interlocked           ", interlocked);
        bench("lock                  ", lock_);
    }

    void bench(string name, Action<int[]> f)
    {
        var s = Stopwatch.StartNew();
        index = -1;
        var length = count * concurrency;
        var xs = new int[length];
        var tasks = Enumerable.Range(1, concurrency).Select(async _ => {
                await Task.Delay(1).ConfigureAwait(false);
                f(xs);
            }).ToArray();
        Task.WaitAll(tasks);
        Console.WriteLine("{0}: {1:n0} / sec ({2:n0} msec) | {3} {4}",
                name,
                (count * 1000) / s.ElapsedMilliseconds,
                s.ElapsedMilliseconds,
                xs.All(x => x == 1),
                length == (1 + index));
    }

    void interlocked(int[] xs)
    {
        for(int i=0; i<count; ++i)
        {
            var n = Interlocked.Increment(ref index);
            xs[n]++;
        }
    }

    object lockObject = new object();
    void lock_(int[] xs)
    {
        lock(lockObject)
        {
            for(int i=0; i<count; ++i)
            {
                var n = ++index;
                xs[n]++;
            }
        }
    }
}
