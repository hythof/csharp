using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using System.Reflection;
using System.Diagnostics;

/*
 * % make
 * wait 1094msec
 * await 102msec
 * 
 * % mono --version
 * Mono JIT compiler version 4.0.3 (Stable 4.0.3.20/d6946b4 Tue Aug  4 09:43:57 UTC 2015)
 * Copyright (C) 2002-2014 Novell, Inc, Xamarin Inc and Contributors. www.mono-project.com
 *     TLS:           __thread
 *     SIGSEGV:       altstack
 *     Notifications: epoll
 *     Architecture:  amd64
 *     Disabled:      none
 *     Misc:          softdebug 
 *     LLVM:          supported, not enabled.
 *     GC:            sgen
*/

public class WaitBehabiour
{
    static readonly List<int> loop = Enumerable.Range(1, 10).ToList();

    public static void Main()
    {
        time("wait", waitCase);
        time("await", awaitCase);
    }

    static void time(string name, Func<int> f)
    {
        var t = Stopwatch.StartNew();
        f();
        t.Stop();
        Console.WriteLine("{0} {1}msec", name, t.ElapsedMilliseconds);
    }

    static int waitCase()
    {
        var xs = loop.Select(_ => {Task.Delay(100).Wait(); return 1;});
        return xs.Count();
    }

    static int awaitCase()
    {
        Task.WaitAll(loop.Select(_ => Task.Delay(100)).ToArray());
        return 1;
    }
}
