import 'package:firebase_course/features/auth/domain/repos/auth_repo.dart';
import 'package:firebase_course/features/auth/presentation/manager/sign_in_cubit/sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepo authRepo;

  SignInCubit(this.authRepo) : super(SignInInitial());

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    emit(SignInLoading());

    final result = await authRepo.signInWithEmailAndPassword(email, password);

    result.fold(
      (failure) => emit(SignInFailure(message: failure.message)),
      (userEntity) => emit(SignInSuccess(userEntity: userEntity)),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SignInLoading());

    final result = await authRepo.signInWithGoogle();

    result.fold(
      (failure) => emit(SignInFailure(message: failure.message)),
      (userEntity) => emit(SignInSuccess(userEntity: userEntity)),
    );
  }
}
