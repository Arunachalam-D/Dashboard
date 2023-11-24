part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class SignupNavigateEvent extends SignupEvent{
  final String email;
  final String password;

  SignupNavigateEvent({required this.email, required this.password});
}
