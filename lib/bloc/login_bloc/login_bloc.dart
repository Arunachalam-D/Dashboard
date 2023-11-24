import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants/constant_strings.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginNavigateEvent>(loginNavigateEvent);
    on<LoginNavigatetoSignupEvent>(loginNavigatetoSignupEvent);
  }

  FutureOr<void> loginNavigateEvent(
      LoginNavigateEvent event, Emitter<LoginState> emit) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.email, password: event.password);
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString("email", event.email);
      AuthenticationStatus.isAuthenticated = true;
      //print("${event.email} signed in");

      emit(LoginNavigateState());
    } catch (error) {
      // print("some error occurred: $error");
      emit(LoginErrorState());
    }
  }

  FutureOr<void> loginNavigatetoSignupEvent(
      LoginNavigatetoSignupEvent event, Emitter<LoginState> emit) {



    emit(LoginNavigatetoSignUpState());
  }
}
