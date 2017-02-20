#!/bin/bash

pause()
{
echo "Press any key to quit:"
read -n1 -s key
exit 1
}

echo "start to make update.img..."

if [ ! -f "parameter-rk3288" ]; then
	echo "Error:No found parameter!"
	pause
fi
if [ ! -f "package-file" ]; then
	echo "Error:No found package-file!"
	pause
fi

./afptool -pack ./ Image/update.img || pause

# For RK3368 use following:
# ./rkImageMaker -RK330A RK3368MiniLoaderAll_V2.23.bin Image/update.img update.img -os_type:androidos || pause

# For RK3128 use following:
#./rkImageMaker -RK312A RK3128MiniLoaderAll\(L\)_V2.20.bin Image/update.img update.img -os_type:androidos || pause

# For RK3288 use following:
./rkImageMaker -rk320A RK3288UbootLoader_V2.19.01.bin Image/update.img update.img -os_type:androidos || pause

echo "Making update.img OK."

# echo "Press any key to quit:"
# read -n1 -s key

exit 0
