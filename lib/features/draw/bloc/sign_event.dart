part of 'sign_bloc.dart';

@immutable
abstract class SignEvent {}
class Clear extends SignEvent {}
class Save extends SignEvent {}
