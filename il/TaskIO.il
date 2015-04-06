.assembly extern mscorlib
{
  .ver 4:0:0:0
  .publickeytoken = (B7 7A 5C 56 19 34 E0 89 ) // .z\V.4..
}
.assembly 'TaskIO'
{
  .custom instance void class [mscorlib]System.Diagnostics.DebuggableAttribute::'.ctor'(valuetype [mscorlib]System.Diagnostics.DebuggableAttribute/DebuggingModes) =  (01 00 02 01 00 00 00 00 ) // ........

  .custom instance void class [mscorlib]System.Runtime.CompilerServices.RuntimeCompatibilityAttribute::'.ctor'() =  (
		01 00 01 00 54 02 16 57 72 61 70 4E 6F 6E 45 78   // ....T..WrapNonEx
		63 65 70 74 69 6F 6E 54 68 72 6F 77 73 01       ) // ceptionThrows.

  .hash algorithm 0x00008004
  .ver  0:0:0:0
}
.module TaskIO.exe // GUID = {6242B263-0869-41F3-ACDB-322A92F7BEAB}


  .class private auto ansi beforefieldinit DummyIO
  	extends [mscorlib]System.Object
  {
    .field  public  int32 State

    // method line 1
    .method public hidebysig specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x2050
	// Code size 14 (0xe)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  ldc.i4.0 
	IL_0002:  stfld int32 DummyIO::State
	IL_0007:  ldarg.0 
	IL_0008:  call instance void object::'.ctor'()
	IL_000d:  ret 
    } // end of method DummyIO::.ctor

    // method line 2
    .method public hidebysig 
           instance default class [mscorlib]System.Threading.Tasks.Task`1<int32> Connect ()  cil managed 
    {
        // Method begins at RVA 0x2060
	// Code size 58 (0x3a)
	.maxstack 4
	.locals init (
		class [mscorlib]System.Threading.Tasks.Task`1<int32>	V_0)
	IL_0000:  nop 
	IL_0001:  ldarg.0 
	IL_0002:  dup 
	IL_0003:  ldfld int32 DummyIO::State
	IL_0008:  ldc.i4.1 
	IL_0009:  add 
	IL_000a:  stfld int32 DummyIO::State
	IL_000f:  call class [mscorlib]System.Threading.Tasks.TaskFactory`1<!0> class [mscorlib]System.Threading.Tasks.Task`1<int32>::get_Factory()
	IL_0014:  ldarg.0 
	IL_0015:  ldftn instance class [mscorlib]System.IAsyncResult class DummyIO::begin(class [mscorlib]System.AsyncCallback, object)
	IL_001b:  newobj instance void class [mscorlib]System.Func`3<class [mscorlib]System.AsyncCallback, object, class [mscorlib]System.IAsyncResult>::'.ctor'(object, native int)
	IL_0020:  ldarg.0 
	IL_0021:  ldftn instance int32 class DummyIO::end(class [mscorlib]System.IAsyncResult)
	IL_0027:  newobj instance void class [mscorlib]System.Func`2<class [mscorlib]System.IAsyncResult, int32>::'.ctor'(object, native int)
	IL_002c:  ldnull 
	IL_002d:  callvirt instance class [mscorlib]System.Threading.Tasks.Task`1<!0> class [mscorlib]System.Threading.Tasks.TaskFactory`1<int32>::FromAsync(class [mscorlib]System.Func`3<class [mscorlib]System.AsyncCallback,object,class [mscorlib]System.IAsyncResult>, class [mscorlib]System.Func`2<class [mscorlib]System.IAsyncResult,!0>, object)
	IL_0032:  stloc.0 
	IL_0033:  br IL_0038

	IL_0038:  ldloc.0 
	IL_0039:  ret 
    } // end of method DummyIO::Connect

    // method line 3
    .method private hidebysig 
           instance default class [mscorlib]System.IAsyncResult begin (class [mscorlib]System.AsyncCallback callback, object obj)  cil managed 
    {
        // Method begins at RVA 0x20a8
	// Code size 78 (0x4e)
	.maxstack 3
	.locals init (
		class DummyIO/'<begin>c__AnonStorey4'	V_0,
		class [mscorlib]System.Threading.Tasks.Task`1<class [mscorlib]System.Threading.Tasks.Task>	V_1,
		valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable`1<class [mscorlib]System.Threading.Tasks.Task>	V_2,
		class [mscorlib]System.IAsyncResult	V_3)
	IL_0000:  newobj instance void class DummyIO/'<begin>c__AnonStorey4'::'.ctor'()
	IL_0005:  stloc.0 
	IL_0006:  ldloc.0 
	IL_0007:  ldarg.1 
	IL_0008:  stfld class [mscorlib]System.AsyncCallback DummyIO/'<begin>c__AnonStorey4'::callback
	IL_000d:  nop 
	IL_000e:  ldarg.0 
	IL_000f:  dup 
	IL_0010:  ldfld int32 DummyIO::State
	IL_0015:  ldc.i4.1 
	IL_0016:  add 
	IL_0017:  stfld int32 DummyIO::State
	IL_001c:  ldstr "call begin"
	IL_0021:  call void class [mscorlib]System.Console::WriteLine(string)
	IL_0026:  call class [mscorlib]System.Threading.Tasks.TaskFactory class [mscorlib]System.Threading.Tasks.Task::get_Factory()
	IL_002b:  ldloc.0 
	IL_002c:  ldftn instance class [mscorlib]System.Threading.Tasks.Task class DummyIO/'<begin>c__AnonStorey4'::'<>m__0'()
	IL_0032:  newobj instance void class [mscorlib]System.Func`1<class [mscorlib]System.Threading.Tasks.Task>::'.ctor'(object, native int)
	IL_0037:  callvirt instance class [mscorlib]System.Threading.Tasks.Task`1<!!0> class [mscorlib]System.Threading.Tasks.TaskFactory::StartNew<class [mscorlib]System.Threading.Tasks.Task> (class [mscorlib]System.Func`1<!!0>)
	IL_003c:  stloc.1 
	IL_003d:  ldloc.1 
	IL_003e:  ldc.i4.0 
	IL_003f:  callvirt instance valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable`1<!0> class [mscorlib]System.Threading.Tasks.Task`1<class [mscorlib]System.Threading.Tasks.Task>::ConfigureAwait(bool)
	IL_0044:  stloc.2 
	IL_0045:  ldnull 
	IL_0046:  stloc.3 
	IL_0047:  br IL_004c

	IL_004c:  ldloc.3 
	IL_004d:  ret 
    } // end of method DummyIO::begin

    // method line 4
    .method private hidebysig 
           instance default void beginCallback (class [mscorlib]System.IAsyncResult result)  cil managed 
    {
        // Method begins at RVA 0x2102
	// Code size 26 (0x1a)
	.maxstack 8
	IL_0000:  nop 
	IL_0001:  ldarg.0 
	IL_0002:  dup 
	IL_0003:  ldfld int32 DummyIO::State
	IL_0008:  ldc.i4.1 
	IL_0009:  add 
	IL_000a:  stfld int32 DummyIO::State
	IL_000f:  ldstr "call beginCallback"
	IL_0014:  call void class [mscorlib]System.Console::WriteLine(string)
	IL_0019:  ret 
    } // end of method DummyIO::beginCallback

    // method line 5
    .method private hidebysig 
           instance default int32 end (class [mscorlib]System.IAsyncResult result)  cil managed 
    {
        // Method begins at RVA 0x2120
	// Code size 40 (0x28)
	.maxstack 3
	.locals init (
		int32	V_0)
	IL_0000:  nop 
	IL_0001:  ldarg.0 
	IL_0002:  dup 
	IL_0003:  ldfld int32 DummyIO::State
	IL_0008:  ldc.i4.1 
	IL_0009:  add 
	IL_000a:  stfld int32 DummyIO::State
	IL_000f:  ldstr "call end "
	IL_0014:  ldarg.1 
	IL_0015:  call string string::Concat(object, object)
	IL_001a:  call void class [mscorlib]System.Console::WriteLine(string)
	IL_001f:  ldc.i4.1 
	IL_0020:  stloc.0 
	IL_0021:  br IL_0026

	IL_0026:  ldloc.0 
	IL_0027:  ret 
    } // end of method DummyIO::end

  .class nested private auto ansi sealed beforefieldinit '<begin>c__AnonStorey4'
  	extends [mscorlib]System.Object
  {
    .custom instance void class [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::'.ctor'() =  (01 00 00 00 ) // ....

    .field  assembly  class [mscorlib]System.AsyncCallback callback

    // method line 10
    .method public hidebysig specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x2154
	// Code size 7 (0x7)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ret 
    } // end of method <begin>c__AnonStorey4::.ctor

    // method line 11
    .method assembly hidebysig 
           instance default class [mscorlib]System.Threading.Tasks.Task '<>m__0' ()  cil managed 
    {
        .custom instance void class [mscorlib]System.Runtime.CompilerServices.AsyncStateMachineAttribute::'.ctor'(class [mscorlib]System.Type) =  (
		01 00 18 44 75 6D 6D 79 49 4F 2B 3C 62 65 67 69   // ...DummyIO+<begi
		6E 3E 63 5F 5F 61 73 79 6E 63 33 00 00          ) // n>c__async3..

        // Method begins at RVA 0x215c
	// Code size 41 (0x29)
	.maxstack 3
	.locals init (
		valuetype DummyIO/'<begin>c__AnonStorey4'/'<begin>c__async3'	V_0)
	IL_0000:  ldloca.s 0
	IL_0002:  ldarg.0 
	IL_0003:  stfld class DummyIO/'<begin>c__AnonStorey4' DummyIO/'<begin>c__AnonStorey4'/'<begin>c__async3'::'<>f__ref$4'
	IL_0008:  ldloca.s 0
	IL_000a:  call valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::Create()
	IL_000f:  stfld valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder DummyIO/'<begin>c__AnonStorey4'/'<begin>c__async3'::$builder
	IL_0014:  ldloca.s 0
	IL_0016:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder DummyIO/'<begin>c__AnonStorey4'/'<begin>c__async3'::$builder
	IL_001b:  dup 
	IL_001c:  ldloca.s 0
	IL_001e:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::Start<valuetype DummyIO/'<begin>c__AnonStorey4'/'<begin>c__async3'> ([out] !!0&)
	IL_0023:  call instance class [mscorlib]System.Threading.Tasks.Task valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::get_Task()
	IL_0028:  ret 
    } // end of method <begin>c__AnonStorey4::<>m__0

  .class nested private auto ansi sealed beforefieldinit '<begin>c__async3'
  	extends [mscorlib]System.ValueType
  	implements [mscorlib]System.Runtime.CompilerServices.IAsyncStateMachine  {
    .field  assembly  class DummyIO/'<begin>c__AnonStorey4' '<>f__ref$4'
    .field  assembly  valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder $builder
    .field  assembly  int32 $PC
    .field  private  valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable/ConfiguredTaskAwaiter $awaiter0

    // method line 12
    .method public final virtual hidebysig newslot 
           instance default void MoveNext ()  cil managed 
    {
        // Method begins at RVA 0x2194
	// Code size 184 (0xb8)
	.maxstack 3
	.locals init (
		unsigned int32	V_0,
		valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable	V_1,
		class [mscorlib]System.Exception	V_2)
	IL_0000:  ldarg.0 
	IL_0001:  ldfld int32 DummyIO/'<begin>c__AnonStorey4'/'<begin>c__async3'::$PC
	IL_0006:  stloc.0 
	IL_0007:  ldarg.0 
	IL_0008:  ldc.i4.m1 
	IL_0009:  stfld int32 DummyIO/'<begin>c__AnonStorey4'/'<begin>c__async3'::$PC
	.try { // 0
	  IL_000e:  ldloc.0 
	  IL_000f:  switch (
	    IL_0021,
	    IL_006b)
	  IL_001c:  leave IL_00b7

	  IL_0021:  nop 
	  IL_0022:  ldarg.0 
	  IL_0023:  ldc.i4.s 0x64
	  IL_0025:  call class [mscorlib]System.Threading.Tasks.Task class [mscorlib]System.Threading.Tasks.Task::Delay(int32)
	  IL_002a:  ldc.i4.0 
	  IL_002b:  callvirt instance valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable class [mscorlib]System.Threading.Tasks.Task::ConfigureAwait(bool)
	  IL_0030:  stloc.1 
	  IL_0031:  ldloca.s 1
	  IL_0033:  call instance valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable/ConfiguredTaskAwaiter valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable::GetAwaiter()
	  IL_0038:  stfld valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable/ConfiguredTaskAwaiter DummyIO/'<begin>c__AnonStorey4'/'<begin>c__async3'::$awaiter0
	  IL_003d:  ldarg.0 
	  IL_003e:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable/ConfiguredTaskAwaiter DummyIO/'<begin>c__AnonStorey4'/'<begin>c__async3'::$awaiter0
	  IL_0043:  call instance bool valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable/ConfiguredTaskAwaiter::get_IsCompleted()
	  IL_0048:  brtrue IL_006b

	  IL_004d:  ldarg.0 
	  IL_004e:  ldc.i4.1 
	  IL_004f:  stfld int32 DummyIO/'<begin>c__AnonStorey4'/'<begin>c__async3'::$PC
	  IL_0054:  ldarg.0 
	  IL_0055:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder DummyIO/'<begin>c__AnonStorey4'/'<begin>c__async3'::$builder
	  IL_005a:  ldarg.0 
	  IL_005b:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable/ConfiguredTaskAwaiter DummyIO/'<begin>c__AnonStorey4'/'<begin>c__async3'::$awaiter0
	  IL_0060:  ldarg.0 
	  IL_0061:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::AwaitUnsafeOnCompleted<valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable/ConfiguredTaskAwaiter, valuetype DummyIO/'<begin>c__AnonStorey4'/'<begin>c__async3'> ([out] !!0&, [out] !!1&)
	  IL_0066:  leave IL_00b7

	  IL_006b:  ldarg.0 
	  IL_006c:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable/ConfiguredTaskAwaiter DummyIO/'<begin>c__AnonStorey4'/'<begin>c__async3'::$awaiter0
	  IL_0071:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable/ConfiguredTaskAwaiter::GetResult()
	  IL_0076:  ldarg.0 
	  IL_0077:  ldfld class DummyIO/'<begin>c__AnonStorey4' DummyIO/'<begin>c__AnonStorey4'/'<begin>c__async3'::'<>f__ref$4'
	  IL_007c:  ldfld class [mscorlib]System.AsyncCallback DummyIO/'<begin>c__AnonStorey4'::callback
	  IL_0081:  ldnull 
	  IL_0082:  callvirt instance void class [mscorlib]System.AsyncCallback::Invoke(class [mscorlib]System.IAsyncResult)
	  IL_0087:  leave IL_00a5

	} // end .try 0
	catch class [mscorlib]System.Exception { // 0
	  IL_008c:  stloc.2 
	  IL_008d:  ldarg.0 
	  IL_008e:  ldc.i4.m1 
	  IL_008f:  stfld int32 DummyIO/'<begin>c__AnonStorey4'/'<begin>c__async3'::$PC
	  IL_0094:  ldarg.0 
	  IL_0095:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder DummyIO/'<begin>c__AnonStorey4'/'<begin>c__async3'::$builder
	  IL_009a:  ldloc.2 
	  IL_009b:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::SetException(class [mscorlib]System.Exception)
	  IL_00a0:  leave IL_00b7

	} // end handler 0
	IL_00a5:  ldarg.0 
	IL_00a6:  ldc.i4.m1 
	IL_00a7:  stfld int32 DummyIO/'<begin>c__AnonStorey4'/'<begin>c__async3'::$PC
	IL_00ac:  ldarg.0 
	IL_00ad:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder DummyIO/'<begin>c__AnonStorey4'/'<begin>c__async3'::$builder
	IL_00b2:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::SetResult()
	IL_00b7:  ret 
    } // end of method <begin>c__async3::MoveNext

    // method line 13
    .method public final virtual hidebysig newslot 
           instance default void SetStateMachine (class [mscorlib]System.Runtime.CompilerServices.IAsyncStateMachine stateMachine)  cil managed 
    {
        .custom instance void class [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x2268
	// Code size 13 (0xd)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder DummyIO/'<begin>c__AnonStorey4'/'<begin>c__async3'::$builder
	IL_0006:  ldarg.1 
	IL_0007:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::SetStateMachine(class [mscorlib]System.Runtime.CompilerServices.IAsyncStateMachine)
	IL_000c:  ret 
    } // end of method <begin>c__async3::SetStateMachine

  } // end of class <begin>c__async3

  } // end of class <begin>c__AnonStorey4

  } // end of class DummyIO

  .class private auto ansi beforefieldinit Program
  	extends [mscorlib]System.Object
  {

    // method line 6
    .method public hidebysig specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x2276
	// Code size 7 (0x7)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ret 
    } // end of method Program::.ctor

    // method line 7
    .method private static hidebysig 
           default void Main ()  cil managed 
    {
        // Method begins at RVA 0x227e
	.entrypoint
	// Code size 28 (0x1c)
	.maxstack 8
	IL_0000:  nop 
	IL_0001:  call class [mscorlib]System.Threading.Tasks.Task class Program::run()
	IL_0006:  callvirt instance void class [mscorlib]System.Threading.Tasks.Task::Wait()
	IL_000b:  ldc.i4.0 
	IL_000c:  call void class [mscorlib]System.Console::WriteLine(bool)
	IL_0011:  call class [mscorlib]System.Threading.Tasks.Task class Program::runWhenAny()
	IL_0016:  callvirt instance void class [mscorlib]System.Threading.Tasks.Task::Wait()
	IL_001b:  ret 
    } // end of method Program::Main

    // method line 8
    .method private static hidebysig 
           default class [mscorlib]System.Threading.Tasks.Task run ()  cil managed 
    {
        .custom instance void class [mscorlib]System.Runtime.CompilerServices.AsyncStateMachineAttribute::'.ctor'(class [mscorlib]System.Type) =  (
		01 00 16 50 72 6F 67 72 61 6D 2B 3C 72 75 6E 3E   // ...Program+<run>
		63 5F 5F 61 73 79 6E 63 30 00 00                ) // c__async0..

        .custom instance void class [mscorlib]System.Diagnostics.DebuggerStepThroughAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x229c
	// Code size 33 (0x21)
	.maxstack 3
	.locals init (
		valuetype Program/'<run>c__async0'	V_0)
	IL_0000:  ldloca.s 0
	IL_0002:  call valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::Create()
	IL_0007:  stfld valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Program/'<run>c__async0'::$builder
	IL_000c:  ldloca.s 0
	IL_000e:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Program/'<run>c__async0'::$builder
	IL_0013:  dup 
	IL_0014:  ldloca.s 0
	IL_0016:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::Start<valuetype Program/'<run>c__async0'> ([out] !!0&)
	IL_001b:  call instance class [mscorlib]System.Threading.Tasks.Task valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::get_Task()
	IL_0020:  ret 
    } // end of method Program::run

    // method line 9
    .method private static hidebysig 
           default class [mscorlib]System.Threading.Tasks.Task runWhenAny ()  cil managed 
    {
        .custom instance void class [mscorlib]System.Runtime.CompilerServices.AsyncStateMachineAttribute::'.ctor'(class [mscorlib]System.Type) =  (
		01 00 1D 50 72 6F 67 72 61 6D 2B 3C 72 75 6E 57   // ...Program+<runW
		68 65 6E 41 6E 79 3E 63 5F 5F 61 73 79 6E 63 31   // henAny>c__async1
		00 00                                           ) // ..

        .custom instance void class [mscorlib]System.Diagnostics.DebuggerStepThroughAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x22cc
	// Code size 33 (0x21)
	.maxstack 3
	.locals init (
		valuetype Program/'<runWhenAny>c__async1'	V_0)
	IL_0000:  ldloca.s 0
	IL_0002:  call valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::Create()
	IL_0007:  stfld valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Program/'<runWhenAny>c__async1'::$builder
	IL_000c:  ldloca.s 0
	IL_000e:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Program/'<runWhenAny>c__async1'::$builder
	IL_0013:  dup 
	IL_0014:  ldloca.s 0
	IL_0016:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::Start<valuetype Program/'<runWhenAny>c__async1'> ([out] !!0&)
	IL_001b:  call instance class [mscorlib]System.Threading.Tasks.Task valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::get_Task()
	IL_0020:  ret 
    } // end of method Program::runWhenAny

  .class nested private auto ansi sealed beforefieldinit '<run>c__async0'
  	extends [mscorlib]System.ValueType
  	implements [mscorlib]System.Runtime.CompilerServices.IAsyncStateMachine  {
    .custom instance void class [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::'.ctor'() =  (01 00 00 00 ) // ....

    .field  assembly  class DummyIO '<io>__0'
    .field  assembly  int32 '<n>__1'
    .field  assembly  valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder $builder
    .field  assembly  int32 $PC
    .field  private  valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<int32> $awaiter0

    // method line 14
    .method public final virtual hidebysig newslot 
           instance default void MoveNext ()  cil managed 
    {
        // Method begins at RVA 0x22fc
	// Code size 244 (0xf4)
	.maxstack 4
	.locals init (
		unsigned int32	V_0,
		class [mscorlib]System.Exception	V_1)
	IL_0000:  ldarg.0 
	IL_0001:  ldfld int32 Program/'<run>c__async0'::$PC
	IL_0006:  stloc.0 
	IL_0007:  ldarg.0 
	IL_0008:  ldc.i4.m1 
	IL_0009:  stfld int32 Program/'<run>c__async0'::$PC
	.try { // 0
	  IL_000e:  ldloc.0 
	  IL_000f:  switch (
	    IL_0021,
	    IL_0071)
	  IL_001c:  leave IL_00f3

	  IL_0021:  nop 
	  IL_0022:  ldarg.0 
	  IL_0023:  newobj instance void class DummyIO::'.ctor'()
	  IL_0028:  stfld class DummyIO Program/'<run>c__async0'::'<io>__0'
	  IL_002d:  ldarg.0 
	  IL_002e:  ldarg.0 
	  IL_002f:  ldfld class DummyIO Program/'<run>c__async0'::'<io>__0'
	  IL_0034:  callvirt instance class [mscorlib]System.Threading.Tasks.Task`1<int32> class DummyIO::Connect()
	  IL_0039:  callvirt instance valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<!0> class [mscorlib]System.Threading.Tasks.Task`1<int32>::GetAwaiter()
	  IL_003e:  stfld valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<int32> Program/'<run>c__async0'::$awaiter0
	  IL_0043:  ldarg.0 
	  IL_0044:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<int32> Program/'<run>c__async0'::$awaiter0
	  IL_0049:  call instance bool valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<int32>::get_IsCompleted()
	  IL_004e:  brtrue IL_0071

	  IL_0053:  ldarg.0 
	  IL_0054:  ldc.i4.1 
	  IL_0055:  stfld int32 Program/'<run>c__async0'::$PC
	  IL_005a:  ldarg.0 
	  IL_005b:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Program/'<run>c__async0'::$builder
	  IL_0060:  ldarg.0 
	  IL_0061:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<int32> Program/'<run>c__async0'::$awaiter0
	  IL_0066:  ldarg.0 
	  IL_0067:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::AwaitUnsafeOnCompleted<valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<int32>, valuetype Program/'<run>c__async0'> ([out] !!0&, [out] !!1&)
	  IL_006c:  leave IL_00f3

	  IL_0071:  ldarg.0 
	  IL_0072:  ldarg.0 
	  IL_0073:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<int32> Program/'<run>c__async0'::$awaiter0
	  IL_0078:  call instance !0 valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<int32>::GetResult()
	  IL_007d:  stfld int32 Program/'<run>c__async0'::'<n>__1'
	  IL_0082:  ldc.i4.4 
	  IL_0083:  newarr [mscorlib]System.Object
	  IL_0088:  dup 
	  IL_0089:  ldc.i4.0 
	  IL_008a:  ldstr "done "
	  IL_008f:  stelem.ref 
	  IL_0090:  dup 
	  IL_0091:  ldc.i4.1 
	  IL_0092:  ldarg.0 
	  IL_0093:  ldfld class DummyIO Program/'<run>c__async0'::'<io>__0'
	  IL_0098:  ldfld int32 DummyIO::State
	  IL_009d:  box [mscorlib]System.Int32
	  IL_00a2:  stelem.ref 
	  IL_00a3:  dup 
	  IL_00a4:  ldc.i4.2 
	  IL_00a5:  ldstr " "
	  IL_00aa:  stelem.ref 
	  IL_00ab:  dup 
	  IL_00ac:  ldc.i4.3 
	  IL_00ad:  ldarg.0 
	  IL_00ae:  ldfld int32 Program/'<run>c__async0'::'<n>__1'
	  IL_00b3:  box [mscorlib]System.Int32
	  IL_00b8:  stelem.ref 
	  IL_00b9:  call string string::Concat(object[])
	  IL_00be:  call void class [mscorlib]System.Console::WriteLine(string)
	  IL_00c3:  leave IL_00e1

	} // end .try 0
	catch class [mscorlib]System.Exception { // 0
	  IL_00c8:  stloc.1 
	  IL_00c9:  ldarg.0 
	  IL_00ca:  ldc.i4.m1 
	  IL_00cb:  stfld int32 Program/'<run>c__async0'::$PC
	  IL_00d0:  ldarg.0 
	  IL_00d1:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Program/'<run>c__async0'::$builder
	  IL_00d6:  ldloc.1 
	  IL_00d7:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::SetException(class [mscorlib]System.Exception)
	  IL_00dc:  leave IL_00f3

	} // end handler 0
	IL_00e1:  ldarg.0 
	IL_00e2:  ldc.i4.m1 
	IL_00e3:  stfld int32 Program/'<run>c__async0'::$PC
	IL_00e8:  ldarg.0 
	IL_00e9:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Program/'<run>c__async0'::$builder
	IL_00ee:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::SetResult()
	IL_00f3:  ret 
    } // end of method <run>c__async0::MoveNext

    // method line 15
    .method public final virtual hidebysig newslot 
           instance default void SetStateMachine (class [mscorlib]System.Runtime.CompilerServices.IAsyncStateMachine stateMachine)  cil managed 
    {
        .custom instance void class [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x240c
	// Code size 13 (0xd)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Program/'<run>c__async0'::$builder
	IL_0006:  ldarg.1 
	IL_0007:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::SetStateMachine(class [mscorlib]System.Runtime.CompilerServices.IAsyncStateMachine)
	IL_000c:  ret 
    } // end of method <run>c__async0::SetStateMachine

  } // end of class <run>c__async0

  .class nested private auto ansi sealed beforefieldinit '<runWhenAny>c__async1'
  	extends [mscorlib]System.ValueType
  	implements [mscorlib]System.Runtime.CompilerServices.IAsyncStateMachine  {
    .custom instance void class [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::'.ctor'() =  (01 00 00 00 ) // ....

    .field  assembly  class DummyIO '<io>__0'
    .field  assembly  class [mscorlib]System.Threading.Tasks.Task`1<int32> '<t1>__1'
    .field  assembly  class [mscorlib]System.Threading.Tasks.Task '<t2>__2'
    .field  assembly  class [mscorlib]System.Threading.Tasks.Task '<t>__3'
    .field  assembly  valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder $builder
    .field  assembly  int32 $PC
    .field  private  valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<class [mscorlib]System.Threading.Tasks.Task> $awaiter0
    .field  private  valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter $awaiter1
    .field  private  valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<int32> $awaiter2

    // method line 16
    .method public final virtual hidebysig newslot 
           instance default void MoveNext ()  cil managed 
    {
        // Method begins at RVA 0x241c
	// Code size 428 (0x1ac)
	.maxstack 5
	.locals init (
		unsigned int32	V_0,
		class [mscorlib]System.Exception	V_1)
	IL_0000:  ldarg.0 
	IL_0001:  ldfld int32 Program/'<runWhenAny>c__async1'::$PC
	IL_0006:  stloc.0 
	IL_0007:  ldarg.0 
	IL_0008:  ldc.i4.m1 
	IL_0009:  stfld int32 Program/'<runWhenAny>c__async1'::$PC
	.try { // 0
	  IL_000e:  ldloc.0 
	  IL_000f:  switch (
	    IL_0029,
	    IL_00a8,
	    IL_011b,
	    IL_016f)
	  IL_0024:  leave IL_01ab

	  IL_0029:  nop 
	  IL_002a:  ldarg.0 
	  IL_002b:  newobj instance void class DummyIO::'.ctor'()
	  IL_0030:  stfld class DummyIO Program/'<runWhenAny>c__async1'::'<io>__0'
	  IL_0035:  ldarg.0 
	  IL_0036:  ldarg.0 
	  IL_0037:  ldfld class DummyIO Program/'<runWhenAny>c__async1'::'<io>__0'
	  IL_003c:  callvirt instance class [mscorlib]System.Threading.Tasks.Task`1<int32> class DummyIO::Connect()
	  IL_0041:  stfld class [mscorlib]System.Threading.Tasks.Task`1<int32> Program/'<runWhenAny>c__async1'::'<t1>__1'
	  IL_0046:  ldarg.0 
	  IL_0047:  ldc.i4.1 
	  IL_0048:  call class [mscorlib]System.Threading.Tasks.Task class [mscorlib]System.Threading.Tasks.Task::Delay(int32)
	  IL_004d:  stfld class [mscorlib]System.Threading.Tasks.Task Program/'<runWhenAny>c__async1'::'<t2>__2'
	  IL_0052:  ldarg.0 
	  IL_0053:  ldc.i4.2 
	  IL_0054:  newarr [mscorlib]System.Threading.Tasks.Task
	  IL_0059:  dup 
	  IL_005a:  ldc.i4.0 
	  IL_005b:  ldarg.0 
	  IL_005c:  ldfld class [mscorlib]System.Threading.Tasks.Task`1<int32> Program/'<runWhenAny>c__async1'::'<t1>__1'
	  IL_0061:  stelem.ref 
	  IL_0062:  dup 
	  IL_0063:  ldc.i4.1 
	  IL_0064:  ldarg.0 
	  IL_0065:  ldfld class [mscorlib]System.Threading.Tasks.Task Program/'<runWhenAny>c__async1'::'<t2>__2'
	  IL_006a:  stelem.ref 
	  IL_006b:  call class [mscorlib]System.Threading.Tasks.Task`1<class [mscorlib]System.Threading.Tasks.Task> class [mscorlib]System.Threading.Tasks.Task::WhenAny(class [mscorlib]System.Threading.Tasks.Task[])
	  IL_0070:  callvirt instance valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<!0> class [mscorlib]System.Threading.Tasks.Task`1<class [mscorlib]System.Threading.Tasks.Task>::GetAwaiter()
	  IL_0075:  stfld valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<class [mscorlib]System.Threading.Tasks.Task> Program/'<runWhenAny>c__async1'::$awaiter0
	  IL_007a:  ldarg.0 
	  IL_007b:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<class [mscorlib]System.Threading.Tasks.Task> Program/'<runWhenAny>c__async1'::$awaiter0
	  IL_0080:  call instance bool valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<class [mscorlib]System.Threading.Tasks.Task>::get_IsCompleted()
	  IL_0085:  brtrue IL_00a8

	  IL_008a:  ldarg.0 
	  IL_008b:  ldc.i4.1 
	  IL_008c:  stfld int32 Program/'<runWhenAny>c__async1'::$PC
	  IL_0091:  ldarg.0 
	  IL_0092:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Program/'<runWhenAny>c__async1'::$builder
	  IL_0097:  ldarg.0 
	  IL_0098:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<class [mscorlib]System.Threading.Tasks.Task> Program/'<runWhenAny>c__async1'::$awaiter0
	  IL_009d:  ldarg.0 
	  IL_009e:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::AwaitUnsafeOnCompleted<valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<class [mscorlib]System.Threading.Tasks.Task>, valuetype Program/'<runWhenAny>c__async1'> ([out] !!0&, [out] !!1&)
	  IL_00a3:  leave IL_01ab

	  IL_00a8:  ldarg.0 
	  IL_00a9:  ldarg.0 
	  IL_00aa:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<class [mscorlib]System.Threading.Tasks.Task> Program/'<runWhenAny>c__async1'::$awaiter0
	  IL_00af:  call instance !0 valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<class [mscorlib]System.Threading.Tasks.Task>::GetResult()
	  IL_00b4:  stfld class [mscorlib]System.Threading.Tasks.Task Program/'<runWhenAny>c__async1'::'<t>__3'
	  IL_00b9:  ldstr "done "
	  IL_00be:  ldarg.0 
	  IL_00bf:  ldfld class DummyIO Program/'<runWhenAny>c__async1'::'<io>__0'
	  IL_00c4:  ldfld int32 DummyIO::State
	  IL_00c9:  box [mscorlib]System.Int32
	  IL_00ce:  call string string::Concat(object, object)
	  IL_00d3:  call void class [mscorlib]System.Console::WriteLine(string)
	  IL_00d8:  ldarg.0 
	  IL_00d9:  ldc.i4 1000
	  IL_00de:  call class [mscorlib]System.Threading.Tasks.Task class [mscorlib]System.Threading.Tasks.Task::Delay(int32)
	  IL_00e3:  callvirt instance valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter class [mscorlib]System.Threading.Tasks.Task::GetAwaiter()
	  IL_00e8:  stfld valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter Program/'<runWhenAny>c__async1'::$awaiter1
	  IL_00ed:  ldarg.0 
	  IL_00ee:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter Program/'<runWhenAny>c__async1'::$awaiter1
	  IL_00f3:  call instance bool valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter::get_IsCompleted()
	  IL_00f8:  brtrue IL_011b

	  IL_00fd:  ldarg.0 
	  IL_00fe:  ldc.i4.2 
	  IL_00ff:  stfld int32 Program/'<runWhenAny>c__async1'::$PC
	  IL_0104:  ldarg.0 
	  IL_0105:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Program/'<runWhenAny>c__async1'::$builder
	  IL_010a:  ldarg.0 
	  IL_010b:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter Program/'<runWhenAny>c__async1'::$awaiter1
	  IL_0110:  ldarg.0 
	  IL_0111:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::AwaitUnsafeOnCompleted<valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter, valuetype Program/'<runWhenAny>c__async1'> ([out] !!0&, [out] !!1&)
	  IL_0116:  leave IL_01ab

	  IL_011b:  ldarg.0 
	  IL_011c:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter Program/'<runWhenAny>c__async1'::$awaiter1
	  IL_0121:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter::GetResult()
	  IL_0126:  ldstr "delay end"
	  IL_012b:  call void class [mscorlib]System.Console::WriteLine(string)
	  IL_0130:  ldarg.0 
	  IL_0131:  ldarg.0 
	  IL_0132:  ldfld class [mscorlib]System.Threading.Tasks.Task`1<int32> Program/'<runWhenAny>c__async1'::'<t1>__1'
	  IL_0137:  callvirt instance valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<!0> class [mscorlib]System.Threading.Tasks.Task`1<int32>::GetAwaiter()
	  IL_013c:  stfld valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<int32> Program/'<runWhenAny>c__async1'::$awaiter2
	  IL_0141:  ldarg.0 
	  IL_0142:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<int32> Program/'<runWhenAny>c__async1'::$awaiter2
	  IL_0147:  call instance bool valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<int32>::get_IsCompleted()
	  IL_014c:  brtrue IL_016f

	  IL_0151:  ldarg.0 
	  IL_0152:  ldc.i4.3 
	  IL_0153:  stfld int32 Program/'<runWhenAny>c__async1'::$PC
	  IL_0158:  ldarg.0 
	  IL_0159:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Program/'<runWhenAny>c__async1'::$builder
	  IL_015e:  ldarg.0 
	  IL_015f:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<int32> Program/'<runWhenAny>c__async1'::$awaiter2
	  IL_0164:  ldarg.0 
	  IL_0165:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::AwaitUnsafeOnCompleted<valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<int32>, valuetype Program/'<runWhenAny>c__async1'> ([out] !!0&, [out] !!1&)
	  IL_016a:  leave IL_01ab

	  IL_016f:  ldarg.0 
	  IL_0170:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<int32> Program/'<runWhenAny>c__async1'::$awaiter2
	  IL_0175:  call instance !0 valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<int32>::GetResult()
	  IL_017a:  pop 
	  IL_017b:  leave IL_0199

	} // end .try 0
	catch class [mscorlib]System.Exception { // 0
	  IL_0180:  stloc.1 
	  IL_0181:  ldarg.0 
	  IL_0182:  ldc.i4.m1 
	  IL_0183:  stfld int32 Program/'<runWhenAny>c__async1'::$PC
	  IL_0188:  ldarg.0 
	  IL_0189:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Program/'<runWhenAny>c__async1'::$builder
	  IL_018e:  ldloc.1 
	  IL_018f:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::SetException(class [mscorlib]System.Exception)
	  IL_0194:  leave IL_01ab

	} // end handler 0
	IL_0199:  ldarg.0 
	IL_019a:  ldc.i4.m1 
	IL_019b:  stfld int32 Program/'<runWhenAny>c__async1'::$PC
	IL_01a0:  ldarg.0 
	IL_01a1:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Program/'<runWhenAny>c__async1'::$builder
	IL_01a6:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::SetResult()
	IL_01ab:  ret 
    } // end of method <runWhenAny>c__async1::MoveNext

    // method line 17
    .method public final virtual hidebysig newslot 
           instance default void SetStateMachine (class [mscorlib]System.Runtime.CompilerServices.IAsyncStateMachine stateMachine)  cil managed 
    {
        .custom instance void class [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x25f0
	// Code size 13 (0xd)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Program/'<runWhenAny>c__async1'::$builder
	IL_0006:  ldarg.1 
	IL_0007:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::SetStateMachine(class [mscorlib]System.Runtime.CompilerServices.IAsyncStateMachine)
	IL_000c:  ret 
    } // end of method <runWhenAny>c__async1::SetStateMachine

  } // end of class <runWhenAny>c__async1

  } // end of class Program

