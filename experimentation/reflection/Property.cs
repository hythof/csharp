using System;
using System.Reflection;

class Target
{
    public string Name { get; set; }
    private int age { get; set; }
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


class Property
{
    public static void Main()
    {
        Target t = new Target("foo", 18);
        show(t.Name, t.Age());
        show(
            ((string)t.GetType().GetProperty("Name").GetValue(t)),
            ((int)t.GetType().GetProperty("age", BindingFlags.Instance | BindingFlags.NonPublic).GetValue(t))
        );
        t.Name = "bar";
        t.GetType().GetProperty("age", BindingFlags.Instance | BindingFlags.NonPublic).SetValue(t, 30);
        show(t.Name, t.Age());
    }

    private static void show(string name, int age)
    {
        Console.WriteLine("name = " + name + " age=" + age);
    }
}
