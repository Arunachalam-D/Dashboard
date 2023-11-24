part of 'signup_bloc.dart';


abstract class SignupState {}

abstract class SignupActionState extends SignupState{}

class SignupInitial extends SignupState {}

class SignupNavigateState extends SignupActionState{}

class SignupErrorState extends SignupState{}
