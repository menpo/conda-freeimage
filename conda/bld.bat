msbuild "FreeImage.2008.vcproj" /p:Configuration=Release /T:FreeImage:Build /p:Platform=x64

if errorlevel 1 exit 1
