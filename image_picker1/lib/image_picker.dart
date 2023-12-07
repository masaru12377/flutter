import 'dart:io';
import 'package:image_picker/image_picker.dart';

final picker = ImagePicker();

Future<File?> getImageFormCamera() async{
  final pickedFile = await picker.pickImage(source: ImageSource.camera);

  if(pickedFile == null) return null;

  File image = File(pickedFile!.path);
  return image;
}

Future<File?> getImageFormGallery() async{
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if(pickedFile == null) return null;

  File image = File(pickedFile!.path);
  return image;
}