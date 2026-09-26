import 'package:firebase_course/core/constants/constants.dart';
import 'package:firebase_course/core/widgets/custom_button.dart';
import 'package:firebase_course/core/widgets/custom_text_form_field.dart';
import 'package:firebase_course/features/auth/presentation/views/widgets/have_account.dart';
import 'package:firebase_course/features/auth/presentation/views/widgets/terms_and_coditions.dart';
import 'package:flutter/material.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            const SizedBox(height: 24),
            CustomTextFormField(
              hintText: 'الاسم كامل',
              textInputType: TextInputType.name,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: 'البريد الالكترونى',
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),

            CustomTextFormField(
              hintText: ' كلمة المرور',
              textInputType: TextInputType.visiblePassword,
              suffixIcon: Icon(Icons.password_rounded),
            ),
            const SizedBox(height: 25),
            TermsAndCoditions(),
            const SizedBox(height: 30),
            CustomButton(onPressed: () {}, text: 'انشاء حساب جديد'),
            const SizedBox(height: 26),
            const HaveAccount(),
          ],
        ),
      ),
    );
  }
}
