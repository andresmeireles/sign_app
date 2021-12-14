part of 'sign_gallery_bloc.dart';

@immutable
abstract class SignGalleryState {
  final List<FileSystemEntity> images;

  const SignGalleryState(this.images);

  static Future<List<FileSystemEntity>> get _imageList async {
    final path = (await getApplicationDocumentsDirectory()).path;
    final imageDirectory = '$path/img/';
    final files = Directory(imageDirectory).listSync();

    return files;
  }

  Future<List<FileSystemEntity>> get imageList async => _imageList;
}

class SignGalleryInitial extends SignGalleryState {
  const SignGalleryInitial(List<FileSystemEntity> images) : super(images);
}
