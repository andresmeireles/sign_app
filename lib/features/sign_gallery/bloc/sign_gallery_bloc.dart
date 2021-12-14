import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';

part 'sign_gallery_event.dart';

part 'sign_gallery_state.dart';

class SignGalleryBloc extends Bloc<SignGalleryEvent, SignGalleryState> {
  SignGalleryBloc(List<FileSystemEntity> images)
      : super(SignGalleryInitial(images)) {
    on<DeleteSignEvent>(_deleteItem);
  }

  void _deleteItem(
    DeleteSignEvent event,
    Emitter<SignGalleryState> emit,
  ) async {
    final file = File(event.path);
    file.deleteSync();
    state.images.removeWhere((image) => image.path == event.path);
    emit(SignGalleryInitial(state.images));
  }
}
