import 'package:firebase_course/features/auth/domain/repos/auth_repo.dart';
import 'package:firebase_course/features/auth/presentation/manager/sign_up_cubit/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  final AuthRepo authRepo;
  Future<void> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    emit(SignUpLoading());
    final result = await authRepo.createUserWithEmailAndPassword(
      email,
      password,
      name,
    );
    result.fold(
      (failure) => emit(SignUpFailure(message: failure.message)),
      (userEntity) => emit(SignUpSuccess(userEntity: userEntity)),
    );
  }
}
