using System;
using System.Threading;
using System.Threading.Tasks;

class Program
{
    static object lockObject1 = new object();
    static object lockObject2 = new object();

    public static void Main()
    {
        lock(lockObject1)
        {
            Console.WriteLine("thread0: get outer lock 1");
            lock(lockObject1)
            {
                Console.WriteLine("thread0: get inner lock 1");
            }
        }
        bool thread1 = false;
        bool thread2 = false;
        Task.Run(() => {
            lock(lockObject1)
            {
                Console.WriteLine("thread1: get outer lock 1");
                Thread.Sleep(1000);
                lock(lockObject2)
                {
                    Console.WriteLine("thread1: deadlock never reached");
                    thread1 = true;
                }
            }
            });
        Task.Run(() => {
            lock(lockObject2)
            {
                Console.WriteLine("thread2: get outer lock 2");
                Thread.Sleep(1000);
                lock(lockObject1)
                {
                    Console.WriteLine("thread2: deadlock never reached");
                    thread2 = true;
                }
            }
            });
        Thread.Sleep(10000);
        Console.WriteLine(string.Format("thread1={0} thread2={1}", thread1, thread2));
    }
}
