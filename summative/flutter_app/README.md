Medical Cost AI - Mobile App

Overview

This is the mobile frontend for the Medical Cost Prediction system. It allows users to input their health metrics via a clean, dark-themed UI and communicates with the FastAPI backend to fetch predictions.

Features

Real-time Prediction: Connects to the live Render API.

Input Validation: Ensures age and BMI are within realistic ranges.

Modern UI: Uses google_fonts and a custom color palette for a professional look.

Error Handling: Gracefully handles network errors or invalid inputs.

Prerequisites

Flutter SDK installed.

An emulator (Android/iOS) or a physical device connected via USB.

How to Run the App

Navigate to the App Directory:
Open your terminal and move to this folder:

cd linear_regression_model/summative/FlutterApp


Install Dependencies:
Download the required packages (http, google_fonts):

flutter pub get


Run the App:
Make sure your device/emulator is running, then execute:

flutter run


Dependencies

http: ^1.2.0: For making API POST requests.

google_fonts: ^6.1.0: For typography.
