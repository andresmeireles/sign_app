part of 'sign_form_bloc.dart';

abstract class SignFormState extends Equatable {
  final String name;
  final SignatureController sign;

  const SignFormState({required this.name, required this.sign});

  copyWithName(String newName) {
    return UpdateSignFormState(name: newName, sign: sign);
  }
}

class SignFormInitial extends SignFormState {
  SignFormInitial(SignFormState? state)
      : super(
          name: state?.name ?? '',
          sign: state?.sign ??
              SignatureController(
                penStrokeWidth: 5,
                penColor: Colors.black,
                exportBackgroundColor: Colors.white,
              ),
        );

  @override
  List<Object> get props => [name, sign];
}

class UpdateSignFormState extends SignFormState {
  const UpdateSignFormState({
    required String name,
    required SignatureController sign,
  }) : super(
          name: name,
          sign: sign,
        );

  @override
  List<Object> get props => [name, sign];
}
