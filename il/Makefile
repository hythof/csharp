DiscompileIEnumerator DebuggerHidden Task TaskIO:
	mono-csc -debug $@.cs && (mono --debug $@.exe; monodis $@.exe > $@.il; rm $@.exe $@.exe.mdb)
