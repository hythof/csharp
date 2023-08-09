all:
	sysctl -a machdep.cpu
	make PerformanceLock
	#make PerformanceAwait
	#make DictionaryKeyPerformanceCheck

PerformanceLock:
	cp ignore/$@.cs Program.cs && dotnet build --configuration Release && dotnet bin/Release/net7.0/performance.dll

PerformanceAwait:
	cp ignore/$@.cs Program.cs && dotnet build --configuration Release && dotnet bin/Release/net7.0/performance.dll

DictionaryKeyPerformanceCheck:
	cp ignore/$@.cs Program.cs && dotnet build --configuration Release && dotnet bin/Release/net7.0/performance.dll
