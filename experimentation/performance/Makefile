all:
	make PerformanceLock
	make PerformanceAwait
	make DictionaryKeyPerformanceCheck
	make Footprint

PerformanceInterlocked:
	mcs $@.cs && mono $@.exe && rm $@.exe

PerformanceLock:
	mcs $@.cs && mono $@.exe && rm $@.exe

PerformanceAwait:
	mcs $@.cs && mono $@.exe && rm $@.exe

DictionaryKeyPerformanceCheck:
	mcs $@.cs && (cat /proc/cpuinfo | grep "model name" | uniq && uname -a && mono --version && mono $@.exe; rm $@.exe)

Footprint:
	mcs $@.cs && (/usr/bin/time -v mono $@.exe &); sleep 1; ps aux | head -n 1; ps aux | grep "mono $@.exe"; sleep 1; rm $@.exe
