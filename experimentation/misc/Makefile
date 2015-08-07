all:
	make SecondsFormat

SecondsFormat:
	mono-csc -debug $@.cs && (mono --debug $@.exe; rm $@.exe $@.exe.mdb)
