Overview

This directory contains the FastAPI backend that serves the trained machine learning model. It exposes a REST endpoint that accepts patient details and returns a predicted insurance cost.

Tech Stack

FastAPI: For high-performance API creation.

Uvicorn: ASGI server for production.

Scikit-learn: For loading the trained model pipeline.

Pydantic: For data validation and type enforcement.

API Documentation

Live URL: https://insurance-api-david.onrender.com

Swagger UI: https://insurance-api-david.onrender.com/docs

Endpoints

POST /predict

Accepts a JSON object with patient details and returns the estimated cost.

Request Body:

{
  "age": 45,
  "bmi": 28.5,
  "smoker": 0
}


Constraints:

age: Integer (1 - 120)

bmi: Float (10.0 - 60.0)

smoker: Integer (0 for No, 1 for Yes)

Local Setup

Install dependencies:

pip install -r requirements.txt


Run the server:

python -m uvicorn prediction:app --reload
