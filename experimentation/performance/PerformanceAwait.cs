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
    }
}

class BenchmarkAsync
{
    const int concurrency = 10 * 1000;

    public void Run()
    {
        ThreadPool.SetMinThreads(concurrency, concurrency);
        ThreadPool.SetMaxThreads(concurrency, concurrency);
        Console.WriteLine(string.Format("concurrency {0:n0}", concurrency));
        bench("noasync1             ", noAsync1);
        bench("configureAwaitFalse1 ", configureAwaitFalse1);
        bench("configureAwaitTrue1  ", configureAwaitTrue1);
        bench("continueWith10       ", continueWith10);
        bench("configureAwaitFalse10", configureAwaitFalse10);
        bench("configureAwaitTrue10 ", configureAwaitTrue10);
    }

    void bench(string name, Func<Task> f)
    {
        var s = Stopwatch.StartNew();
        var tasks = Enumerable.Range(1, concurrency).Select(_ => f()).ToArray();
        Task.WaitAll(tasks);
        Console.WriteLine("{0}: {1:n0} / sec {2:n0} msec",
            name,
            (concurrency * 1000) / s.ElapsedMilliseconds,
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

    Task continueWith10()
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
