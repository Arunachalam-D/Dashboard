part of 'login_bloc.dart';

abstract class LoginState {}

abstract class LoginActionState extends LoginState{}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState{}

class LoginNavigateState extends LoginActionState{}

class LoginNavigatetoSignUpState extends LoginActionState{}

class LoginErrorState extends LoginState{}


