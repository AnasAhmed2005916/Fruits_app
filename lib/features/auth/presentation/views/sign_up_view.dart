import 'package:firebase_course/core/widgets/custom_app_bar.dart';
import 'package:firebase_course/features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routeName = 'signUp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'انشاء حساب'),
      body: const SignUpViewBody(),
    );
  }
}
