# Android Stub APK Maker

## How to use

From Actions, manually specify the **package ID** and build.  
To build from Actions, you must first clone this repository.

### When to use the "Stub" APK?

This can be used to reserve a package ID with the same signature in advance when the application is scheduled to be offered in the future.

1. Specify the package ID as the same as the planning application (ex: `com.example.22game`)
2. Enter the name(label) of the app (option)
3. Build
4. Place the built APK in the system partition (ex: `/system/app/22Game/22Game.apk`)

**NOTICE**: We recommend cloning this repository locally and using your own signature using Android Studio.

### Use custom signing

Please set Repository secrets.

The variables are:

- **CERT**  
  X.509 PEM certificate chain.  
  Ex file: `testkey.x509.pem`
- **KEY**  
  A string that is a base64 encoded private key.  
  PKCS #8 DER format.  
  Ex file: `testkey.pk8`  
  The password must be empty.
