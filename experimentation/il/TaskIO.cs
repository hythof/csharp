using System;
using System.Threading.Tasks;

class DummyIO
{
    public int State = 0;

    public Task<int> Connect()
    {
        ++State;
        return Task<int>.Factory.FromAsync(begin, end, null);
    }

    IAsyncResult begin(AsyncCallback callback, object obj)
    {
        ++State;
        Console.WriteLine("call begin");
        var t = Task.Factory.StartNew(async () => {
            await Task.Delay(100).ConfigureAwait(false);
            callback(null);
        });
        t.ConfigureAwait(false);
        return null;
    }

    void beginCallback(IAsyncResult result)
    {
        ++State;
        Console.WriteLine("call beginCallback");
    }

    int end(IAsyncResult result)
    {
        ++State;
        Console.WriteLine("call end " + result);
        return 1;
    }
}

class Program
{
    static void Main()
    {
        run().Wait();
        Console.WriteLine(false);
        runWhenAny().Wait();
    }

    static async Task run()
    {
        var io = new DummyIO();
        var n = await io.Connect();
        Console.WriteLine("done " + io.State + " " + n);
    }

    static async Task runWhenAny()
    {
        var io = new DummyIO();
        var t1 = io.Connect();
        var t2 = Task.Delay(1);
        await Task.WhenAny(t1, t2);
        Console.WriteLine("done " + io.State);
        await Task.Delay(1000);
        Console.WriteLine("delay end");
        await t1;
    }
}
