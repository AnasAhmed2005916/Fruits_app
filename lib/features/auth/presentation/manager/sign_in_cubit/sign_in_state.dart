import 'package:firebase_course/features/auth/domain/entities/user_entity.dart';

sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInLoading extends SignInState {}

final class SignInSuccess extends SignInState {
  final UserEntity userEntity;
  SignInSuccess({required this.userEntity});
}

final class SignInFailure extends SignInState {
  final String message;
  SignInFailure({required this.message});
}
