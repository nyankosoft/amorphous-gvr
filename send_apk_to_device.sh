ip_address=$(head -n 1 android_device_ip_address.txt)
port=14577
curl -T ndk-treasurehunt/build/outputs/apk/ndk-treasurehunt-fat-debug.apk ftp://${ip_address}:${port}/Download/jni-apk/
#/c/programs_x86/BluetoothCommandLineTools/bin/btobex.exe -nkorat buis/apk/ndk-treasurehunt-fat-debug.apk
