import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signature/signature.dart';

part 'sign_event.dart';
part 'sign_state.dart';

class SignBloc extends Bloc<SignEvent, SignState> {
  SignBloc() : super(SignInitial()) {
    on<Clear>(_clearSign);
    on<Save>(_saveSign);
  }

  _clearSign(Clear event, Emitter<SignState> emit) {
    state.controller.clear();
  }

  _saveSign(Save event, Emitter<SignState> emit) async {
    try {
      final image = await _createImageToSave(state.controller);
      final name = 'sign${DateTime.now()}';
      final imagePath = await _savePath(name);
      File(imagePath).writeAsBytesSync(image);
      emit(SuccessSignState(state.controller, 'assinatura como nome $name salva com sucesso.'));
    } on String catch (e) {
      emit(ErrorSignState(state.controller, e.toString()));
    } catch (e) {
      emit(ErrorSignState(state.controller, e.toString()));
    }
  }

  Future<Int8List> _createImageToSave(SignatureController controller) async {
    final image = await controller.toImage();
    if (image == null)  {
      throw 'nenhuma assinatura feita';
    }
    final toBytes = await image.toByteData(format: ImageByteFormat.png);
    if (toBytes == null) {
      throw 'erro ao processar imagem tente fazer o processo novamente';
    }

    return toBytes.buffer.asInt8List();
  }

  Future<String> _savePath(String imageName) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    await Directory('$path/img').create(recursive: true);
    return '$path/img/$imageName.png';
  }
}
