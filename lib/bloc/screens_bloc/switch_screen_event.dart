part of 'switch_screen_bloc.dart';

@immutable
abstract class SwitchScreenEvent {}

class NavigateToDashboardEvent extends SwitchScreenEvent{}

class NavigateToProfileEvent extends SwitchScreenEvent{}

class NavigateToCertificatesEvent extends SwitchScreenEvent{}

class NavigateToCoursesEvent extends SwitchScreenEvent{}

class NavigateToSignUpFromHomeEvent extends SwitchScreenEvent{}

class NavigateToLoginFromHomeEvent extends SwitchScreenEvent{}