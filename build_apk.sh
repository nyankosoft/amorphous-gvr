cd ndk-treasurehunt
./gradlew.bat build | tee build.log
/c/programs/npp/notepad++.exe build.log &
cd ..
