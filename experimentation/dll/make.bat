csc.exe /debug /target:library /out:Dynamic1.dll Dll.cs
csc.exe /debug /target:library /out:Dynamic2.dll Dll.cs
csc.exe /debug Main.cs
.\Main.exe
