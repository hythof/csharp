all:
	make Calc TypeCast

Calc TypeCast:
	mono-csc -debug $@.cs && (mono --debug $@.exe; rm $@.exe $@.exe.mdb)
