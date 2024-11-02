# Flask API for Text Prediction with Ollama Model

This is a simple Flask-based API that allows you to make predictions using the Ollama model through a command-line interface. The API accepts text input via a POST request, processes it with the model, and returns the prediction output. 

## Features
- **CORS enabled**: Allows cross-origin requests for easy front-end integration.
- **Simple Endpoint**: The `/predict` endpoint accepts JSON input and returns the processed model output.
- **Error Handling**: If the model execution fails, an error message is returned.

## Requirements

- **Python 3.x**
- **Flask**: Install via `pip install flask`.
- **Flask-CORS**: Install via `pip install flask-cors`.
- **Ollama model**: Ensure the `ollama` command-line tool and model (`llama3.2:1b`) are correctly installed and accessible in your environment.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo/flask-ollama-prediction.git
   cd flask-ollama-prediction
