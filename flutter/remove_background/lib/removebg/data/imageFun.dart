import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:image_downloader_web/image_downloader_web.dart';

class imageFun {
  static Uint8List? image;
  static Uint8List? imageWithoutBackground;

  static uploadImage() async {
    try {
      FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: [
          'jpg',
          'png',
          'jpeg',
        ],
      );
      if (filePickerResult != null) {
        Uint8List? fileBytes = await filePickerResult.files.first.bytes;

        if (fileBytes != null) {
          image = fileBytes;
        }
      }
    } catch (e) {
      print(e);
    }
  }

  static sendImageToServer() async {
    try {
      if (image != null) {
        var response = await http.post(
          Uri.parse('http://127.0.0.1:5000/upload'),
          headers: {
            'Content-Type':
                'application/json', // Ensure it's set to application/json
          },
          body: jsonEncode({
            'image': base64Encode(image!),
          }),
        );
        if (response.statusCode == 200) {
          var responsedata = jsonDecode(response.body);
          imageWithoutBackground = base64Decode(responsedata['image_base64']);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  // download the image

  static downloadImage() async {
  await WebImageDownloader.downloadImageFromUInt8List(uInt8List: imageWithoutBackground!, name: 'transparentImage${Random().nextInt(10000)}');

  }

}
