all:
	make Property

Property:
	mono-csc -debug $@.cs && (mono --debug $@.exe; rm $@.exe $@.exe.mdb)
