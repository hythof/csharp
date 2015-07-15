all:
	make DictionaryKeyPerformanceCheck
	make Footprint

DictionaryKeyPerformanceCheck:
	mono-csc $@.cs && (cat /proc/cpuinfo | grep "model name" | uniq && uname -a && mono --version && mono $@.exe; rm $@.exe)

Footprint:
	mono-csc $@.cs && (/usr/bin/time -v mono $@.exe &); sleep 1; ps aux | head -n 1; ps aux | grep "mono $@.exe"; sleep 1; rm $@.exe
