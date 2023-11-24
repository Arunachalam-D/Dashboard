part of 'switch_screen_bloc.dart';

@immutable
abstract class SwitchScreenState { final String currentPage;

SwitchScreenState({required this.currentPage});}

class SwitchScreenInitial extends SwitchScreenState {
  SwitchScreenInitial({required super.currentPage});
}

class NavigateToDashboardState extends SwitchScreenState{
  NavigateToDashboardState({required super.currentPage});
}

class NavigateToProfileState extends SwitchScreenState{
  NavigateToProfileState({required super.currentPage});
}

class NavigateToCertificatesState extends SwitchScreenState{
  NavigateToCertificatesState({required super.currentPage});
}

class NavigateToCoursesState extends SwitchScreenState{
  NavigateToCoursesState({required super.currentPage});
}

class NavigateToSignUpFromHomeState extends SwitchScreenState{
  NavigateToSignUpFromHomeState({required super.currentPage});
}

class NavigateToLoginFromHomeState extends SwitchScreenState{
  NavigateToLoginFromHomeState({required super.currentPage});
}

