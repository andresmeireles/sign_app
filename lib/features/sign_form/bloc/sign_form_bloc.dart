import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

part 'sign_form_event.dart';

part 'sign_form_state.dart';

class SignFormBloc extends Bloc<SignFormEvent, SignFormState> {
  SignFormBloc({SignFormState? state}) : super(SignFormInitial(state)) {
    on<ChangeNameEvent>(_changeName);
  }

  void _changeName(ChangeNameEvent event, Emitter emit) {
    final newState = UpdateSignFormState(name: event.name, sign: state.sign);
    emit(newState);
  }
}
