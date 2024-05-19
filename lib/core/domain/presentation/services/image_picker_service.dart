import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  static ImagePickerService? _instance;
  final ImagePicker picker;

  ImagePickerService._(this.picker);

  factory ImagePickerService.getInstance() {
    _instance ??= ImagePickerService._(ImagePicker());
    return _instance!;
  }

  Future<File?> pickImageFromGallery({int? imageQuality}) async {
    final xFile = await picker.pickImage(
        source: ImageSource.gallery, imageQuality: imageQuality);
    return xFile == null ? null : File(xFile.path);
  }

  Future<File?> pickImageFromCamera() async {
    final xFile = await picker.pickImage(source: ImageSource.camera);
    return xFile == null ? null : File(xFile.path);
  }
}
