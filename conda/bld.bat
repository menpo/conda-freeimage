if %ARCH%==32 (
set XARCH=Win32
) else (
set XARCH=x64
)

if %PY_VER% LSS 3 (
    "%VS90COMNTOOLS%..\..\VC\vcpackages\vcbuild.exe" "FreeImage.2008.sln" "Release|%XARCH%"
) else (
    xcopy "%RECIPE_DIR%\vs2010" "%SRC_DIR%" /Y /E
    msbuild FreeImage.2010.sln /p:Configuration=Release /t:FreeImage /p:Platform=%XARCH%
)

cp "Dist\FreeImage.dll" "%LIBRARY_LIB%\FreeImage.dll"
cp "Dist\FreeImage.dll" "%LIBRARY_BIN%\FreeImage.dll"
cp "Dist\FreeImage.lib" "%LIBRARY_LIB%\FreeImage.lib"
cp "Dist\FreeImage.h" "%LIBRARY_INC%\FreeImage.h"
if errorlevel 1 exit 1
