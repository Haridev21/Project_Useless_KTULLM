from flask import Flask, request, jsonify
from flask_cors import CORS  
import subprocess

app = Flask(__name__)
CORS(app)  

@app.route('/predict', methods=['POST'])
def predict():
    data = request.json
    input_text = data.get("text")
    print(f"Received input: {input_text}")

    # Calling ollama
    command = f"echo '{input_text}' | ollama run llama3.2:1b"  
    print(f"Running command: {command}")  
    result = subprocess.run(command, shell=True, capture_output=True, text=True)

    
    if result.returncode != 0:
        return jsonify({"error": "Error running the model", "message": result.stderr}), 500

    # Return the output from Ollama
    return jsonify({"response": result.stdout.strip()})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)  
