#define A

#if A
  #define X
#endif

#if B
  #define Y
#endif

// ** NOTE **
// if you define #define under "using System"
// raise error CS1032: Cannot define or undefine preprocessor symbols after first token in file

using System;

#define X

class Preprocessor
{
    public static void Main()
    {
#if A
        Console.WriteLine("defined A");
#endif

#if X
        Console.WriteLine("defined X");
#endif

#if Y
        Console.WriteLine("defined Y");
#endif
    }
}
