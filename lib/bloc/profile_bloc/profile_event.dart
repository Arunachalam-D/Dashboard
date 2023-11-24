part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class UpdateUserEvent extends ProfileEvent{
  final String name;
  final String email;
  final String mobile;
  final String dob;
  final String address;
  final String state;
  final String pin;
  final String qualification;
  final String role;

  UpdateUserEvent({required this.name, required this.email, required this.mobile, required this.dob, required this.address, required this.state, required this.pin, required this.qualification, required this.role});

}
