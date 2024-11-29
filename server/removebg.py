

from rembg import remove
from PIL import Image
import io




def remove_background(input_path, output_path):
    with open(input_path, 'rb') as input_file:
        input_data = input_file.read()

    # Remove the background using rembg
    output_data = remove(input_data)

    # Convert the byte data back to an image and save it
    output_image = Image.open(io.BytesIO(output_data))
    output_image.save(output_path)
