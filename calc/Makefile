all:
	make Calc

Calc:
	mono-csc -debug $@.cs && (mono --debug $@.exe; rm $@.exe $@.exe.mdb)
