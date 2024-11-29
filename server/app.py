
# Importing the Flask module
from flask import Flask,request, jsonify
import os
from PIL import Image
from io import BytesIO
import base64
from removebg import remove_background
from flask_cors import CORS # to allow cross origin requests

# Creating a Flask app
app = Flask(__name__)

CORS(app)

# Folder to save the uploaded images
UPLOAD_FOLDER = 'uploads'
os.makedirs(UPLOAD_FOLDER, exist_ok=True)
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

@app.route('/upload', methods=['POST'])
def upload_image():
    if 'image' not in request.json:
        return jsonify({'error': 'No file part'}), 400

    image_base64 = request.json['image']
    if not image_base64:
        return jsonify({'error': 'Empty image data'}), 400


    # Decode the Base64 string to image bytes
    image_data = base64.b64decode(image_base64)

    # Convert the bytes data to a PIL Image
    image = Image.open(BytesIO(image_data))

    # Generate a file path for saving the image
    file_path = os.path.join(app.config['UPLOAD_FOLDER'], 'uploaded_image.png')

    # Save the image to the file path
    image.save(file_path)

    remove_background(file_path, file_path)

      # Open the image and encode it as base64
    with open(file_path, "rb") as image_file:
        encoded_image = base64.b64encode(image_file.read()).decode('utf-8')

    return jsonify({
        'message': 'File uploaded successfully',
        'image_base64': encoded_image
    }), 200
    
    

    #return jsonify({'message': 'File uploaded successfully', 'file_path': file_path}), 200



# Defining the home page of our site
@app.route('/')
def begin():
    return "Welcome to the first page!"

@app.route('/home')
def home():
    return "Hello, World!"
    

# api methods
@app.route('/api',methods=['GET', 'POST'])
def api():
    if request.method == 'GET':
        return "GET method is called"
    elif request.method == 'POST':
        data= request.get_json()
        name= data['name']
        usermap= data['usermap']
        return f"POST method is called with {name} and ID : {usermap['id']}"

# Running the Flask app
if __name__ == "__main__":
    app.run(debug=True)
