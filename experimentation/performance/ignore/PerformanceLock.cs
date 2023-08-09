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
    const int concurrency = 10;
    const int count = 1000 * 1000;
    int index;

    public void Run()
    {
        ThreadPool.SetMinThreads(concurrency, concurrency);
        ThreadPool.SetMaxThreads(concurrency, concurrency);
        Console.WriteLine(string.Format("concurrency {0:n0}", concurrency));
        Console.WriteLine(string.Format("count       {0:n0}", count));
        bench("unsafe                ", broken);
        bench("interlocked           ", interlocked);
        bench("lock                  ", lock_);
        bench("semaphoreSlim         ", semaphoreSlim);
        bench("semaphore             ", semaphore);
        bench("mutex                 ", mutex);
    }

    void bench(string name, Action<int[]> f)
    {
        var s = Stopwatch.StartNew();
        index = -1;
        var length = count * concurrency;
        var xs = new int[length];
        var tasks = Enumerable.Range(1, concurrency).Select(async _ => {
                    await Task.Delay(1).ConfigureAwait(false);
                    for(int i=0; i<count; ++i)
                    {
                        f(xs);
                    }
                }).ToArray();
        Task.WaitAll(tasks);
        Console.WriteLine("{0}: {1:n0} / sec ({2:n0} msec) | {3} {4}",
                name,
                (count * 1000) / s.ElapsedMilliseconds,
                s.ElapsedMilliseconds,
                xs.All(x => x == 1),
                length == (1 + index));
    }

    void broken(int[] xs)
    {
        var n = ++index;
        xs[n]++;
    }

    void interlocked(int[] xs)
    {
        var n = Interlocked.Increment(ref index);
        xs[n]++;
    }

    object lockObject = new object();
    void lock_(int[] xs)
    {
        lock(lockObject)
        {
            var n = ++index;
            xs[n]++;
        }
    }

    Semaphore sem = new Semaphore(1, 1);
    void semaphore(int[] xs)
    {
        sem.WaitOne();
        try
        {
            var n = ++index;
            xs[n]++;
        }
        finally
        {
            sem.Release();
        }
    }

    SemaphoreSlim semSlim = new SemaphoreSlim(1, 1);
    void semaphoreSlim(int[] xs)
    {
        semSlim.Wait();
        try
        {
            var n = ++index;
            xs[n]++;
        }
        finally
        {
            semSlim.Release();
        }
    }

    Mutex mut = new Mutex();
    void mutex(int[] xs)
    {
        mut.WaitOne();
        try
        {
            var n = ++index;
            xs[n]++;
        }
        finally
        {
            mut.ReleaseMutex();
        }
    }
}
