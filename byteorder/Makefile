all:
	make HostByteOrder

HostByteOrder:
	mcs $@.cs && (mono $@.exe; rm $@.exe)
