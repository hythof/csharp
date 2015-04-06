.assembly extern mscorlib
{
  .ver 4:0:0:0
  .publickeytoken = (B7 7A 5C 56 19 34 E0 89 ) // .z\V.4..
}
.assembly 'DiscompileIEnumerator'
{
  .custom instance void class [mscorlib]System.Runtime.CompilerServices.RuntimeCompatibilityAttribute::'.ctor'() =  (
		01 00 01 00 54 02 16 57 72 61 70 4E 6F 6E 45 78   // ....T..WrapNonEx
		63 65 70 74 69 6F 6E 54 68 72 6F 77 73 01       ) // ceptionThrows.

  .hash algorithm 0x00008004
  .ver  0:0:0:0
}
.module DiscompileIEnumerator.exe // GUID = {EF283705-733C-419B-B45E-6F2EA1E89FD0}


  .class private auto ansi beforefieldinit Target
  	extends [mscorlib]System.Object
  {

    // method line 1
    .method public hidebysig specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x2050
	// Code size 7 (0x7)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ret 
    } // end of method Target::.ctor

    // method line 2
    .method public hidebysig 
           instance default class [mscorlib]System.Collections.IEnumerator Loop ()  cil managed 
    {
        .custom instance void class [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x2058
	// Code size 8 (0x8)
	.maxstack 1
	.locals init (
		class Target/'<Loop>c__Iterator0'	V_0)
	IL_0000:  newobj instance void class Target/'<Loop>c__Iterator0'::'.ctor'()
	IL_0005:  stloc.0 
	IL_0006:  ldloc.0 
	IL_0007:  ret 
    } // end of method Target::Loop

  .class nested private auto ansi sealed beforefieldinit '<Loop>c__Iterator0'
  	extends [mscorlib]System.Object
  	implements [mscorlib]System.Collections.IEnumerator, [mscorlib]System.IDisposable, class [mscorlib]System.Collections.Generic.IEnumerator`1<object>  {
    .custom instance void class [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::'.ctor'() =  (01 00 00 00 ) // ....

    .field  assembly  int32 '<i>__0'
    .field  assembly  object $current
    .field  assembly  bool $disposing
    .field  assembly  int32 $PC

    // method line 5
    .method private final virtual hidebysig newslot specialname 
           instance default object 'System.Collections.Generic.IEnumerator<object>.get_Current' ()  cil managed 
    {
        .custom instance void class [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x206c
	.override method instance !0 class [mscorlib]System.Collections.Generic.IEnumerator`1<object>::get_Current()
	// Code size 7 (0x7)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  ldfld object Target/'<Loop>c__Iterator0'::$current
	IL_0006:  ret 
    } // end of method <Loop>c__Iterator0::System.Collections.Generic.IEnumerator<object>.get_Current

    // method line 6
    .method private final virtual hidebysig newslot specialname 
           instance default object System.Collections.IEnumerator.get_Current ()  cil managed 
    {
        .custom instance void class [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x2074
	.override class [mscorlib]System.Collections.IEnumerator::get_Current
	// Code size 7 (0x7)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  ldfld object Target/'<Loop>c__Iterator0'::$current
	IL_0006:  ret 
    } // end of method <Loop>c__Iterator0::System.Collections.IEnumerator.get_Current

    // method line 7
    .method public hidebysig specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        .custom instance void class [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x207c
	// Code size 7 (0x7)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ret 
    } // end of method <Loop>c__Iterator0::.ctor

    // method line 8
    .method public final virtual hidebysig newslot 
           instance default bool MoveNext ()  cil managed 
    {
        // Method begins at RVA 0x2084
	// Code size 120 (0x78)
	.maxstack 3
	.locals init (
		unsigned int32	V_0)
	IL_0000:  ldarg.0 
	IL_0001:  ldfld int32 Target/'<Loop>c__Iterator0'::$PC
	IL_0006:  stloc.0 
	IL_0007:  ldarg.0 
	IL_0008:  ldc.i4.m1 
	IL_0009:  stfld int32 Target/'<Loop>c__Iterator0'::$PC
	IL_000e:  ldloc.0 
	IL_000f:  switch (
	  IL_0021,
	  IL_0052)
	IL_001c:  br IL_0074

	IL_0021:  ldarg.0 
	IL_0022:  ldc.i4.0 
	IL_0023:  stfld int32 Target/'<Loop>c__Iterator0'::'<i>__0'
	IL_0028:  br IL_0060

	IL_002d:  ldarg.0 
	IL_002e:  ldarg.0 
	IL_002f:  ldfld int32 Target/'<Loop>c__Iterator0'::'<i>__0'
	IL_0034:  box [mscorlib]System.Int32
	IL_0039:  stfld object Target/'<Loop>c__Iterator0'::$current
	IL_003e:  ldarg.0 
	IL_003f:  ldfld bool Target/'<Loop>c__Iterator0'::$disposing
	IL_0044:  brtrue.s IL_004d

	IL_0046:  ldarg.0 
	IL_0047:  ldc.i4.1 
	IL_0048:  stfld int32 Target/'<Loop>c__Iterator0'::$PC
	IL_004d:  br IL_0076

	IL_0052:  ldarg.0 
	IL_0053:  ldarg.0 
	IL_0054:  ldfld int32 Target/'<Loop>c__Iterator0'::'<i>__0'
	IL_0059:  ldc.i4.1 
	IL_005a:  add 
	IL_005b:  stfld int32 Target/'<Loop>c__Iterator0'::'<i>__0'
	IL_0060:  ldarg.0 
	IL_0061:  ldfld int32 Target/'<Loop>c__Iterator0'::'<i>__0'
	IL_0066:  ldc.i4.s 0x0a
	IL_0068:  blt IL_002d

	IL_006d:  ldarg.0 
	IL_006e:  ldc.i4.m1 
	IL_006f:  stfld int32 Target/'<Loop>c__Iterator0'::$PC
	IL_0074:  ldc.i4.0 
	IL_0075:  ret 
	IL_0076:  ldc.i4.1 
	IL_0077:  ret 
    } // end of method <Loop>c__Iterator0::MoveNext

    // method line 9
    .method public final virtual hidebysig newslot 
           instance default void Dispose ()  cil managed 
    {
        .custom instance void class [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x2108
	// Code size 15 (0xf)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  ldc.i4.1 
	IL_0002:  stfld bool Target/'<Loop>c__Iterator0'::$disposing
	IL_0007:  ldarg.0 
	IL_0008:  ldc.i4.m1 
	IL_0009:  stfld int32 Target/'<Loop>c__Iterator0'::$PC
	IL_000e:  ret 
    } // end of method <Loop>c__Iterator0::Dispose

    // method line 10
    .method public final virtual hidebysig newslot 
           instance default void Reset ()  cil managed 
    {
        .custom instance void class [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x2118
	// Code size 6 (0x6)
	.maxstack 8
	IL_0000:  newobj instance void class [mscorlib]System.NotSupportedException::'.ctor'()
	IL_0005:  throw 
    } // end of method <Loop>c__Iterator0::Reset

	.property instance object 'System.Collections.Generic.IEnumerator<object>.Current' ()
	{
		.get instance default object Target/'<Loop>c__Iterator0'::'System.Collections.Generic.IEnumerator<object>.get_Current' () 
	}
	.property instance object System.Collections.IEnumerator.Current ()
	{
		.get instance default object Target/'<Loop>c__Iterator0'::System.Collections.IEnumerator.get_Current () 
	}
  } // end of class <Loop>c__Iterator0

  } // end of class Target

  .class private auto ansi beforefieldinit Program
  	extends [mscorlib]System.Object
  {

    // method line 3
    .method public hidebysig specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x211f
	// Code size 7 (0x7)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ret 
    } // end of method Program::.ctor

    // method line 4
    .method private static hidebysig 
           default void Main ()  cil managed 
    {
        // Method begins at RVA 0x2128
	.entrypoint
	// Code size 41 (0x29)
	.maxstack 1
	.locals init (
		class Target	V_0,
		class [mscorlib]System.Collections.IEnumerator	V_1)
	IL_0000:  newobj instance void class Target::'.ctor'()
	IL_0005:  stloc.0 
	IL_0006:  ldloc.0 
	IL_0007:  callvirt instance class [mscorlib]System.Collections.IEnumerator class Target::Loop()
	IL_000c:  stloc.1 
	IL_000d:  br IL_001d

	IL_0012:  ldloc.1 
	IL_0013:  callvirt instance object class [mscorlib]System.Collections.IEnumerator::get_Current()
	IL_0018:  call void class [mscorlib]System.Console::WriteLine(object)
	IL_001d:  ldloc.1 
	IL_001e:  callvirt instance bool class [mscorlib]System.Collections.IEnumerator::MoveNext()
	IL_0023:  brtrue IL_0012

	IL_0028:  ret 
    } // end of method Program::Main

  } // end of class Program

