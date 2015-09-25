using System;

public class Program
{
    public static void Main()
    {
        int tick = short.MaxValue;
        float f = 0;
        int i = 0;
        while(true)
        {
            f+=tick;
            i+=tick;
            Console.WriteLine("{0} | {1} | {2:0}", i, f, f);
            if(float.MaxValue - f <= 1)
            {
                break;
            }
        }
    }
}
