import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';

part 'sign_gallery_event.dart';
part 'sign_gallery_state.dart';

class SignGalleryBloc extends Bloc<SignGalleryEvent, SignGalleryState> {
  SignGalleryBloc() : super(SignGalleryInitial()) {
    on<SignGalleryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
