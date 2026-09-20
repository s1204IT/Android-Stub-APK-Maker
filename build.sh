#/bin/bash

# Clean
rm -f stub-unaligned.apk stub.apk stub.apk.idsig

# Value of minSdk (Default: 24)
MIN_SDK="${1:-24}"

# Value of targetSdk (Default: 37)
TARGET_SDK="${2:-37}"

# Make APK
aapt package -M AndroidManifest.xml -I $ANDROID_SDK_ROOT/platforms/android-37.2/android.jar -F stub-unaligned.apk --min-sdk-version $MIN_SDK --target-sdk-version $TARGET_SDK

# Alingn APK
zipalign 4 stub-unaligned.apk stub.apk
rm -f stub-unaligned.apk

# Disable v2 signing
SIG_V2=""
if [ $TARGET_SDK -le 29 ]; then
  SIG_V2="--v1-signing-enabled true --v2-signing-enabled false --v3-signing-enabled false"
fi

# Sign APK
apksigner sign --cert data/cert.pem --key data/cert.pk8 $SIG_V2 stub.apk
rm -f stub.apk.idsig

echo "Created: stub.apk"
