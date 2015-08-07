using System;
using System.Linq;
using System.Threading;

static class Program
{
    public static void Main()
    {
        var worker = new Worker();
        Action<object> countup = _ => {
            ++worker.UnsafeCount;
            Interlocked.Increment(ref worker.SafeCount);
        };
        for(int i=0; i<1000000; ++i)
        {
            ThreadPool.QueueUserWorkItem(new WaitCallback(countup));
        }
        Thread.Sleep(1000);
        var result = String.Format(
                "unsafe={0}, safe={1}",
                worker.UnsafeCount,
                worker.SafeCount);
        Console.WriteLine(result);
    }
}

class Worker
{
    public int UnsafeCount = 0;
    public int SafeCount = 0;
}
