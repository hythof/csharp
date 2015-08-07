using System;

public class SecondsFormat
{
    public static void Main()
    {
        check(0);
        check(60);
        check(60 * 60);
        check(60 * 60 * 24);
        check(60 * 60 * 24 * 13);
    }

    static void check(int n)
    {
        show(n - 1);
        show(n);
        show(n + 1);
    }

    static void show(int n)
    {
        Console.WriteLine(string.Format("{0}: {1}", n, secondsToTime(n)));
    }

    static string secondsToTime(int n)
    {
        if (n < 0)
        {
            return "0秒";
        }
        else if (n < 60)
        {
            return n + "秒";
        }
        else if (n < 60 * 60)
        {
            return (n / 60) + "分";
        }
        else if (n < 60 * 60 * 24)
        {
            return (n / 60 / 60) + "時";
        }
        else
        {
            return (n / 60 / 60 / 24) + "日";
        }
    }
}
