Medical Cost Prediction AI

Mission & Problem Statement

Mission: To empower patients and families with accurate medical cost estimates for better financial planning.
Problem: Unexpected medical expenses often lead to financial instability. By leveraging machine learning on historical data, we predict insurance charges based on critical health metrics like Age, BMI, and Smoking habits, providing transparency and reducing financial shock.

Data Source

Dataset: Medical Cost Personal Datasets (Kaggle)
Description: A rich dataset containing 1,338 entries with features including age, sex, bmi, children, smoker, region, and charges.

Live API Endpoint

The machine learning model is deployed and publicly accessible via the following API:

Base URL: https://insurance-api-david.onrender.com

Swagger UI (Test Predictions Here): https://insurance-api-david.onrender.com/docs

Video Demo

Watch the 5-minute demonstration covering the Mobile App, API testing, and Model Performance:

[PASTE YOUR YOUTUBE LINK HERE]

How to Run the Mobile App

Follow these steps to run the Flutter application on your local device or emulator:

Navigate to the App Directory:
Open your terminal/command prompt and move into the Flutter folder:

cd linear_regression_model/summative/FlutterApp


Install Dependencies:
Download the required packages (http, google_fonts):
flutter pub get


Run the Application:
Ensure your Android Emulator or physical device is connected, then run:

flutter run
