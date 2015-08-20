using System;

[Serializable]
public class Dll
{
    public static int StaticCounter;

    public int Increment()
    {
        return ++StaticCounter;
    }
}
