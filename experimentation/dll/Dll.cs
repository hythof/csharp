using System;
using System.Collections.Generic;
using System.Threading.Tasks;

public class Dll
{
    public static int StaticCounter;

    public int Increment()
    {
        return ++StaticCounter;
    }

    public void Work(dynamic setter)
    {
        Task.Factory.StartNew(async () => {
            await Task.Delay(100).ConfigureAwait(false);
            setter.SetResult(new int[] { 1, 2, 3 });
        });
    }
}