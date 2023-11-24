part of 'profile_bloc.dart';


abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class UpdateUserState extends ProfileState{}

class UpdateUserErrorState extends ProfileState{}
