set arg1=%1

if "%arg1%"=="-u" call bash.exe pull_framework_source_code.sh

cd ndk-treasurehunt
call gradlew.bat build

REM Show the generated .apk files
dir build\outputs\apk

cd ..

set /p ip_address=<android_device_ip_address.txt

set /p send="Send the apk file to the device? (y/n) "
REM if "%send%"=="y" goto yes
REM if "%send%"=="n" goto no
if "%send%"=="y" call curl -T ndk-treasurehunt/build/outputs/apk/ndk-treasurehunt-fat-debug.apk ftp://%ip_address%:14577/Download/jni-apk/

REM :yes
REM call curl -T ndk-treasurehunt/build/outputs/apk/ndk-treasurehunt-fat-debug.apk ftp://192.168.1.63:14577/Download/jni-apk/
REM cmd /k

REM :no
REM cmd /k
