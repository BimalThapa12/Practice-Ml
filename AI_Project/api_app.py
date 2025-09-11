from flask import Flask, request, jsonify
from flask_cors import CORS   # <-- NEW
from tensorflow.keras.models import load_model
import pickle
import numpy as np
from tensorflow.keras.preprocessing.sequence import pad_sequences
import traceback

# Initialize Flask
app = Flask(__name__)
CORS(app)  # <-- Allow requests from frontend

# Load model
try:
    model = load_model("/Users/bimalthapa/Downloads/AI_Sales_Project/Final_model.h5")
    print("✅ Model loaded successfully")
except Exception as e:
    print("❌ Error loading model:")
    traceback.print_exc()

# Load tokenizer
try:
    with open("tokenizer.pkl", "rb") as f:
        tokenizer = pickle.load(f)
    print("✅ Tokenizer loaded successfully")
except Exception as e:
    print("❌ Error loading tokenizer:")
    traceback.print_exc()

MAX_LEN = 80

@app.route("/predict", methods=["POST"])
def predict():
    data = request.json
    text = data.get("text", "")

    if not text:
        return jsonify({"error": "No input text provided"}), 400

    seq = tokenizer.texts_to_sequences([text])
    seq = pad_sequences(seq, maxlen=MAX_LEN-1, padding="pre")

    generated_words = []
    for _ in range(66):
        preds = model.predict(seq, verbose=0)
        next_id = np.argmax(preds)

        next_word = None
        for word, idx in tokenizer.word_index.items():
            if idx == next_id:
                next_word = word
                break

        if not next_word:
            break

        generated_words.append(next_word)

        seq = tokenizer.texts_to_sequences([text + " " + " ".join(generated_words)])
        seq = pad_sequences(seq, maxlen=MAX_LEN-1, padding="pre")

    return jsonify({
        "generated_text": text + " " + " ".join(generated_words)
    })


if __name__ == "__main__":
    print("🚀 Starting Flask server...")
    app.run(debug=True)
