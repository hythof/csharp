all:
	make BrokenVariable

BrokenVariable:
	mcs -debug $@.cs && (mono $@.exe; rm $@.exe $@.exe.mdb)

OneThread:
	mcs -debug $@.cs && (mono $@.exe; rm $@.exe $@.exe.mdb)
