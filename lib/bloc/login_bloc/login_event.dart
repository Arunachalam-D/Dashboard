part of 'login_bloc.dart';

abstract class LoginEvent {}


class LoginNavigateEvent extends LoginEvent{
  final String email;
  final String password;

  LoginNavigateEvent({required this.email, required this.password});


}

class LoginNavigatetoSignupEvent extends LoginEvent{
  LoginNavigatetoSignupEvent();
}
