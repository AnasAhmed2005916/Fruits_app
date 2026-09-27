import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_course/core/errors/exceptions.dart';

class FirebaseAuthService {
  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: 'The password is too weak');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          message: 'The account already exists for that email',
        );
      } else {
        throw CustomException(message: 'Something went wrong');
      }
    } catch (e) {
      throw CustomException(message: 'Something went wrong , try again');
    }
  }
}
