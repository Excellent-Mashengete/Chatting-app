# chattingapp

A chatting App that uses socket.io and build as a native app using flutter and node.js

## Functional Requirements

<ul>
    <li>Login to an existing account</li>
    <li>Forgot Password then reset it </li>
    <li>Receive OTP PIN via Email</li>
    <li>Sends One on One Messages</li>
    <li>Send Messages To Group Chat</li>
    <li>Create Group Group Chats</li>
</ul>

## Prerequisites
- **Flutter & Dart**
    - `Flutter 3.7.9`
    - `Dart 2.19.6`
    - `DevTools 2.20.1`
    
- **Android**
    - `Android Studio 2020.2.1`
    - `Android SDK >=2.19.6 <3.0.0`

 - **Text Editor of your choice** (N.B I am using [vscode](https://code.visualstudio.com/download))
    - [vscode](https://code.visualstudio.com/download)
    - (N.B I am using [Android Studio](https://developer.android.com/studio))
    - [IntelliJ IDEA Community, version 2021.2 or later ](https://www.jetbrains.com/idea/download/#section=windows)

N.B if you have not installed <strong>Flutter </strong> on your machine please visit the [Flutter Official Site.](https://docs.flutter.dev/get-started/install) 

N.B if you have not installed <strong>Android Studio </strong> on your machine please visit the [Android Studio stie.](https://developer.android.com/studio)

## Dependencies needed to run this project

```yaml
    dependencies:
        flutter:
            sdk: flutter
        cupertino_icons: ^1.0.2
        http: ^0.13.5
        google_nav_bar: ^5.0.6
        flutter_native_splash: ^2.2.19
        intl: ^0.18.1
        url_strategy: ^0.2.0

    dev_dependencies:
        flutter_test:
            sdk: flutter
        flutter_lints: ^2.0.0
```

## Project Setup
    1. Clone this project to your desired directory
    2. Install <strong>Flutter</strong>
    3. Install <strong>Android Studio</strong>
    3. open the project and direct to the project directory
    4. Set up device emulator on android studio and install android 11 or later

## Running the project
- **VS Code**
    - `Open the project in vs code`
    - `Open Extentions or press Ctrl+Shift+X`
    - `Search for flutter and install it, by installing flutter you are installig Dart as well`
    - `On task bar on the right hand side click windows `
    - `Click Play to start android emulator device you have created on android studio`
    - `Switch the emulator on`
    - `On navbar of the Code editor click Run and Start Debugging`
    - `The project will build, install graddles and start displaying on the emulator once build is done`

- **Android Studio**
    - `Open the project in Android Studio`
    - `On navbar of the Code editor click No Device selected`
    - `Click Open android emulator and turn it on`
    - `Click Play to run the project`

## Testing the project
    1. As a new user you have to provide a real email address in order to verify your account.
    2. Once you have successfully registered you will receive an email to verify the account.
    3. Click on the link sent to email, then you can be able to register 
    4. Always whenever you login you will receive an email with An OTP Pin which you will need to provide to the application 
    5. Once the OTP Pin has been verified you will receive a JWT token, and due to network issues you can request another OTP pin provided you send your email address used to register the application.

N.B Currently Using Email Address to get OTP PIN, will update for SMS OTP pin.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
