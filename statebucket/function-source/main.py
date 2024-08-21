from google.cloud import firestore
from flask import Flask, request, jsonify
import os


app = Flask(__name__)

db = firestore.Client()
collection_name = os.environ.get('COLLECTION')
#collection_name = "terraform_locks"

@app.route('/lock', methods=['POST'])
def acquire_lock():
    lock_id = request.json.get('lock_id')
    doc_ref = db.collection(collection_name).document(lock_id)
    doc = doc_ref.get()
    if doc.exists:
        return jsonify({"status": "Lock already acquired"}), 409
    else:
        doc_ref.set({"lock": "acquired"})
        return jsonify({"status": "Lock acquired"}), 200

@app.route('/unlock', methods=['POST'])
def release_lock():
    lock_id = request.json.get('lock_id')
    doc_ref = db.collection(collection_name).document(lock_id)
    doc = doc_ref.get()
    if doc.exists:
        doc_ref.delete()
        return jsonify({"status": "Lock released"}), 200
    else:
        return jsonify({"status": "No lock found"}), 404

if __name__ == "__main__":
    app.run(debug=True)
