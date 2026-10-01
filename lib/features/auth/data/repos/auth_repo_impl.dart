import 'package:flutter/foundation.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_course/core/errors/exceptions.dart';
import 'package:firebase_course/core/errors/failures.dart';
import 'package:firebase_course/core/services/firebase_auth_service.dart';
import 'package:firebase_course/features/auth/data/models/user_model.dart';
import 'package:firebase_course/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_course/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  AuthRepoImpl({required this.firebaseAuthService});
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      final user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserModel.fromFirebaseUser(user.user!));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      debugPrint(
        'Exception in Auth Repo in createUserWithEmailAndPassword Method : ${e.toString()}',
      );
      return left(ServerFailure('حدث خطأ ما الرجاء المحاولة مرة أخرى '));
    }
  }

  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await firebaseAuthService
          .signInWithEmailAndPassword(email: email, password: password);

      return right(UserModel.fromFirebaseUser(userCredential.user!));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      debugPrint(
        'Exception in Auth Repo in signInWithEmailAndPassword Method : ${e.toString()}',
      );
      return left(ServerFailure('حدث خطأ ما الرجاء المحاولة مرة أخرى '));
    }
  }
}
