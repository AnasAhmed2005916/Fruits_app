import 'package:firebase_course/features/auth/domain/entities/user_entity.dart';

sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  final UserEntity userEntity;
  SignUpSuccess({required this.userEntity});
}

final class SignUpFailure extends SignUpState {
  final String message;
  SignUpFailure({required this.message});
}
