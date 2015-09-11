using System;
using System.Threading.Tasks;

class Program
{
    static object lockObject = new object();

    public static void Main()
    {
        work().Wait();
    }

    static async Task work()
    {
        await Task.Delay(1);
        lock(lockObject)
        {
            await Task.Delay(1);
        }
    }
}

