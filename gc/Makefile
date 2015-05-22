all:
	make MemoryBehavior

MemoryBehavior:
	mono-csc $@.cs && (mono $@.exe; rm $@.exe $@.exe.mdb)
