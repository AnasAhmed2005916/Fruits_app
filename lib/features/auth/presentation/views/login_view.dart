import 'package:firebase_course/core/widgets/custom_app_bar.dart';
import 'package:firebase_course/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(), body: LoginViewBody());
  }
}
