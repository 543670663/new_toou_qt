set build_path=vs2015.win64
rmdir /s/q %build_path%
mkdir %build_path%
cd %build_path%
cmake .. -G"Visual Studio 16 2019"


start qt_c.sln
pause