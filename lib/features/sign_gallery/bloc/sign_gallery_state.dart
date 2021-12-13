part of 'sign_gallery_bloc.dart';

@immutable
abstract class SignGalleryState {
  final Future<List<FileSystemEntity>> images;

  SignGalleryState(): images = _imageList;

  static Future<List<FileSystemEntity>> get _imageList async {
    final path = (await getApplicationDocumentsDirectory()).path;
    final imageDirectory = '$path/img/';
    final files = Directory(imageDirectory).listSync();

    return files;
  }
}

class SignGalleryInitial extends SignGalleryState {}
