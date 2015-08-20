all:
	mcs -g /target:library /out:Dynamic1.dll Dll.cs
	mcs -g /target:library /out:Dynamic2.dll Dll.cs
	mcs -g Main.cs
	mono --debug Main.exe

clean:
	rm Dynamic*.dll Dynamic*.dll.mdb Main.exe Main.exe.mdb
