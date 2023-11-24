import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:meta/meta.dart';


part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupNavigateEvent>(signupNavigateEvent);
  }

  FutureOr<void> signupNavigateEvent(SignupNavigateEvent event, Emitter<SignupState> emit) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: event.email, password: event.password);
      print("${event.email} created");
      emit(SignupNavigateState());
    }
    catch(error){
      // print("some error occurred: $error");
      emit(SignupErrorState());
    }
  }
}
