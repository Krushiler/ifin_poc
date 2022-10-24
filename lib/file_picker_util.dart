import 'dart:convert';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<String?> pickImageBase64() async {
  final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (pickedFile == null) return null;
  final file = File(pickedFile.path);
  return base64Encode(file.readAsBytesSync());
}