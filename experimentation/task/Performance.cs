using System;
using System.Linq;
using System.Diagnostics;
using System.Threading;
using System.Threading.Tasks;

class Program
{
    public static void Main()
    {
        new BenchmarkAsync().Run();
        new BenchmarkLock().Run();
    }
}

class BenchmarkAsync
{
    const int concurrency = 10 * 1000;

    public void Run()
    {
        ThreadPool.SetMinThreads(concurrency, concurrency);
        ThreadPool.SetMaxThreads(concurrency, concurrency);
        bench("noasync1             ", noAsync1);
        bench("configureAwaitFalse1 ", configureAwaitFalse1);
        bench("configureAwaitTrue1  ", configureAwaitTrue1);
        bench("noasync10            ", noAsync10);
        bench("configureAwaitFalse10", configureAwaitFalse10);
        bench("configureAwaitTrue10 ", configureAwaitTrue10);
    }

    void bench(string name, Func<Task> f)
    {
        var s = Stopwatch.StartNew();
        var tasks = Enumerable.Range(1, concurrency).Select(_ => f()).ToArray();
        Task.WaitAll(tasks);
        Console.WriteLine("{0}: {1} msec",
            name,
            s.ElapsedMilliseconds);
    }

    Task noAsync1()
    {
        return Task.Delay(1);
    }

    async Task configureAwaitTrue1()
    {
        await Task.Delay(1);
        await Task.Delay(1);
    }

    async Task configureAwaitFalse1()
    {
        await Task.Delay(1);
        await Task.Delay(1);
    }

    Task noAsync10()
    {
        Task t = Task.Delay(1);
        for(int i=1; i<10; ++i)
        {
            t = t.ContinueWith<Task>(_ => Task.Delay(1));
        }
        return t;
    }

    async Task configureAwaitTrue10()
    {
        for(int i=0; i<10; ++i)
        {
            await Task.Delay(1).ConfigureAwait(true);
        }
    }

    async Task configureAwaitFalse10()
    {
        for(int i=0; i<10; ++i)
        {
            await Task.Delay(1).ConfigureAwait(true);
        }
    }
}

class BenchmarkLock
{
    const int concurrency = 4;
    const int count = 1000 * 1000;
    int index;

    public void Run()
    {
        ThreadPool.SetMinThreads(concurrency, concurrency);
        ThreadPool.SetMaxThreads(concurrency, concurrency);
        bench("unsafe                ", broken);
        bench("interlocked           ", interlocked);
        bench("lock                  ", lock_);
        bench("semaphoreSlim         ", semaphoreSlim);
        bench("semaphore             ", semaphore);
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
        Console.WriteLine("{0}: {1} msec | {2} {3}",
                name,
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
}
