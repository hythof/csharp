all:
	make HostByteOrder

HostByteOrder:
	mono-csc $@.cs && (mono $@.exe; rm $@.exe)
