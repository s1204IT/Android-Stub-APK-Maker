#/bin/bash

# Clean
rm -f stub-unaligned.apk stub.apk stub.apk.idsig

# Value of minSdk
MIN_SDK="${1:-21}"

# Make APK
aapt package -M AndroidManifest.xml -I $ANDROID_HOME/platforms/android-35/android.jar -F stub-unaligned.apk --min-sdk-version $MIN_SDK --target-sdk-version 35

# Alingn APK
zipalign 4 stub-unaligned.apk stub.apk
rm stub-unaligned.apk

# Sign APK
apksigner sign --cert data/cert.pem --key data/cert.pk8 --v1-signing-enabled true --v2-signing-enabled false --v3-signing-enabled false --v4-signing-enabled false stub.apk

rm stub.apk.idsig

echo "Created: stub.apk"
