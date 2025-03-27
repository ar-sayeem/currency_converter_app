# Currency Converter

A sleek and user-friendly **Currency Converter** app built with **Flutter** that allows users to easily convert currencies in real-time. The app fetches live exchange rates using the **ExchangeRate-API** and supports multiple currencies.

## Key Features:
- **Real-time Currency Conversion**: Get up-to-date exchange rates from various currencies.
- **Interactive UI**: A clean and modern user interface with a splash screen animation and an intuitive design.
- **Multi-currency Support**: Convert between different currencies with ease, using dropdowns for selection.
- **Responsive Design**: Optimized for both Android and iOS platforms.
- **Customizable User Interface**: Users can adjust the amount they wish to convert, and the app automatically updates the conversion.

## Screenshots of the App:

### Splash Screen

<table>
  <tr>
    <td>
      <img src="https://github.com/ar-sayeem/currency_converter_app/blob/main/App_Screenshots/1_flashScreen_403x863.png" width="150" height="auto" />
      <figcaption>Splash Screen</figcaption>
    </td>
    <td>
      <img src="https://github.com/ar-sayeem/currency_converter_app/blob/main/App_Screenshots/2_home.PNG" width="150" height="auto" />
      <figcaption><br>Home</figcaption>
    </td>
    <td>
      <img src="https://github.com/ar-sayeem/currency_converter_app/blob/main/App_Screenshots/3_convertFrom.PNG" width="150" height="auto" />
      <figcaption>Convert From</figcaption>
    </td>
    <td>
      <img src="https://github.com/ar-sayeem/currency_converter_app/blob/main/App_Screenshots/4_convertTo.PNG" width="150" height="auto" />
      <figcaption>Convert To</figcaption>
    </td>
  </tr>
  <tr>
    <td>
      <img src="https://github.com/ar-sayeem/currency_converter_app/blob/main/App_Screenshots/5_convertAmmount.PNG" width="150" height="auto" />
      <figcaption>Entered Amount</figcaption>
    </td>
    <td>
      <img src="https://github.com/ar-sayeem/currency_converter_app/blob/main/App_Screenshots/6_afterConvertAmmount.PNG" width="150" height="auto" />
      <figcaption>Converted Amount</figcaption>
    </td>
    <td>
      <img src="https://github.com/ar-sayeem/currency_converter_app/blob/main/App_Screenshots/7_exchangeButton.png" width="150" height="auto" />
      <figcaption>Exchange Button</figcaption>
    </td>
  </tr>
</table>



## Dependencies:
- **flutter**: The core SDK for building the app.
- **http**: Version `^0.13.6` for fetching exchange rates from the API.
- **animated_splash_screen**: Version `^1.3.0` for the splash screen animation.
- **cupertino_icons**: Version `^1.0.8` for iOS style icons.
- **flutter_launcher_icons**: Version `^0.9.2` for customizing the app icon.

## Installation:
1. Clone the repository:  
   `git clone https://github.com/your-username/currency_converter.git`
2. Install dependencies:  
   `flutter pub get`
3. Run the app:  
   `flutter run`

## Configuration:
- The app uses **flutter_launcher_icons** to set a custom app icon.
- Add your own API keys and adjust settings as necessary in the source code.

## Flutter Configuration (`pubspec.yaml`):
Here are the details of the `pubspec.yaml` file used in the project:

```yaml
name: currency_converter
description: "A new Flutter project."
publish_to: 'none'

version: 1.0.0+1

environment:
  sdk: ^3.7.2

dependencies:
  flutter:
    sdk: flutter
  http: ^0.13.6
  animated_splash_screen: ^1.3.0
  cupertino_icons: ^1.0.8

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0
  flutter_launcher_icons: ^0.9.2

flutter:
  uses-material-design: true
  assets:
    - assets/images/cc_icon.png

flutter_icons:
  android: true
  ios: true
  image_path: "assets/images/cc_icon.png"
