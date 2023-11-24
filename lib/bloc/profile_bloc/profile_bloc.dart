import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<UpdateUserEvent>(updateUserEvent);
  }

  FutureOr<void> updateUserEvent(
      UpdateUserEvent event, Emitter<ProfileState> emit) async {
    try {
      if (event.email.isNotEmpty &&
          event.name.isNotEmpty &&
          event.mobile.isNotEmpty &&
          event.dob.isNotEmpty &&
          event.address.isNotEmpty &&
          event.state.isNotEmpty &&
          event.pin.isNotEmpty &&
          event.qualification.isNotEmpty &&
          event.role.isNotEmpty) {
        await FirebaseFirestore.instance.collection('Profile').add({
          'name': event.name,
          'email': event.email,
          'mobile': event.mobile,
          'dob': event.dob,
          'address': event.address,
          'state': event.state,
          'pinCode': event.pin,
          'qualification': event.qualification,
          'role': event.role,
        });
        // print("data received");
        emit(UpdateUserState());
      } else {
        emit(UpdateUserErrorState());
      }
    } catch (error) {
      // print(error);
    }
  }
}
