using System;
using System.Reflection;

class Target
{
    public string Name;
    private int age;
    public int Age()
    {
        return age;
    }

    public Target(string name, int age_)
    {
        Name = name;
        age = age_;
    }
}


class Field
{
    public static void Main()
    {
        Target t = new Target("foo", 18);
        show(t.Name, t.Age());
        show(
            ((string)t.GetType().GetField("Name").GetValue(t)),
            ((int)t.GetType().GetField("age", BindingFlags.Instance | BindingFlags.NonPublic).GetValue(t))
        );
        t.Name = "bar";
        t.GetType().GetField("age", BindingFlags.Instance | BindingFlags.NonPublic).SetValue(t, 30);
        show(t.Name, t.Age());
    }

    private static void show(string name, int age)
    {
        Console.WriteLine("name = " + name + " age=" + age);
    }
}
