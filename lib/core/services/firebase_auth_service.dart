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
      throw CustomException(message: _getAuthErrorMessage(e.code));
    } catch (e) {
      throw CustomException(
        message: 'لقد حدث خطأ ما، الرجاء المحاولة مرة أخرى',
      );
    }
  }

  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential;
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: _getAuthErrorMessage(e.code));
    } catch (e) {
      throw CustomException(
        message: 'لقد حدث خطأ ما، الرجاء المحاولة مرة أخرى',
      );
    }
  }

  String _getAuthErrorMessage(String code) {
    switch (code) {
      // Sign Up
      case 'weak-password':
        return 'كلمة المرور ضعيفة جدًا';

      case 'email-already-in-use':
        return 'هذا البريد الإلكتروني مسجل بالفعل';

      case 'invalid-email':
        return 'البريد الإلكتروني غير صالح';

      // Login
      case 'user-not-found':
        return 'البريد الإلكتروني غير موجود';

      case 'wrong-password':
        return 'كلمة المرور غير صحيحة';

      case 'invalid-credential':
        return 'البريد الإلكتروني أو كلمة المرور غير صحيحة';

      // General
      case 'user-disabled':
        return 'تم تعطيل هذا الحساب';

      case 'too-many-requests':
        return 'تم إجراء محاولات كثيرة، حاول مرة أخرى لاحقًا';

      case 'network-request-failed':
        return 'تأكد من اتصالك بالإنترنت';

      case 'operation-not-allowed':
        return 'هذه العملية غير مسموح بها حاليًا';

      default:
        return 'لقد حدث خطأ ما، الرجاء المحاولة مرة أخرى';
    }
  }
}
