#/bin/bash

# Ignore JVM warnings
export JAVA_TOOL_OPTIONS="--enable-native-access=ALL-UNNAMED"

# Clean
rm -f stub-unaligned.apk stub.apk stub.apk.idsig

# Value of minSdk
MIN_SDK="${1:-21}"

# Make APK
aapt package -M AndroidManifest.xml -I $ANDROID_HOME/platforms/android-37.2/android.jar -F stub-unaligned.apk --min-sdk-version $MIN_SDK --target-sdk-version $MIN_SDK

# Alingn APK
zipalign 4 stub-unaligned.apk stub.apk
rm stub-unaligned.apk

# Sign APK
apksigner sign --cert data/cert.pem --key data/cert.pk8 stub.apk

rm -f stub.apk.idsig

echo "Created: stub.apk"
