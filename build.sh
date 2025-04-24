#/bin/bash

# Clean
rm -f stub-unaligned.apk stub.apk stub.apk.idsig

# Value of minSdk
MIN_SDK="${1:-24}"

# Make APK
aapt package -M AndroidManifest.xml -I $ANDROID_HOME/platforms/android-35/android.jar -F stub-unaligned.apk --min-sdk-version $MIN_SDK --target-sdk-version 35

# Alingn APK
zipalign 4 stub-unaligned.apk stub.apk
rm stub-unaligned.apk

# Sign APK
if [ $MIN_SDK -ge 24 ]; then
  apksigner sign --cert data/cert.pem --key data/cert.pk8 --v1-signing-enabled false stub.apk
else
  apksigner sign --cert data/cert.pem --key data/cert.pk8 stub.apk
fi
rm stub.apk.idsig

echo "Created: stub.apk"
