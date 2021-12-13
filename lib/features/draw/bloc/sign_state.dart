part of 'sign_bloc.dart';

enum Status { idle, success, fail }

@immutable
abstract class SignState {
  final SignatureController controller;
  final Status status;
  final String message;

  const SignState(this.controller, this.status, this.message);
}

class SignInitial extends SignState {
  SignInitial(
      {SignatureController? controller,
      Status status = Status.idle,
      String message = ''})
      : super(
          controller ??
              SignatureController(
                penStrokeWidth: 5,
                penColor: Colors.red,
                exportBackgroundColor: Colors.blue,
              ),
          status,
          message,
        );
}

class SuccessSignState extends SignState {
  const SuccessSignState(SignatureController controller, String message)
      : super(controller, Status.success, message);
}

class ErrorSignState extends SignState {
  const ErrorSignState(SignatureController controller, String message)
      : super(controller, Status.fail, message);
}
