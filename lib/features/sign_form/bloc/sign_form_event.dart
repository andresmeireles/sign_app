part of 'sign_form_bloc.dart';

abstract class SignFormEvent extends Equatable {}

class ChangeNameEvent extends SignFormEvent {
  final String name;

  ChangeNameEvent(this.name);

  @override
  List<Object> get props => [name];
}
