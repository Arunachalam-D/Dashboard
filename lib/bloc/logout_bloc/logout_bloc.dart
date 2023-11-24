import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/constant_strings.dart';


part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(LogoutInitial()) {
    on<LogoutUserEvent>(logoutUserEvent);
  }

  FutureOr<void> logoutUserEvent(LogoutUserEvent event, Emitter<LogoutState> emit) async{
    try{
      await  FirebaseAuth.instance.signOut();
      final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     sharedPreferences.remove("email");
      AuthenticationStatus.isAuthenticated = false;
      emit(LogoutUserState());
      print("User Signed out");
    }
    catch(error){
      return null;
    }

  }
}
