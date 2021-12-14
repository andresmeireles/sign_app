part of 'sign_gallery_bloc.dart';

@immutable
abstract class SignGalleryEvent {}
class DeleteSignEvent extends SignGalleryEvent {
  final String path;
  DeleteSignEvent(this.path);
}
