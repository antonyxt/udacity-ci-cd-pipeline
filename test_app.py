import pytest
import json
from unittest.mock import patch, MagicMock
from app import app, scale
import pandas as pd
import numpy as np

@pytest.fixture
def client():
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client

def test_home_endpoint(client):
    """Test the home route"""
    response = client.get("/")
    assert response.status_code == 200
    assert b"Sklearn Prediction Home" in response.data

def test_scale_function():
    """Test the scale function"""
    df = pd.DataFrame({
        'feature1': [1, 2, 3],
        'feature2': [4, 5, 6]
    })
    scaled = scale(df)
    assert isinstance(scaled, np.ndarray)
    # Check that the mean of scaled data is approximately 0
    assert np.allclose(scaled.mean(axis=0), 0)

@patch('app.joblib.load')
def test_predict_endpoint(mock_joblib_load, client):
    """Test the /predict route with mocked model"""
    # Mock a model with predict method
    mock_model = MagicMock()
    mock_model.predict.return_value = [42]
    mock_joblib_load.return_value = mock_model

    payload = [
        {"feature1": 1, "feature2": 2},
        {"feature1": 3, "feature2": 4}
    ]

    response = client.post("/predict", 
                           data=json.dumps(payload),
                           content_type='application/json')

    assert response.status_code == 200
    data = response.get_json()
    assert 'prediction' in data
    assert data['prediction'] == [42]

@patch('app.joblib.load', side_effect=FileNotFoundError)
def test_predict_model_not_loaded(mock_joblib_load, client):
    """Test /predict when model file is missing"""
    payload = [{"feature1": 1, "feature2": 2}]
    response = client.post("/predict", 
                           data=json.dumps(payload),
                           content_type='application/json')
    assert response.status_code == 200
    assert b"Model not loaded" in response.data
