all:
	make BrokenVariable

BrokenVariable:
	mono-csc -debug $@.cs && (mono $@.exe; rm $@.exe $@.exe.mdb)
