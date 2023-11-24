import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'switch_screen_event.dart';
part 'switch_screen_state.dart';

class SwitchScreenBloc extends Bloc<SwitchScreenEvent, SwitchScreenState> {
  SwitchScreenBloc() : super(SwitchScreenInitial(currentPage: 'dashboard')) {
    on<NavigateToDashboardEvent>(navigateToDashboardEvent);
    on<NavigateToProfileEvent>(navigateToProfileEvent);
    on<NavigateToCertificatesEvent>(navigateToCertificatesEvent);
    on<NavigateToCoursesEvent>(navigateToCoursesEvent);
    on<NavigateToSignUpFromHomeEvent>(navigateToSignUnFromHomeEvent);
    on<NavigateToLoginFromHomeEvent>(navigateToLoginFromHomeEvent);
  }

  FutureOr<void> navigateToDashboardEvent(NavigateToDashboardEvent event, Emitter<SwitchScreenState> emit) {
    emit(NavigateToDashboardState(currentPage: 'dashboard'));
  }

  FutureOr<void> navigateToProfileEvent(NavigateToProfileEvent event, Emitter<SwitchScreenState> emit) {
    emit(NavigateToProfileState(currentPage: 'profile'));
  }

  FutureOr<void> navigateToCertificatesEvent(NavigateToCertificatesEvent event, Emitter<SwitchScreenState> emit) {
    emit(NavigateToCertificatesState(currentPage: 'certificates'));
  }

  FutureOr<void> navigateToCoursesEvent(NavigateToCoursesEvent event, Emitter<SwitchScreenState> emit) {
    emit(NavigateToCoursesState(currentPage: 'courses'));
  }

  FutureOr<void> navigateToSignUnFromHomeEvent(NavigateToSignUpFromHomeEvent event, Emitter<SwitchScreenState> emit) {
    emit(NavigateToSignUpFromHomeState(currentPage: 'signUp'));
  }

  FutureOr<void> navigateToLoginFromHomeEvent(NavigateToLoginFromHomeEvent event, Emitter<SwitchScreenState> emit) {
    emit(NavigateToLoginFromHomeState(currentPage: 'login'));
  }
}
