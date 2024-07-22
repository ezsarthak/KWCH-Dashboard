# Novel Dashboard

Dashboard For Creating Kustom Widgets Pack

This project is made with Flutter by Sarthak Patil.


## Getting Started

1. Open Pubspec.yaml and run Pub Get
2. open lib/setup folder and edit both files according to you
3. open Project\android\app\src\main\res\values\config.xml and edit
4. Paste Your Widgets in Project\android\app\src\main\assets\widgets
5. Paste Your Widgets in Project\assets\ in zip and edit them
6. app logo in Project\assets\app elements
7. Paste Logos in Project\android\app\src\main\res
8. version name and version code in pubspec.yaml
9. Renaming app And Unique Package Name
   open terminal and run this
9.1 flutter pub global activate rename
9.2 flutter pub global run rename setBundleId --targets android --value "com.example.bundleId"
9.3 flutter pub global run rename setAppName --targets android --value "YourAppName"


10 signing the app

10.1 create project\android\key.properties 
     and paste this
  storePassword= novel123
  keyPassword=novel123
  keyAlias=upload
  storeFile=keystore.jks

10.2 paste keystore in Project\android\app\keystore.jks
10.3 open keystore in keystore explorer and copy SHA1 and SHA256 

11. Create New Project In FireBase


11.1 Register your app
11.2 Go to build then Authentication and enable it for google
11.3 Go to Project Settings And add SHA1 and SHA256 


12.  flutter build apk --split-per-abi
     flutter build appbundle

