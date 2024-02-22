part of 'signin_cubit.dart';

@immutable
sealed class SigninState {}

final class SigninInitial extends SigninState {}

final class SigninLoading extends SigninState {}

final class SigninFailure extends SigninState {
  final String errorMassage;
  SigninFailure({required this.errorMassage});
}

final class SigninSuccess extends SigninState {}
