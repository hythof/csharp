using System;
using System.Threading;
using System.Reflection;

public class EntryPoint
{
    public static void Main()
    {
        loadAndRun("Dynamic1.dll");
        loadAndRun("Dynamic1.dll");
        loadAndRun("Dynamic2.dll");

        loadAndRunOnAppDomain("Dynamic1.dll");
        loadAndRunOnAppDomain("Dynamic1.dll");
        loadAndRunOnAppDomain("Dynamic2.dll");
    }

    static void loadAndRun(string name)
    {
        Assembly m = Assembly.LoadFrom(name); 
        var obj = Activator.CreateInstance(m.GetType("Dll")); 
        var logic = (dynamic)obj;
        Console.WriteLine("simple load: " + logic.Increment() + " " + name);
    }

    static void loadAndRunOnAppDomain(string name)
    {
        var domain = AppDomain.CreateDomain(uniqueName());
        var type = typeof(Proxy);
        var obj = (Proxy)domain.CreateInstanceAndUnwrap(
                Assembly.GetExecutingAssembly().FullName,    // assemblyName
                type.FullName,                               // typeName
                true,                                        // ignoreCase 検索で大文字と小文字を区別するかどうかを指定する Boolean 値。
                BindingFlags.Public | BindingFlags.Instance, // bindingAttr 0の場合は、大文字と小文字を区別してコンストラクター検索
                null,                                        // binder  null の場合は、既定のバインダー
                new object[]{ name },                        // args コンストラクタの引数
                null,                                        // culture null の場合は、現在のスレッドのCultureInfo
                new object[0]);                              // activationAttributes アクティべーションに参加できる 1 つ以上の属性の配列
        var logic = (dynamic)obj;
        Console.WriteLine("in app domain: " + logic.Increment() + " " + name);
        //AppDomain.Unload(domain);
    }

    static int uniqueNameCounter = 0;
    static string uniqueName()
    {
        return "name" + Interlocked.Increment(ref uniqueNameCounter);
    }
}

public class Proxy : MarshalByRefObject
{
    dynamic instance;

    public Proxy(string dllName)
    {
        var asm = Assembly.LoadFrom(dllName);
        var type = asm.GetType("Dll");
        instance = Activator.CreateInstance(type);
    }

    public int Increment()
    {
        return instance.Increment();
    }
}
