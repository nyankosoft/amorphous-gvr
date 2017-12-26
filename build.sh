# Update if the frramework source code has been edited
touch amorphous-sha1.txt # For the first time the script is run.
mv amorphous-sha1.txt  previous-sha1.txt
ls -lpR ../amorphous/framework/amorphous | grep -v / | openssl sha1 > amorphous-sha1.txt

# Compare with the hash of ndk-treasurehunt/src/main/jni/amorphous

# Update framework source
echo Updating the framework
./pull_framework_source_code.sh

# Compile and link
echo Building the application
./build_apk.sh

# copy the debug apk file to the device
#send_apk_to_device.sh
