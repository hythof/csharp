using System;
using System.Threading.Tasks;

class Program
{
    static void Main()
    {
        run().Wait();
        Console.WriteLine("--");
        whenAny().Wait();
    }

    static async Task<int> run()
    {
        Console.WriteLine("1");
        await Task.Delay(1);
        Console.WriteLine("2");
        await Task.Delay(1).ConfigureAwait(false);
        Console.WriteLine("3");

        int n = 0;
        n += await inner();
        Console.WriteLine("4");
        n += await inner().ConfigureAwait(false);
        return n;
    }

    static async Task<int> inner()
    {
        await Task.Delay(1);
        return 1;
    }

    static async Task whenAny()
    {
        var tx = new Task[] {
            makeTask("task0", 1),
            makeTask("task1", 2),
            makeTask("task2", 3),
        };
        await Task.WhenAny(tx);
        for(int i=0; i<tx.Length; ++i)
        {
            var t = tx[i];
            Console.WriteLine("> task" + i + " IsCompleted:" + t.IsCompleted);
        }
        for(int i=0; i<tx.Length; ++i)
        {
            var t = tx[i];
            if(!t.IsCompleted)
            {
                await t;
                Console.WriteLine(">> await task " + i + " IsCompleted:" + t.IsCompleted);
            }
        }
    }

    static async Task makeTask(string name, int count)
    {
        Console.WriteLine(name + " begin");
        for(int i=0; i<count; ++i)
        {
            Console.WriteLine(name + " loop " + i);
            await Task.Delay(100).ConfigureAwait(false);
        }
        Console.WriteLine(name + " end");
    }

    static async Task checkCompleted(string name, Task t)
    {
        Console.WriteLine(name + " IsCompleted:" + t.IsCompleted);
        if(!t.IsCompleted)
        {
            await t;
            Console.WriteLine(name + " await " + t.IsCompleted);
        }
    }
}
