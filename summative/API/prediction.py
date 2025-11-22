from fastapi import FastAPI, HTTPException
from pydantic import BaseModel, Field
from fastapi.middleware.cors import CORSMiddleware
import joblib

# Load the trained model and scaler
model = joblib.load('best_model.pkl')
scaler = joblib.load('scaler.pkl')

app = FastAPI()

# Enable CORS so your Flutter app can talk to this
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

# Define the input data with rules (Rubric Requirement)
class InsuranceInput(BaseModel):
    age: int = Field(..., gt=0, lt=100, description="Age must be 1-99")
    bmi: float = Field(..., gt=10, lt=60, description="BMI must be 10-60")
    smoker: int = Field(..., ge=0, le=1, description="0 for No, 1 for Yes")

@app.post("/predict")
def predict_insurance(data: InsuranceInput):
    try:
        # 1. Prepare data 
        features = [[data.age, data.bmi, data.smoker]]
        
        # 2. Scale data (CRITICAL step)
        scaled_features = scaler.transform(features)
        
        # 3. Predict
        prediction = model.predict(scaled_features)
        
        return {"predicted_cost": float(prediction[0])}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))