using System;
using System.Linq;
using System.Collections.Generic;

static class Program
{
    public static void Main()
    {
        var shell = new Shell();
        string cmd = string.Empty;
        while(true)
        {
            Console.Write("> ");
            cmd = Console.ReadLine();
            if(cmd == null || cmd == "quit" || cmd == "exit")
            {
                return;
            }

            try
            {
                var success = shell.Command(cmd);
                if(!success)
                {
                    Console.WriteLine("Invalid command " + cmd);
                }
            }
            catch(Exception ex)
            {
                Console.WriteLine(cmd);
                Console.WriteLine(ex);
            }
        }
    }
}

class Shell
{
    List<byte[]> allocs = new List<byte[]>();

    public bool Command(string cmd)
    {
        var commands = cmd.Split(' ');
        var command = commands[0];
        var args = commands.Skip(1).ToArray();
        int number;
        if(command == "alloc" && args.Length > 0 && int.TryParse(args[0], out number))
        {
            var alloc = new byte[number];
            for(int i=0; i<number; ++i)
            {
                alloc[i] = (byte)(i % byte.MaxValue);
            }
            allocs.Add(alloc);
            return true;
        }
        else if(command == "show")
        {
            Console.WriteLine("GetTotalMemory " + GC.GetTotalMemory(false));
            foreach(var alloc in allocs)
            {
                Console.WriteLine("alloc " + alloc.Length);
            }
            return true;
        }
        else if(command == "free")
        {
            allocs.Clear();
            return true;
        }
        else if (command == "gc")
        {
            GC.Collect();
            return true;
        }
        else if (command == "run"  && args.Length > 0 && int.TryParse(args[0], out number))
        {
            var list = new List<byte[]>();
            for(int i=0; i<number; ++i)
            {
                list.Add(new byte[1000 * 1000]);
            }
            return true;
        }
        else if (command == "loop")
        {
            int x = 0;
            for(int i=0; i<int.MaxValue; ++i)
            {
                ++x;
            }
            return true;
        }
        return false;
    }
}
