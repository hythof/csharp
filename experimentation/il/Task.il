.assembly extern mscorlib
{
  .ver 4:0:0:0
  .publickeytoken = (B7 7A 5C 56 19 34 E0 89 ) // .z\V.4..
}
.assembly 'Task'
{
  .custom instance void class [mscorlib]System.Diagnostics.DebuggableAttribute::'.ctor'(valuetype [mscorlib]System.Diagnostics.DebuggableAttribute/DebuggingModes) =  (01 00 02 01 00 00 00 00 ) // ........

  .custom instance void class [mscorlib]System.Runtime.CompilerServices.RuntimeCompatibilityAttribute::'.ctor'() =  (
		01 00 01 00 54 02 16 57 72 61 70 4E 6F 6E 45 78   // ....T..WrapNonEx
		63 65 70 74 69 6F 6E 54 68 72 6F 77 73 01       ) // ceptionThrows.

  .hash algorithm 0x00008004
  .ver  0:0:0:0
}
.module Task.exe // GUID = {ABB66F7C-7067-46C5-B0E2-B8F33B23C02F}


  .class private auto ansi beforefieldinit Program
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
    } // end of method Program::.ctor

    // method line 2
    .method private static hidebysig 
           default void Main ()  cil managed 
    {
        // Method begins at RVA 0x2058
	.entrypoint
	// Code size 32 (0x20)
	.maxstack 8
	IL_0000:  nop 
	IL_0001:  call class [mscorlib]System.Threading.Tasks.Task`1<int32> class Program::run()
	IL_0006:  callvirt instance void class [mscorlib]System.Threading.Tasks.Task::Wait()
	IL_000b:  ldstr "--"
	IL_0010:  call void class [mscorlib]System.Console::WriteLine(string)
	IL_0015:  call class [mscorlib]System.Threading.Tasks.Task class Program::whenAny()
	IL_001a:  callvirt instance void class [mscorlib]System.Threading.Tasks.Task::Wait()
	IL_001f:  ret 
    } // end of method Program::Main

    // method line 3
    .method private static hidebysig 
           default class [mscorlib]System.Threading.Tasks.Task`1<int32> run ()  cil managed 
    {
        .custom instance void class [mscorlib]System.Runtime.CompilerServices.AsyncStateMachineAttribute::'.ctor'(class [mscorlib]System.Type) =  (
		01 00 16 50 72 6F 67 72 61 6D 2B 3C 72 75 6E 3E   // ...Program+<run>
		63 5F 5F 61 73 79 6E 63 30 00 00                ) // c__async0..

        .custom instance void class [mscorlib]System.Diagnostics.DebuggerStepThroughAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x207c
	// Code size 33 (0x21)
	.maxstack 3
	.locals init (
		valuetype Program/'<run>c__async0'	V_0)
	IL_0000:  ldloca.s 0
	IL_0002:  call valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<!0> valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<int32>::Create()
	IL_0007:  stfld valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<int32> Program/'<run>c__async0'::$builder
	IL_000c:  ldloca.s 0
	IL_000e:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<int32> Program/'<run>c__async0'::$builder
	IL_0013:  dup 
	IL_0014:  ldloca.s 0
	IL_0016:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<int32>::Start<valuetype Program/'<run>c__async0'> ([out] !!0&)
	IL_001b:  call instance class [mscorlib]System.Threading.Tasks.Task`1<!0> valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<int32>::get_Task()
	IL_0020:  ret 
    } // end of method Program::run

    // method line 4
    .method private static hidebysig 
           default class [mscorlib]System.Threading.Tasks.Task`1<int32> inner ()  cil managed 
    {
        .custom instance void class [mscorlib]System.Runtime.CompilerServices.AsyncStateMachineAttribute::'.ctor'(class [mscorlib]System.Type) =  (
		01 00 18 50 72 6F 67 72 61 6D 2B 3C 69 6E 6E 65   // ...Program+<inne
		72 3E 63 5F 5F 61 73 79 6E 63 31 00 00          ) // r>c__async1..

        .custom instance void class [mscorlib]System.Diagnostics.DebuggerStepThroughAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x20ac
	// Code size 33 (0x21)
	.maxstack 3
	.locals init (
		valuetype Program/'<inner>c__async1'	V_0)
	IL_0000:  ldloca.s 0
	IL_0002:  call valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<!0> valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<int32>::Create()
	IL_0007:  stfld valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<int32> Program/'<inner>c__async1'::$builder
	IL_000c:  ldloca.s 0
	IL_000e:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<int32> Program/'<inner>c__async1'::$builder
	IL_0013:  dup 
	IL_0014:  ldloca.s 0
	IL_0016:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<int32>::Start<valuetype Program/'<inner>c__async1'> ([out] !!0&)
	IL_001b:  call instance class [mscorlib]System.Threading.Tasks.Task`1<!0> valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<int32>::get_Task()
	IL_0020:  ret 
    } // end of method Program::inner

    // method line 5
    .method private static hidebysig 
           default class [mscorlib]System.Threading.Tasks.Task whenAny ()  cil managed 
    {
        .custom instance void class [mscorlib]System.Runtime.CompilerServices.AsyncStateMachineAttribute::'.ctor'(class [mscorlib]System.Type) =  (
		01 00 1A 50 72 6F 67 72 61 6D 2B 3C 77 68 65 6E   // ...Program+<when
		41 6E 79 3E 63 5F 5F 61 73 79 6E 63 32 00 00    ) // Any>c__async2..

        .custom instance void class [mscorlib]System.Diagnostics.DebuggerStepThroughAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x20dc
	// Code size 33 (0x21)
	.maxstack 3
	.locals init (
		valuetype Program/'<whenAny>c__async2'	V_0)
	IL_0000:  ldloca.s 0
	IL_0002:  call valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::Create()
	IL_0007:  stfld valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Program/'<whenAny>c__async2'::$builder
	IL_000c:  ldloca.s 0
	IL_000e:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Program/'<whenAny>c__async2'::$builder
	IL_0013:  dup 
	IL_0014:  ldloca.s 0
	IL_0016:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::Start<valuetype Program/'<whenAny>c__async2'> ([out] !!0&)
	IL_001b:  call instance class [mscorlib]System.Threading.Tasks.Task valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::get_Task()
	IL_0020:  ret 
    } // end of method Program::whenAny

    // method line 6
    .method private static hidebysig 
           default class [mscorlib]System.Threading.Tasks.Task makeTask (string name, int32 count)  cil managed 
    {
        .custom instance void class [mscorlib]System.Runtime.CompilerServices.AsyncStateMachineAttribute::'.ctor'(class [mscorlib]System.Type) =  (
		01 00 1B 50 72 6F 67 72 61 6D 2B 3C 6D 61 6B 65   // ...Program+<make
		54 61 73 6B 3E 63 5F 5F 61 73 79 6E 63 33 00 00 ) // Task>c__async3..

        .custom instance void class [mscorlib]System.Diagnostics.DebuggerStepThroughAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x210c
	// Code size 49 (0x31)
	.maxstack 3
	.locals init (
		valuetype Program/'<makeTask>c__async3'	V_0)
	IL_0000:  ldloca.s 0
	IL_0002:  ldarg.0 
	IL_0003:  stfld string Program/'<makeTask>c__async3'::name
	IL_0008:  ldloca.s 0
	IL_000a:  ldarg.1 
	IL_000b:  stfld int32 Program/'<makeTask>c__async3'::count
	IL_0010:  ldloca.s 0
	IL_0012:  call valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::Create()
	IL_0017:  stfld valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Program/'<makeTask>c__async3'::$builder
	IL_001c:  ldloca.s 0
	IL_001e:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Program/'<makeTask>c__async3'::$builder
	IL_0023:  dup 
	IL_0024:  ldloca.s 0
	IL_0026:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::Start<valuetype Program/'<makeTask>c__async3'> ([out] !!0&)
	IL_002b:  call instance class [mscorlib]System.Threading.Tasks.Task valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::get_Task()
	IL_0030:  ret 
    } // end of method Program::makeTask

    // method line 7
    .method private static hidebysig 
           default class [mscorlib]System.Threading.Tasks.Task checkCompleted (string name, class [mscorlib]System.Threading.Tasks.Task t)  cil managed 
    {
        .custom instance void class [mscorlib]System.Runtime.CompilerServices.AsyncStateMachineAttribute::'.ctor'(class [mscorlib]System.Type) =  (
		01 00 21 50 72 6F 67 72 61 6D 2B 3C 63 68 65 63   // ..!Program+<chec
		6B 43 6F 6D 70 6C 65 74 65 64 3E 63 5F 5F 61 73   // kCompleted>c__as
		79 6E 63 34 00 00                               ) // ync4..

        .custom instance void class [mscorlib]System.Diagnostics.DebuggerStepThroughAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x214c
	// Code size 49 (0x31)
	.maxstack 3
	.locals init (
		valuetype Program/'<checkCompleted>c__async4'	V_0)
	IL_0000:  ldloca.s 0
	IL_0002:  ldarg.0 
	IL_0003:  stfld string Program/'<checkCompleted>c__async4'::name
	IL_0008:  ldloca.s 0
	IL_000a:  ldarg.1 
	IL_000b:  stfld class [mscorlib]System.Threading.Tasks.Task Program/'<checkCompleted>c__async4'::t
	IL_0010:  ldloca.s 0
	IL_0012:  call valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::Create()
	IL_0017:  stfld valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Program/'<checkCompleted>c__async4'::$builder
	IL_001c:  ldloca.s 0
	IL_001e:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Program/'<checkCompleted>c__async4'::$builder
	IL_0023:  dup 
	IL_0024:  ldloca.s 0
	IL_0026:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::Start<valuetype Program/'<checkCompleted>c__async4'> ([out] !!0&)
	IL_002b:  call instance class [mscorlib]System.Threading.Tasks.Task valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::get_Task()
	IL_0030:  ret 
    } // end of method Program::checkCompleted

  .class nested private auto ansi sealed beforefieldinit '<run>c__async0'
  	extends [mscorlib]System.ValueType
  	implements [mscorlib]System.Runtime.CompilerServices.IAsyncStateMachine  {
    .custom instance void class [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::'.ctor'() =  (01 00 00 00 ) // ....

    .field  assembly  int32 '<n>__0'
    .field  assembly  valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<int32> $builder
    .field  assembly  int32 $PC
    .field  private  valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter $awaiter0
    .field  private  valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable/ConfiguredTaskAwaiter $awaiter1
    .field  private  valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<int32> $awaiter2
    .field  private  int32 $stack0
    .field  private  valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable`1/ConfiguredTaskAwaiter<int32> $awaiter3

    // method line 8
    .method public final virtual hidebysig newslot 
           instance default void MoveNext ()  cil managed 
    {
        // Method begins at RVA 0x218c
	// Code size 525 (0x20d)
	.maxstack 3
	.locals init (
		unsigned int32	V_0,
		valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable	V_1,
		int32	V_2,
		valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable`1<int32>	V_3,
		int32	V_4,
		class [mscorlib]System.Exception	V_5)
	IL_0000:  ldarg.0 
	IL_0001:  ldfld int32 Program/'<run>c__async0'::$PC
	IL_0006:  stloc.0 
	IL_0007:  ldarg.0 
	IL_0008:  ldc.i4.m1 
	IL_0009:  stfld int32 Program/'<run>c__async0'::$PC
	.try { // 0
	  IL_000e:  ldloc.0 
	  IL_000f:  switch (
	    IL_002d,
	    IL_0077,
	    IL_00d4,
	    IL_012e,
	    IL_01a5)
	  IL_0028:  leave IL_020c

	  IL_002d:  nop 
	  IL_002e:  ldstr "1"
	  IL_0033:  call void class [mscorlib]System.Console::WriteLine(string)
	  IL_0038:  ldarg.0 
	  IL_0039:  ldc.i4.1 
	  IL_003a:  call class [mscorlib]System.Threading.Tasks.Task class [mscorlib]System.Threading.Tasks.Task::Delay(int32)
	  IL_003f:  callvirt instance valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter class [mscorlib]System.Threading.Tasks.Task::GetAwaiter()
	  IL_0044:  stfld valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter Program/'<run>c__async0'::$awaiter0
	  IL_0049:  ldarg.0 
	  IL_004a:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter Program/'<run>c__async0'::$awaiter0
	  IL_004f:  call instance bool valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter::get_IsCompleted()
	  IL_0054:  brtrue IL_0077

	  IL_0059:  ldarg.0 
	  IL_005a:  ldc.i4.1 
	  IL_005b:  stfld int32 Program/'<run>c__async0'::$PC
	  IL_0060:  ldarg.0 
	  IL_0061:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<int32> Program/'<run>c__async0'::$builder
	  IL_0066:  ldarg.0 
	  IL_0067:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter Program/'<run>c__async0'::$awaiter0
	  IL_006c:  ldarg.0 
	  IL_006d:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<int32>::AwaitUnsafeOnCompleted<valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter, valuetype Program/'<run>c__async0'> ([out] !!0&, [out] !!1&)
	  IL_0072:  leave IL_020c

	  IL_0077:  ldarg.0 
	  IL_0078:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter Program/'<run>c__async0'::$awaiter0
	  IL_007d:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter::GetResult()
	  IL_0082:  ldstr "2"
	  IL_0087:  call void class [mscorlib]System.Console::WriteLine(string)
	  IL_008c:  ldarg.0 
	  IL_008d:  ldc.i4.1 
	  IL_008e:  call class [mscorlib]System.Threading.Tasks.Task class [mscorlib]System.Threading.Tasks.Task::Delay(int32)
	  IL_0093:  ldc.i4.0 
	  IL_0094:  callvirt instance valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable class [mscorlib]System.Threading.Tasks.Task::ConfigureAwait(bool)
	  IL_0099:  stloc.1 
	  IL_009a:  ldloca.s 1
	  IL_009c:  call instance valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable/ConfiguredTaskAwaiter valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable::GetAwaiter()
	  IL_00a1:  stfld valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable/ConfiguredTaskAwaiter Program/'<run>c__async0'::$awaiter1
	  IL_00a6:  ldarg.0 
	  IL_00a7:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable/ConfiguredTaskAwaiter Program/'<run>c__async0'::$awaiter1
	  IL_00ac:  call instance bool valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable/ConfiguredTaskAwaiter::get_IsCompleted()
	  IL_00b1:  brtrue IL_00d4

	  IL_00b6:  ldarg.0 
	  IL_00b7:  ldc.i4.2 
	  IL_00b8:  stfld int32 Program/'<run>c__async0'::$PC
	  IL_00bd:  ldarg.0 
	  IL_00be:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<int32> Program/'<run>c__async0'::$builder
	  IL_00c3:  ldarg.0 
	  IL_00c4:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable/ConfiguredTaskAwaiter Program/'<run>c__async0'::$awaiter1
	  IL_00c9:  ldarg.0 
	  IL_00ca:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<int32>::AwaitUnsafeOnCompleted<valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable/ConfiguredTaskAwaiter, valuetype Program/'<run>c__async0'> ([out] !!0&, [out] !!1&)
	  IL_00cf:  leave IL_020c

	  IL_00d4:  ldarg.0 
	  IL_00d5:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable/ConfiguredTaskAwaiter Program/'<run>c__async0'::$awaiter1
	  IL_00da:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable/ConfiguredTaskAwaiter::GetResult()
	  IL_00df:  ldstr "3"
	  IL_00e4:  call void class [mscorlib]System.Console::WriteLine(string)
	  IL_00e9:  ldarg.0 
	  IL_00ea:  ldc.i4.0 
	  IL_00eb:  stfld int32 Program/'<run>c__async0'::'<n>__0'
	  IL_00f0:  ldarg.0 
	  IL_00f1:  call class [mscorlib]System.Threading.Tasks.Task`1<int32> class Program::inner()
	  IL_00f6:  callvirt instance valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<!0> class [mscorlib]System.Threading.Tasks.Task`1<int32>::GetAwaiter()
	  IL_00fb:  stfld valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<int32> Program/'<run>c__async0'::$awaiter2
	  IL_0100:  ldarg.0 
	  IL_0101:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<int32> Program/'<run>c__async0'::$awaiter2
	  IL_0106:  call instance bool valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<int32>::get_IsCompleted()
	  IL_010b:  brtrue IL_012e

	  IL_0110:  ldarg.0 
	  IL_0111:  ldc.i4.3 
	  IL_0112:  stfld int32 Program/'<run>c__async0'::$PC
	  IL_0117:  ldarg.0 
	  IL_0118:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<int32> Program/'<run>c__async0'::$builder
	  IL_011d:  ldarg.0 
	  IL_011e:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<int32> Program/'<run>c__async0'::$awaiter2
	  IL_0123:  ldarg.0 
	  IL_0124:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<int32>::AwaitUnsafeOnCompleted<valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<int32>, valuetype Program/'<run>c__async0'> ([out] !!0&, [out] !!1&)
	  IL_0129:  leave IL_020c

	  IL_012e:  ldarg.0 
	  IL_012f:  ldfld int32 Program/'<run>c__async0'::'<n>__0'
	  IL_0134:  ldarg.0 
	  IL_0135:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<int32> Program/'<run>c__async0'::$awaiter2
	  IL_013a:  call instance !0 valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<int32>::GetResult()
	  IL_013f:  add 
	  IL_0140:  stloc.2 
	  IL_0141:  ldarg.0 
	  IL_0142:  ldloc.2 
	  IL_0143:  stfld int32 Program/'<run>c__async0'::$stack0
	  IL_0148:  ldarg.0 
	  IL_0149:  ldarg.0 
	  IL_014a:  ldfld int32 Program/'<run>c__async0'::$stack0
	  IL_014f:  stfld int32 Program/'<run>c__async0'::'<n>__0'
	  IL_0154:  ldstr "4"
	  IL_0159:  call void class [mscorlib]System.Console::WriteLine(string)
	  IL_015e:  ldarg.0 
	  IL_015f:  call class [mscorlib]System.Threading.Tasks.Task`1<int32> class Program::inner()
	  IL_0164:  ldc.i4.0 
	  IL_0165:  callvirt instance valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable`1<!0> class [mscorlib]System.Threading.Tasks.Task`1<int32>::ConfigureAwait(bool)
	  IL_016a:  stloc.3 
	  IL_016b:  ldloca.s 3
	  IL_016d:  call instance valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable`1/ConfiguredTaskAwaiter<!0> valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable`1<int32>::GetAwaiter()
	  IL_0172:  stfld valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable`1/ConfiguredTaskAwaiter<int32> Program/'<run>c__async0'::$awaiter3
	  IL_0177:  ldarg.0 
	  IL_0178:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable`1/ConfiguredTaskAwaiter<int32> Program/'<run>c__async0'::$awaiter3
	  IL_017d:  call instance bool valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable`1/ConfiguredTaskAwaiter<int32>::get_IsCompleted()
	  IL_0182:  brtrue IL_01a5

	  IL_0187:  ldarg.0 
	  IL_0188:  ldc.i4.4 
	  IL_0189:  stfld int32 Program/'<run>c__async0'::$PC
	  IL_018e:  ldarg.0 
	  IL_018f:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<int32> Program/'<run>c__async0'::$builder
	  IL_0194:  ldarg.0 
	  IL_0195:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable`1/ConfiguredTaskAwaiter<int32> Program/'<run>c__async0'::$awaiter3
	  IL_019a:  ldarg.0 
	  IL_019b:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<int32>::AwaitUnsafeOnCompleted<valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable`1/ConfiguredTaskAwaiter<int32>, valuetype Program/'<run>c__async0'> ([out] !!0&, [out] !!1&)
	  IL_01a0:  leave IL_020c

	  IL_01a5:  ldarg.0 
	  IL_01a6:  ldfld int32 Program/'<run>c__async0'::'<n>__0'
	  IL_01ab:  ldarg.0 
	  IL_01ac:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable`1/ConfiguredTaskAwaiter<int32> Program/'<run>c__async0'::$awaiter3
	  IL_01b1:  call instance !0 valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable`1/ConfiguredTaskAwaiter<int32>::GetResult()
	  IL_01b6:  add 
	  IL_01b7:  stloc.2 
	  IL_01b8:  ldarg.0 
	  IL_01b9:  ldloc.2 
	  IL_01ba:  stfld int32 Program/'<run>c__async0'::$stack0
	  IL_01bf:  ldarg.0 
	  IL_01c0:  ldarg.0 
	  IL_01c1:  ldfld int32 Program/'<run>c__async0'::$stack0
	  IL_01c6:  stfld int32 Program/'<run>c__async0'::'<n>__0'
	  IL_01cb:  ldarg.0 
	  IL_01cc:  ldfld int32 Program/'<run>c__async0'::'<n>__0'
	  IL_01d1:  stloc.s 4
	  IL_01d3:  leave IL_01d8

	  IL_01d8:  leave IL_01f8

	} // end .try 0
	catch class [mscorlib]System.Exception { // 0
	  IL_01dd:  stloc.s 5
	  IL_01df:  ldarg.0 
	  IL_01e0:  ldc.i4.m1 
	  IL_01e1:  stfld int32 Program/'<run>c__async0'::$PC
	  IL_01e6:  ldarg.0 
	  IL_01e7:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<int32> Program/'<run>c__async0'::$builder
	  IL_01ec:  ldloc.s 5
	  IL_01ee:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<int32>::SetException(class [mscorlib]System.Exception)
	  IL_01f3:  leave IL_020c

	} // end handler 0
	IL_01f8:  ldarg.0 
	IL_01f9:  ldc.i4.m1 
	IL_01fa:  stfld int32 Program/'<run>c__async0'::$PC
	IL_01ff:  ldarg.0 
	IL_0200:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<int32> Program/'<run>c__async0'::$builder
	IL_0205:  ldloc.s 4
	IL_0207:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<int32>::SetResult(!0)
	IL_020c:  ret 
    } // end of method <run>c__async0::MoveNext

    // method line 9
    .method public final virtual hidebysig newslot 
           instance default void SetStateMachine (class [mscorlib]System.Runtime.CompilerServices.IAsyncStateMachine stateMachine)  cil managed 
    {
        .custom instance void class [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x23c4
	// Code size 13 (0xd)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<int32> Program/'<run>c__async0'::$builder
	IL_0006:  ldarg.1 
	IL_0007:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<int32>::SetStateMachine(class [mscorlib]System.Runtime.CompilerServices.IAsyncStateMachine)
	IL_000c:  ret 
    } // end of method <run>c__async0::SetStateMachine

  } // end of class <run>c__async0

  .class nested private auto ansi sealed beforefieldinit '<inner>c__async1'
  	extends [mscorlib]System.ValueType
  	implements [mscorlib]System.Runtime.CompilerServices.IAsyncStateMachine  {
    .custom instance void class [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::'.ctor'() =  (01 00 00 00 ) // ....

    .field  assembly  valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<int32> $builder
    .field  assembly  int32 $PC
    .field  private  valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter $awaiter0

    // method line 10
    .method public final virtual hidebysig newslot 
           instance default void MoveNext ()  cil managed 
    {
        // Method begins at RVA 0x23d4
	// Code size 165 (0xa5)
	.maxstack 3
	.locals init (
		unsigned int32	V_0,
		int32	V_1,
		class [mscorlib]System.Exception	V_2)
	IL_0000:  ldarg.0 
	IL_0001:  ldfld int32 Program/'<inner>c__async1'::$PC
	IL_0006:  stloc.0 
	IL_0007:  ldarg.0 
	IL_0008:  ldc.i4.m1 
	IL_0009:  stfld int32 Program/'<inner>c__async1'::$PC
	.try { // 0
	  IL_000e:  ldloc.0 
	  IL_000f:  switch (
	    IL_0021,
	    IL_0061)
	  IL_001c:  leave IL_00a4

	  IL_0021:  nop 
	  IL_0022:  ldarg.0 
	  IL_0023:  ldc.i4.1 
	  IL_0024:  call class [mscorlib]System.Threading.Tasks.Task class [mscorlib]System.Threading.Tasks.Task::Delay(int32)
	  IL_0029:  callvirt instance valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter class [mscorlib]System.Threading.Tasks.Task::GetAwaiter()
	  IL_002e:  stfld valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter Program/'<inner>c__async1'::$awaiter0
	  IL_0033:  ldarg.0 
	  IL_0034:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter Program/'<inner>c__async1'::$awaiter0
	  IL_0039:  call instance bool valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter::get_IsCompleted()
	  IL_003e:  brtrue IL_0061

	  IL_0043:  ldarg.0 
	  IL_0044:  ldc.i4.1 
	  IL_0045:  stfld int32 Program/'<inner>c__async1'::$PC
	  IL_004a:  ldarg.0 
	  IL_004b:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<int32> Program/'<inner>c__async1'::$builder
	  IL_0050:  ldarg.0 
	  IL_0051:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter Program/'<inner>c__async1'::$awaiter0
	  IL_0056:  ldarg.0 
	  IL_0057:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<int32>::AwaitUnsafeOnCompleted<valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter, valuetype Program/'<inner>c__async1'> ([out] !!0&, [out] !!1&)
	  IL_005c:  leave IL_00a4

	  IL_0061:  ldarg.0 
	  IL_0062:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter Program/'<inner>c__async1'::$awaiter0
	  IL_0067:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter::GetResult()
	  IL_006c:  ldc.i4.1 
	  IL_006d:  stloc.1 
	  IL_006e:  leave IL_0073

	  IL_0073:  leave IL_0091

	} // end .try 0
	catch class [mscorlib]System.Exception { // 0
	  IL_0078:  stloc.2 
	  IL_0079:  ldarg.0 
	  IL_007a:  ldc.i4.m1 
	  IL_007b:  stfld int32 Program/'<inner>c__async1'::$PC
	  IL_0080:  ldarg.0 
	  IL_0081:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<int32> Program/'<inner>c__async1'::$builder
	  IL_0086:  ldloc.2 
	  IL_0087:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<int32>::SetException(class [mscorlib]System.Exception)
	  IL_008c:  leave IL_00a4

	} // end handler 0
	IL_0091:  ldarg.0 
	IL_0092:  ldc.i4.m1 
	IL_0093:  stfld int32 Program/'<inner>c__async1'::$PC
	IL_0098:  ldarg.0 
	IL_0099:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<int32> Program/'<inner>c__async1'::$builder
	IL_009e:  ldloc.1 
	IL_009f:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<int32>::SetResult(!0)
	IL_00a4:  ret 
    } // end of method <inner>c__async1::MoveNext

    // method line 11
    .method public final virtual hidebysig newslot 
           instance default void SetStateMachine (class [mscorlib]System.Runtime.CompilerServices.IAsyncStateMachine stateMachine)  cil managed 
    {
        .custom instance void class [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x2498
	// Code size 13 (0xd)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<int32> Program/'<inner>c__async1'::$builder
	IL_0006:  ldarg.1 
	IL_0007:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<int32>::SetStateMachine(class [mscorlib]System.Runtime.CompilerServices.IAsyncStateMachine)
	IL_000c:  ret 
    } // end of method <inner>c__async1::SetStateMachine

  } // end of class <inner>c__async1

  .class nested private auto ansi sealed beforefieldinit '<whenAny>c__async2'
  	extends [mscorlib]System.ValueType
  	implements [mscorlib]System.Runtime.CompilerServices.IAsyncStateMachine  {
    .custom instance void class [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::'.ctor'() =  (01 00 00 00 ) // ....

    .field  assembly  class [mscorlib]System.Threading.Tasks.Task[] '<tx>__0'
    .field  assembly  int32 '<i>__1'
    .field  assembly  class [mscorlib]System.Threading.Tasks.Task '<t>__2'
    .field  assembly  valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder $builder
    .field  assembly  int32 $PC
    .field  private  valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<class [mscorlib]System.Threading.Tasks.Task> $awaiter0
    .field  private  valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter $awaiter1

    // method line 12
    .method public final virtual hidebysig newslot 
           instance default void MoveNext ()  cil managed 
    {
        // Method begins at RVA 0x24a8
	// Code size 535 (0x217)
	.maxstack 6
	.locals init (
		unsigned int32	V_0,
		int32	V_1,
		class [mscorlib]System.Threading.Tasks.Task	V_2,
		class [mscorlib]System.Exception	V_3)
	IL_0000:  ldarg.0 
	IL_0001:  ldfld int32 Program/'<whenAny>c__async2'::$PC
	IL_0006:  stloc.0 
	IL_0007:  ldarg.0 
	IL_0008:  ldc.i4.m1 
	IL_0009:  stfld int32 Program/'<whenAny>c__async2'::$PC
	.try { // 0
	  IL_000e:  ldloc.0 
	  IL_000f:  switch (
	    IL_0025,
	    IL_00a0,
	    IL_0177)
	  IL_0020:  leave IL_0216

	  IL_0025:  nop 
	  IL_0026:  ldarg.0 
	  IL_0027:  ldc.i4.3 
	  IL_0028:  newarr [mscorlib]System.Threading.Tasks.Task
	  IL_002d:  dup 
	  IL_002e:  ldc.i4.0 
	  IL_002f:  ldstr "task0"
	  IL_0034:  ldc.i4.1 
	  IL_0035:  call class [mscorlib]System.Threading.Tasks.Task class Program::makeTask(string, int32)
	  IL_003a:  stelem.ref 
	  IL_003b:  dup 
	  IL_003c:  ldc.i4.1 
	  IL_003d:  ldstr "task1"
	  IL_0042:  ldc.i4.2 
	  IL_0043:  call class [mscorlib]System.Threading.Tasks.Task class Program::makeTask(string, int32)
	  IL_0048:  stelem.ref 
	  IL_0049:  dup 
	  IL_004a:  ldc.i4.2 
	  IL_004b:  ldstr "task2"
	  IL_0050:  ldc.i4.3 
	  IL_0051:  call class [mscorlib]System.Threading.Tasks.Task class Program::makeTask(string, int32)
	  IL_0056:  stelem.ref 
	  IL_0057:  stfld class [mscorlib]System.Threading.Tasks.Task[] Program/'<whenAny>c__async2'::'<tx>__0'
	  IL_005c:  ldarg.0 
	  IL_005d:  ldarg.0 
	  IL_005e:  ldfld class [mscorlib]System.Threading.Tasks.Task[] Program/'<whenAny>c__async2'::'<tx>__0'
	  IL_0063:  call class [mscorlib]System.Threading.Tasks.Task`1<class [mscorlib]System.Threading.Tasks.Task> class [mscorlib]System.Threading.Tasks.Task::WhenAny(class [mscorlib]System.Threading.Tasks.Task[])
	  IL_0068:  callvirt instance valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<!0> class [mscorlib]System.Threading.Tasks.Task`1<class [mscorlib]System.Threading.Tasks.Task>::GetAwaiter()
	  IL_006d:  stfld valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<class [mscorlib]System.Threading.Tasks.Task> Program/'<whenAny>c__async2'::$awaiter0
	  IL_0072:  ldarg.0 
	  IL_0073:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<class [mscorlib]System.Threading.Tasks.Task> Program/'<whenAny>c__async2'::$awaiter0
	  IL_0078:  call instance bool valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<class [mscorlib]System.Threading.Tasks.Task>::get_IsCompleted()
	  IL_007d:  brtrue IL_00a0

	  IL_0082:  ldarg.0 
	  IL_0083:  ldc.i4.1 
	  IL_0084:  stfld int32 Program/'<whenAny>c__async2'::$PC
	  IL_0089:  ldarg.0 
	  IL_008a:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Program/'<whenAny>c__async2'::$builder
	  IL_008f:  ldarg.0 
	  IL_0090:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<class [mscorlib]System.Threading.Tasks.Task> Program/'<whenAny>c__async2'::$awaiter0
	  IL_0095:  ldarg.0 
	  IL_0096:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::AwaitUnsafeOnCompleted<valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<class [mscorlib]System.Threading.Tasks.Task>, valuetype Program/'<whenAny>c__async2'> ([out] !!0&, [out] !!1&)
	  IL_009b:  leave IL_0216

	  IL_00a0:  ldarg.0 
	  IL_00a1:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<class [mscorlib]System.Threading.Tasks.Task> Program/'<whenAny>c__async2'::$awaiter0
	  IL_00a6:  call instance !0 valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<class [mscorlib]System.Threading.Tasks.Task>::GetResult()
	  IL_00ab:  pop 
	  IL_00ac:  ldc.i4.0 
	  IL_00ad:  stloc.1 
	  IL_00ae:  br IL_00f9

	  IL_00b3:  nop 
	  IL_00b4:  ldarg.0 
	  IL_00b5:  ldfld class [mscorlib]System.Threading.Tasks.Task[] Program/'<whenAny>c__async2'::'<tx>__0'
	  IL_00ba:  ldloc.1 
	  IL_00bb:  ldelem.ref 
	  IL_00bc:  stloc.2 
	  IL_00bd:  ldc.i4.4 
	  IL_00be:  newarr [mscorlib]System.Object
	  IL_00c3:  dup 
	  IL_00c4:  ldc.i4.0 
	  IL_00c5:  ldstr "> task"
	  IL_00ca:  stelem.ref 
	  IL_00cb:  dup 
	  IL_00cc:  ldc.i4.1 
	  IL_00cd:  ldloc.1 
	  IL_00ce:  box [mscorlib]System.Int32
	  IL_00d3:  stelem.ref 
	  IL_00d4:  dup 
	  IL_00d5:  ldc.i4.2 
	  IL_00d6:  ldstr " IsCompleted:"
	  IL_00db:  stelem.ref 
	  IL_00dc:  dup 
	  IL_00dd:  ldc.i4.3 
	  IL_00de:  ldloc.2 
	  IL_00df:  callvirt instance bool class [mscorlib]System.Threading.Tasks.Task::get_IsCompleted()
	  IL_00e4:  box [mscorlib]System.Boolean
	  IL_00e9:  stelem.ref 
	  IL_00ea:  call string string::Concat(object[])
	  IL_00ef:  call void class [mscorlib]System.Console::WriteLine(string)
	  IL_00f4:  nop 
	  IL_00f5:  ldloc.1 
	  IL_00f6:  ldc.i4.1 
	  IL_00f7:  add 
	  IL_00f8:  stloc.1 
	  IL_00f9:  ldloc.1 
	  IL_00fa:  ldarg.0 
	  IL_00fb:  ldfld class [mscorlib]System.Threading.Tasks.Task[] Program/'<whenAny>c__async2'::'<tx>__0'
	  IL_0100:  ldlen 
	  IL_0101:  conv.i4 
	  IL_0102:  blt IL_00b3

	  IL_0107:  ldarg.0 
	  IL_0108:  ldc.i4.0 
	  IL_0109:  stfld int32 Program/'<whenAny>c__async2'::'<i>__1'
	  IL_010e:  br IL_01d3

	  IL_0113:  nop 
	  IL_0114:  ldarg.0 
	  IL_0115:  ldarg.0 
	  IL_0116:  ldfld class [mscorlib]System.Threading.Tasks.Task[] Program/'<whenAny>c__async2'::'<tx>__0'
	  IL_011b:  ldarg.0 
	  IL_011c:  ldfld int32 Program/'<whenAny>c__async2'::'<i>__1'
	  IL_0121:  ldelem.ref 
	  IL_0122:  stfld class [mscorlib]System.Threading.Tasks.Task Program/'<whenAny>c__async2'::'<t>__2'
	  IL_0127:  ldarg.0 
	  IL_0128:  ldfld class [mscorlib]System.Threading.Tasks.Task Program/'<whenAny>c__async2'::'<t>__2'
	  IL_012d:  callvirt instance bool class [mscorlib]System.Threading.Tasks.Task::get_IsCompleted()
	  IL_0132:  brtrue IL_01c4

	  IL_0137:  nop 
	  IL_0138:  ldarg.0 
	  IL_0139:  ldarg.0 
	  IL_013a:  ldfld class [mscorlib]System.Threading.Tasks.Task Program/'<whenAny>c__async2'::'<t>__2'
	  IL_013f:  callvirt instance valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter class [mscorlib]System.Threading.Tasks.Task::GetAwaiter()
	  IL_0144:  stfld valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter Program/'<whenAny>c__async2'::$awaiter1
	  IL_0149:  ldarg.0 
	  IL_014a:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter Program/'<whenAny>c__async2'::$awaiter1
	  IL_014f:  call instance bool valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter::get_IsCompleted()
	  IL_0154:  brtrue IL_0177

	  IL_0159:  ldarg.0 
	  IL_015a:  ldc.i4.2 
	  IL_015b:  stfld int32 Program/'<whenAny>c__async2'::$PC
	  IL_0160:  ldarg.0 
	  IL_0161:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Program/'<whenAny>c__async2'::$builder
	  IL_0166:  ldarg.0 
	  IL_0167:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter Program/'<whenAny>c__async2'::$awaiter1
	  IL_016c:  ldarg.0 
	  IL_016d:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::AwaitUnsafeOnCompleted<valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter, valuetype Program/'<whenAny>c__async2'> ([out] !!0&, [out] !!1&)
	  IL_0172:  leave IL_0216

	  IL_0177:  ldarg.0 
	  IL_0178:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter Program/'<whenAny>c__async2'::$awaiter1
	  IL_017d:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter::GetResult()
	  IL_0182:  ldc.i4.4 
	  IL_0183:  newarr [mscorlib]System.Object
	  IL_0188:  dup 
	  IL_0189:  ldc.i4.0 
	  IL_018a:  ldstr ">> await task "
	  IL_018f:  stelem.ref 
	  IL_0190:  dup 
	  IL_0191:  ldc.i4.1 
	  IL_0192:  ldarg.0 
	  IL_0193:  ldfld int32 Program/'<whenAny>c__async2'::'<i>__1'
	  IL_0198:  box [mscorlib]System.Int32
	  IL_019d:  stelem.ref 
	  IL_019e:  dup 
	  IL_019f:  ldc.i4.2 
	  IL_01a0:  ldstr " IsCompleted:"
	  IL_01a5:  stelem.ref 
	  IL_01a6:  dup 
	  IL_01a7:  ldc.i4.3 
	  IL_01a8:  ldarg.0 
	  IL_01a9:  ldfld class [mscorlib]System.Threading.Tasks.Task Program/'<whenAny>c__async2'::'<t>__2'
	  IL_01ae:  callvirt instance bool class [mscorlib]System.Threading.Tasks.Task::get_IsCompleted()
	  IL_01b3:  box [mscorlib]System.Boolean
	  IL_01b8:  stelem.ref 
	  IL_01b9:  call string string::Concat(object[])
	  IL_01be:  call void class [mscorlib]System.Console::WriteLine(string)
	  IL_01c3:  nop 
	  IL_01c4:  nop 
	  IL_01c5:  ldarg.0 
	  IL_01c6:  ldarg.0 
	  IL_01c7:  ldfld int32 Program/'<whenAny>c__async2'::'<i>__1'
	  IL_01cc:  ldc.i4.1 
	  IL_01cd:  add 
	  IL_01ce:  stfld int32 Program/'<whenAny>c__async2'::'<i>__1'
	  IL_01d3:  ldarg.0 
	  IL_01d4:  ldfld int32 Program/'<whenAny>c__async2'::'<i>__1'
	  IL_01d9:  ldarg.0 
	  IL_01da:  ldfld class [mscorlib]System.Threading.Tasks.Task[] Program/'<whenAny>c__async2'::'<tx>__0'
	  IL_01df:  ldlen 
	  IL_01e0:  conv.i4 
	  IL_01e1:  blt IL_0113

	  IL_01e6:  leave IL_0204

	} // end .try 0
	catch class [mscorlib]System.Exception { // 0
	  IL_01eb:  stloc.3 
	  IL_01ec:  ldarg.0 
	  IL_01ed:  ldc.i4.m1 
	  IL_01ee:  stfld int32 Program/'<whenAny>c__async2'::$PC
	  IL_01f3:  ldarg.0 
	  IL_01f4:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Program/'<whenAny>c__async2'::$builder
	  IL_01f9:  ldloc.3 
	  IL_01fa:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::SetException(class [mscorlib]System.Exception)
	  IL_01ff:  leave IL_0216

	} // end handler 0
	IL_0204:  ldarg.0 
	IL_0205:  ldc.i4.m1 
	IL_0206:  stfld int32 Program/'<whenAny>c__async2'::$PC
	IL_020b:  ldarg.0 
	IL_020c:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Program/'<whenAny>c__async2'::$builder
	IL_0211:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::SetResult()
	IL_0216:  ret 
    } // end of method <whenAny>c__async2::MoveNext

    // method line 13
    .method public final virtual hidebysig newslot 
           instance default void SetStateMachine (class [mscorlib]System.Runtime.CompilerServices.IAsyncStateMachine stateMachine)  cil managed 
    {
        .custom instance void class [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x26e8
	// Code size 13 (0xd)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Program/'<whenAny>c__async2'::$builder
	IL_0006:  ldarg.1 
	IL_0007:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::SetStateMachine(class [mscorlib]System.Runtime.CompilerServices.IAsyncStateMachine)
	IL_000c:  ret 
    } // end of method <whenAny>c__async2::SetStateMachine

  } // end of class <whenAny>c__async2

  .class nested private auto ansi sealed beforefieldinit '<makeTask>c__async3'
  	extends [mscorlib]System.ValueType
  	implements [mscorlib]System.Runtime.CompilerServices.IAsyncStateMachine  {
    .custom instance void class [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::'.ctor'() =  (01 00 00 00 ) // ....

    .field  assembly  string name
    .field  assembly  int32 '<i>__0'
    .field  assembly  int32 count
    .field  assembly  valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder $builder
    .field  assembly  int32 $PC
    .field  private  valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable/ConfiguredTaskAwaiter $awaiter0

    // method line 14
    .method public final virtual hidebysig newslot 
           instance default void MoveNext ()  cil managed 
    {
        // Method begins at RVA 0x26f8
	// Code size 286 (0x11e)
	.maxstack 3
	.locals init (
		unsigned int32	V_0,
		valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable	V_1,
		class [mscorlib]System.Exception	V_2)
	IL_0000:  ldarg.0 
	IL_0001:  ldfld int32 Program/'<makeTask>c__async3'::$PC
	IL_0006:  stloc.0 
	IL_0007:  ldarg.0 
	IL_0008:  ldc.i4.m1 
	IL_0009:  stfld int32 Program/'<makeTask>c__async3'::$PC
	.try { // 0
	  IL_000e:  ldloc.0 
	  IL_000f:  switch (
	    IL_0021,
	    IL_00ad)
	  IL_001c:  leave IL_011d

	  IL_0021:  nop 
	  IL_0022:  ldarg.0 
	  IL_0023:  ldfld string Program/'<makeTask>c__async3'::name
	  IL_0028:  ldstr " begin"
	  IL_002d:  call string string::Concat(string, string)
	  IL_0032:  call void class [mscorlib]System.Console::WriteLine(string)
	  IL_0037:  ldarg.0 
	  IL_0038:  ldc.i4.0 
	  IL_0039:  stfld int32 Program/'<makeTask>c__async3'::'<i>__0'
	  IL_003e:  br IL_00c7

	  IL_0043:  nop 
	  IL_0044:  ldarg.0 
	  IL_0045:  ldfld string Program/'<makeTask>c__async3'::name
	  IL_004a:  ldstr " loop "
	  IL_004f:  ldarg.0 
	  IL_0050:  ldfld int32 Program/'<makeTask>c__async3'::'<i>__0'
	  IL_0055:  box [mscorlib]System.Int32
	  IL_005a:  call string string::Concat(object, object, object)
	  IL_005f:  call void class [mscorlib]System.Console::WriteLine(string)
	  IL_0064:  ldarg.0 
	  IL_0065:  ldc.i4.s 0x64
	  IL_0067:  call class [mscorlib]System.Threading.Tasks.Task class [mscorlib]System.Threading.Tasks.Task::Delay(int32)
	  IL_006c:  ldc.i4.0 
	  IL_006d:  callvirt instance valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable class [mscorlib]System.Threading.Tasks.Task::ConfigureAwait(bool)
	  IL_0072:  stloc.1 
	  IL_0073:  ldloca.s 1
	  IL_0075:  call instance valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable/ConfiguredTaskAwaiter valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable::GetAwaiter()
	  IL_007a:  stfld valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable/ConfiguredTaskAwaiter Program/'<makeTask>c__async3'::$awaiter0
	  IL_007f:  ldarg.0 
	  IL_0080:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable/ConfiguredTaskAwaiter Program/'<makeTask>c__async3'::$awaiter0
	  IL_0085:  call instance bool valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable/ConfiguredTaskAwaiter::get_IsCompleted()
	  IL_008a:  brtrue IL_00ad

	  IL_008f:  ldarg.0 
	  IL_0090:  ldc.i4.1 
	  IL_0091:  stfld int32 Program/'<makeTask>c__async3'::$PC
	  IL_0096:  ldarg.0 
	  IL_0097:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Program/'<makeTask>c__async3'::$builder
	  IL_009c:  ldarg.0 
	  IL_009d:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable/ConfiguredTaskAwaiter Program/'<makeTask>c__async3'::$awaiter0
	  IL_00a2:  ldarg.0 
	  IL_00a3:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::AwaitUnsafeOnCompleted<valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable/ConfiguredTaskAwaiter, valuetype Program/'<makeTask>c__async3'> ([out] !!0&, [out] !!1&)
	  IL_00a8:  leave IL_011d

	  IL_00ad:  ldarg.0 
	  IL_00ae:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable/ConfiguredTaskAwaiter Program/'<makeTask>c__async3'::$awaiter0
	  IL_00b3:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable/ConfiguredTaskAwaiter::GetResult()
	  IL_00b8:  nop 
	  IL_00b9:  ldarg.0 
	  IL_00ba:  ldarg.0 
	  IL_00bb:  ldfld int32 Program/'<makeTask>c__async3'::'<i>__0'
	  IL_00c0:  ldc.i4.1 
	  IL_00c1:  add 
	  IL_00c2:  stfld int32 Program/'<makeTask>c__async3'::'<i>__0'
	  IL_00c7:  ldarg.0 
	  IL_00c8:  ldfld int32 Program/'<makeTask>c__async3'::'<i>__0'
	  IL_00cd:  ldarg.0 
	  IL_00ce:  ldfld int32 Program/'<makeTask>c__async3'::count
	  IL_00d3:  blt IL_0043

	  IL_00d8:  ldarg.0 
	  IL_00d9:  ldfld string Program/'<makeTask>c__async3'::name
	  IL_00de:  ldstr " end"
	  IL_00e3:  call string string::Concat(string, string)
	  IL_00e8:  call void class [mscorlib]System.Console::WriteLine(string)
	  IL_00ed:  leave IL_010b

	} // end .try 0
	catch class [mscorlib]System.Exception { // 0
	  IL_00f2:  stloc.2 
	  IL_00f3:  ldarg.0 
	  IL_00f4:  ldc.i4.m1 
	  IL_00f5:  stfld int32 Program/'<makeTask>c__async3'::$PC
	  IL_00fa:  ldarg.0 
	  IL_00fb:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Program/'<makeTask>c__async3'::$builder
	  IL_0100:  ldloc.2 
	  IL_0101:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::SetException(class [mscorlib]System.Exception)
	  IL_0106:  leave IL_011d

	} // end handler 0
	IL_010b:  ldarg.0 
	IL_010c:  ldc.i4.m1 
	IL_010d:  stfld int32 Program/'<makeTask>c__async3'::$PC
	IL_0112:  ldarg.0 
	IL_0113:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Program/'<makeTask>c__async3'::$builder
	IL_0118:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::SetResult()
	IL_011d:  ret 
    } // end of method <makeTask>c__async3::MoveNext

    // method line 15
    .method public final virtual hidebysig newslot 
           instance default void SetStateMachine (class [mscorlib]System.Runtime.CompilerServices.IAsyncStateMachine stateMachine)  cil managed 
    {
        .custom instance void class [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x2834
	// Code size 13 (0xd)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Program/'<makeTask>c__async3'::$builder
	IL_0006:  ldarg.1 
	IL_0007:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::SetStateMachine(class [mscorlib]System.Runtime.CompilerServices.IAsyncStateMachine)
	IL_000c:  ret 
    } // end of method <makeTask>c__async3::SetStateMachine

  } // end of class <makeTask>c__async3

  .class nested private auto ansi sealed beforefieldinit '<checkCompleted>c__async4'
  	extends [mscorlib]System.ValueType
  	implements [mscorlib]System.Runtime.CompilerServices.IAsyncStateMachine  {
    .custom instance void class [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::'.ctor'() =  (01 00 00 00 ) // ....

    .field  assembly  string name
    .field  assembly  class [mscorlib]System.Threading.Tasks.Task t
    .field  assembly  valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder $builder
    .field  assembly  int32 $PC
    .field  private  valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter $awaiter0

    // method line 16
    .method public final virtual hidebysig newslot 
           instance default void MoveNext ()  cil managed 
    {
        // Method begins at RVA 0x2844
	// Code size 249 (0xf9)
	.maxstack 3
	.locals init (
		unsigned int32	V_0,
		class [mscorlib]System.Exception	V_1)
	IL_0000:  ldarg.0 
	IL_0001:  ldfld int32 Program/'<checkCompleted>c__async4'::$PC
	IL_0006:  stloc.0 
	IL_0007:  ldarg.0 
	IL_0008:  ldc.i4.m1 
	IL_0009:  stfld int32 Program/'<checkCompleted>c__async4'::$PC
	.try { // 0
	  IL_000e:  ldloc.0 
	  IL_000f:  switch (
	    IL_0021,
	    IL_0097)
	  IL_001c:  leave IL_00f8

	  IL_0021:  nop 
	  IL_0022:  ldarg.0 
	  IL_0023:  ldfld string Program/'<checkCompleted>c__async4'::name
	  IL_0028:  ldstr " IsCompleted:"
	  IL_002d:  ldarg.0 
	  IL_002e:  ldfld class [mscorlib]System.Threading.Tasks.Task Program/'<checkCompleted>c__async4'::t
	  IL_0033:  callvirt instance bool class [mscorlib]System.Threading.Tasks.Task::get_IsCompleted()
	  IL_0038:  box [mscorlib]System.Boolean
	  IL_003d:  call string string::Concat(object, object, object)
	  IL_0042:  call void class [mscorlib]System.Console::WriteLine(string)
	  IL_0047:  ldarg.0 
	  IL_0048:  ldfld class [mscorlib]System.Threading.Tasks.Task Program/'<checkCompleted>c__async4'::t
	  IL_004d:  callvirt instance bool class [mscorlib]System.Threading.Tasks.Task::get_IsCompleted()
	  IL_0052:  brtrue IL_00c8

	  IL_0057:  nop 
	  IL_0058:  ldarg.0 
	  IL_0059:  ldarg.0 
	  IL_005a:  ldfld class [mscorlib]System.Threading.Tasks.Task Program/'<checkCompleted>c__async4'::t
	  IL_005f:  callvirt instance valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter class [mscorlib]System.Threading.Tasks.Task::GetAwaiter()
	  IL_0064:  stfld valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter Program/'<checkCompleted>c__async4'::$awaiter0
	  IL_0069:  ldarg.0 
	  IL_006a:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter Program/'<checkCompleted>c__async4'::$awaiter0
	  IL_006f:  call instance bool valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter::get_IsCompleted()
	  IL_0074:  brtrue IL_0097

	  IL_0079:  ldarg.0 
	  IL_007a:  ldc.i4.1 
	  IL_007b:  stfld int32 Program/'<checkCompleted>c__async4'::$PC
	  IL_0080:  ldarg.0 
	  IL_0081:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Program/'<checkCompleted>c__async4'::$builder
	  IL_0086:  ldarg.0 
	  IL_0087:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter Program/'<checkCompleted>c__async4'::$awaiter0
	  IL_008c:  ldarg.0 
	  IL_008d:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::AwaitUnsafeOnCompleted<valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter, valuetype Program/'<checkCompleted>c__async4'> ([out] !!0&, [out] !!1&)
	  IL_0092:  leave IL_00f8

	  IL_0097:  ldarg.0 
	  IL_0098:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter Program/'<checkCompleted>c__async4'::$awaiter0
	  IL_009d:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter::GetResult()
	  IL_00a2:  ldarg.0 
	  IL_00a3:  ldfld string Program/'<checkCompleted>c__async4'::name
	  IL_00a8:  ldstr " await "
	  IL_00ad:  ldarg.0 
	  IL_00ae:  ldfld class [mscorlib]System.Threading.Tasks.Task Program/'<checkCompleted>c__async4'::t
	  IL_00b3:  callvirt instance bool class [mscorlib]System.Threading.Tasks.Task::get_IsCompleted()
	  IL_00b8:  box [mscorlib]System.Boolean
	  IL_00bd:  call string string::Concat(object, object, object)
	  IL_00c2:  call void class [mscorlib]System.Console::WriteLine(string)
	  IL_00c7:  nop 
	  IL_00c8:  leave IL_00e6

	} // end .try 0
	catch class [mscorlib]System.Exception { // 0
	  IL_00cd:  stloc.1 
	  IL_00ce:  ldarg.0 
	  IL_00cf:  ldc.i4.m1 
	  IL_00d0:  stfld int32 Program/'<checkCompleted>c__async4'::$PC
	  IL_00d5:  ldarg.0 
	  IL_00d6:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Program/'<checkCompleted>c__async4'::$builder
	  IL_00db:  ldloc.1 
	  IL_00dc:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::SetException(class [mscorlib]System.Exception)
	  IL_00e1:  leave IL_00f8

	} // end handler 0
	IL_00e6:  ldarg.0 
	IL_00e7:  ldc.i4.m1 
	IL_00e8:  stfld int32 Program/'<checkCompleted>c__async4'::$PC
	IL_00ed:  ldarg.0 
	IL_00ee:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Program/'<checkCompleted>c__async4'::$builder
	IL_00f3:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::SetResult()
	IL_00f8:  ret 
    } // end of method <checkCompleted>c__async4::MoveNext

    // method line 17
    .method public final virtual hidebysig newslot 
           instance default void SetStateMachine (class [mscorlib]System.Runtime.CompilerServices.IAsyncStateMachine stateMachine)  cil managed 
    {
        .custom instance void class [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x295c
	// Code size 13 (0xd)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Program/'<checkCompleted>c__async4'::$builder
	IL_0006:  ldarg.1 
	IL_0007:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::SetStateMachine(class [mscorlib]System.Runtime.CompilerServices.IAsyncStateMachine)
	IL_000c:  ret 
    } // end of method <checkCompleted>c__async4::SetStateMachine

  } // end of class <checkCompleted>c__async4

  } // end of class Program

