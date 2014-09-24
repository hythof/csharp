all:
	make DictionaryKeyPerformanceCheck

DictionaryKeyPerformanceCheck:
	mono-csc $@.cs && (cat /proc/cpuinfo | grep "model name" | uniq && uname -a && mono --version && mono $@.exe; rm $@.exe)
