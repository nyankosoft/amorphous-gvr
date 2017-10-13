#ip_address=100.96.111.25
ip_address=192.168.0.16
curl -T ndk-treasurehunt/build/outputs/apk/ndk-treasurehunt-fat-debug.apk ftp://${ip_address}:2211/Download/jni-apk/
#/c/programs_x86/BluetoothCommandLineTools/bin/btobex.exe -nkorat buis/apk/ndk-treasurehunt-fat-debug.apk
