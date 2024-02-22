part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupFailure extends SignupState {
  final String errorMassage;
  SignupFailure({required this.errorMassage});
}

final class SignupSuccess extends SignupState {}
