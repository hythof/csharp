.assembly extern mscorlib
{
  .ver 4:0:0:0
  .publickeytoken = (B7 7A 5C 56 19 34 E0 89 ) // .z\V.4..
}
.assembly 'DiscompileIEnumerator'
{
  .custom instance void class [mscorlib]System.Diagnostics.DebuggableAttribute::'.ctor'(valuetype [mscorlib]System.Diagnostics.DebuggableAttribute/DebuggingModes) =  (01 00 02 01 00 00 00 00 ) // ........

  .custom instance void class [mscorlib]System.Runtime.CompilerServices.RuntimeCompatibilityAttribute::'.ctor'() =  (
		01 00 01 00 54 02 16 57 72 61 70 4E 6F 6E 45 78   // ....T..WrapNonEx
		63 65 70 74 69 6F 6E 54 68 72 6F 77 73 01       ) // ceptionThrows.

  .hash algorithm 0x00008004
  .ver  0:0:0:0
}
.module DiscompileIEnumerator.exe // GUID = {EB243F8E-C1C0-444E-9559-5F7E9F0E6825}


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
	// Code size 15 (0xf)
	.maxstack 1
	.locals init (
		class Target/'<Loop>c__Iterator0'	V_0,
		class [mscorlib]System.Collections.IEnumerator	V_1)
	IL_0000:  newobj instance void class Target/'<Loop>c__Iterator0'::'.ctor'()
	IL_0005:  stloc.0 
	IL_0006:  ldloc.0 
	IL_0007:  stloc.1 
	IL_0008:  br IL_000d

	IL_000d:  ldloc.1 
	IL_000e:  ret 
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

        // Method begins at RVA 0x2074
	.override method instance !0 class [mscorlib]System.Collections.Generic.IEnumerator`1<object>::get_Current()
	// Code size 14 (0xe)
	.maxstack 1
	.locals init (
		object	V_0)
	IL_0000:  ldarg.0 
	IL_0001:  ldfld object Target/'<Loop>c__Iterator0'::$current
	IL_0006:  stloc.0 
	IL_0007:  br IL_000c

	IL_000c:  ldloc.0 
	IL_000d:  ret 
    } // end of method <Loop>c__Iterator0::System.Collections.Generic.IEnumerator<object>.get_Current

    // method line 6
    .method private final virtual hidebysig newslot specialname 
           instance default object System.Collections.IEnumerator.get_Current ()  cil managed 
    {
        .custom instance void class [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x2090
	.override class [mscorlib]System.Collections.IEnumerator::get_Current
	// Code size 14 (0xe)
	.maxstack 1
	.locals init (
		object	V_0)
	IL_0000:  ldarg.0 
	IL_0001:  ldfld object Target/'<Loop>c__Iterator0'::$current
	IL_0006:  stloc.0 
	IL_0007:  br IL_000c

	IL_000c:  ldloc.0 
	IL_000d:  ret 
    } // end of method <Loop>c__Iterator0::System.Collections.IEnumerator.get_Current

    // method line 7
    .method public hidebysig specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        .custom instance void class [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x20aa
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
        // Method begins at RVA 0x20b4
	// Code size 123 (0x7b)
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
	  IL_0054)
	IL_001c:  br IL_0077

	IL_0021:  nop 
	IL_0022:  ldarg.0 
	IL_0023:  ldc.i4.0 
	IL_0024:  stfld int32 Target/'<Loop>c__Iterator0'::'<i>__0'
	IL_0029:  br IL_0063

	IL_002e:  nop 
	IL_002f:  ldarg.0 
	IL_0030:  ldarg.0 
	IL_0031:  ldfld int32 Target/'<Loop>c__Iterator0'::'<i>__0'
	IL_0036:  box [mscorlib]System.Int32
	IL_003b:  stfld object Target/'<Loop>c__Iterator0'::$current
	IL_0040:  ldarg.0 
	IL_0041:  ldfld bool Target/'<Loop>c__Iterator0'::$disposing
	IL_0046:  brtrue.s IL_004f

	IL_0048:  ldarg.0 
	IL_0049:  ldc.i4.1 
	IL_004a:  stfld int32 Target/'<Loop>c__Iterator0'::$PC
	IL_004f:  br IL_0079

	IL_0054:  nop 
	IL_0055:  ldarg.0 
	IL_0056:  ldarg.0 
	IL_0057:  ldfld int32 Target/'<Loop>c__Iterator0'::'<i>__0'
	IL_005c:  ldc.i4.1 
	IL_005d:  add 
	IL_005e:  stfld int32 Target/'<Loop>c__Iterator0'::'<i>__0'
	IL_0063:  ldarg.0 
	IL_0064:  ldfld int32 Target/'<Loop>c__Iterator0'::'<i>__0'
	IL_0069:  ldc.i4.s 0x0a
	IL_006b:  blt IL_002e

	IL_0070:  ldarg.0 
	IL_0071:  ldc.i4.m1 
	IL_0072:  stfld int32 Target/'<Loop>c__Iterator0'::$PC
	IL_0077:  ldc.i4.0 
	IL_0078:  ret 
	IL_0079:  ldc.i4.1 
	IL_007a:  ret 
    } // end of method <Loop>c__Iterator0::MoveNext

    // method line 9
    .method public final virtual hidebysig newslot 
           instance default void Dispose ()  cil managed 
    {
        .custom instance void class [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x213b
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

        // Method begins at RVA 0x214b
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
        // Method begins at RVA 0x2152
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
        // Method begins at RVA 0x215c
	.entrypoint
	// Code size 44 (0x2c)
	.maxstack 1
	.locals init (
		class Target	V_0,
		class [mscorlib]System.Collections.IEnumerator	V_1)
	IL_0000:  nop 
	IL_0001:  newobj instance void class Target::'.ctor'()
	IL_0006:  stloc.0 
	IL_0007:  ldloc.0 
	IL_0008:  callvirt instance class [mscorlib]System.Collections.IEnumerator class Target::Loop()
	IL_000d:  stloc.1 
	IL_000e:  br IL_0020

	IL_0013:  nop 
	IL_0014:  ldloc.1 
	IL_0015:  callvirt instance object class [mscorlib]System.Collections.IEnumerator::get_Current()
	IL_001a:  call void class [mscorlib]System.Console::WriteLine(object)
	IL_001f:  nop 
	IL_0020:  ldloc.1 
	IL_0021:  callvirt instance bool class [mscorlib]System.Collections.IEnumerator::MoveNext()
	IL_0026:  brtrue IL_0013

	IL_002b:  ret 
    } // end of method Program::Main

  } // end of class Program

