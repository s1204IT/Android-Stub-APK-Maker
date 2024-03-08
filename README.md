# Android Stub APK Maker

## How to use

From Actions, manually specify the **package ID** and **APK type** and build.  
To build from Actions, you must first clone this repository.

### What "APK type"

Stub (default): versionCode: `1`  
Install block: versionCode: `2147483647`

Specify a maximum value for the version code to ensure that the application is prevented from being overwritten.

### When to use the "Stub" type?

This can be used to reserve a package ID with the same signature in advance when the application is scheduled to be offered in the future.

1. Specify the package ID as the same as the planning application (ex: `com.example.22game`)
2. Enter the name of the appli (option)
3. Check "**Stub**" type (default)
4. Build
5. Place the built APK in the system partition (ex: `/system/app/22Game/22Game.apk`)

**NOTICE**: We recommend cloning this repository locally and using your own signature using Android Studio.

### When to use the "Install block" type?

This can be used for custom ROMs where you absolutely want to prevent GMS from being installed.

1. Set **package ID** to "`com.google.android.gms`"
2. Uncheck "**Stub**" type
3. Build
4. Place the built APK in the system partition (`/system/app/GmsCore/GmsCore.apk`)

This is not limited to GMS only; you can also specify other packages you do not want installed.

### Use custom signing

Please set Repository secrets.

The variables are:

- **STORE_FILE**  
  A string that is a base64 encoded JKS format keystore
- **STORE_PASSWORD**  
  Keystore password
- **KEY_ALIAS**  
  Cert alias
- **KEY_PASSWORD**  
  Cert password
