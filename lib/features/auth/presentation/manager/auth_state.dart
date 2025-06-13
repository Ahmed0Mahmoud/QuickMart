part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginLoading extends AuthState {}
final class LoginSuccess extends AuthState {}
final class LoginFailure extends AuthState {
  final String errMessage;

  LoginFailure({required this.errMessage});
}

final class SignupLoading extends AuthState {}
final class SignupSuccess extends AuthState {}
final class SignupFailure extends AuthState {
  final String errMessage;

  SignupFailure({required this.errMessage});
}

final class GoogleLoginLoading extends AuthState {}
final class GoogleLoginSuccess extends AuthState {}
final class GoogleLoginFailure extends AuthState {}

final class LogoutLoading extends AuthState {}
final class LogoutSuccess extends AuthState {}
final class LogoutFailure extends AuthState {}

final class AddingUserDataLoading extends AuthState {}
final class AddingUserDataSuccess extends AuthState {}
final class AddingUserDataFailure extends AuthState {}

final class GetUserDataLoading extends AuthState {}
final class GetUserDataSuccess extends AuthState {
  final UserModel model;

  GetUserDataSuccess({required this.model});
}
final class GetUserDataFailure extends AuthState {}