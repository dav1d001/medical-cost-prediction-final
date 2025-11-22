
Linear Regression & Model Training

Overview

This directory contains the data analysis and machine learning pipeline used to predict medical insurance costs. The goal is to assist in financial planning by estimating charges based on personal health metrics.

Dataset

Source: Medical Cost Personal Datasets (Kaggle)

Features Used: - age (Numeric)

bmi (Numeric)

smoker (Categorical, converted to binary)

Target Variable: charges (Medical insurance cost)

Key Steps Performed

Exploratory Data Analysis (EDA): - Visualized correlations using a heatmap to identify key drivers of cost (Smoker status showed highest correlation).

Analyzed the distribution of the target variable.

Feature Engineering:

Label Encoding for categorical variables (smoker, sex).

Standardization using StandardScaler to normalize feature range.

Model Training:

Linear Regression: Optimized using Stochastic Gradient Descent (SGDRegressor) as per assignment requirements.

Random Forest Regressor: Trained for comparison and achieved lower error due to non-linear data patterns.

Decision Tree Regressor: Trained as a baseline.

Evaluation:

Plotted Loss Curves for the SGD model.

Generated Scatter Plots (Actual vs. Predicted) to visualize fit.

Files

multivariate.ipynb: The main Jupyter notebook containing all code, visualizations, and model training logic.
