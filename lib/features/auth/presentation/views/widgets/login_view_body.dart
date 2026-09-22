import 'package:firebase_course/core/constants/constants.dart';
import 'package:firebase_course/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: const SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            CustomTextFormField(
              hintText: 'البريد الالكترونى',
              textInputType: TextInputType.emailAddress,
              suffixIcon: Icon(Icons.email),
            ),
            const SizedBox(height: 16),

            CustomTextFormField(
              hintText: ' كلمة المرور',
              textInputType: TextInputType.emailAddress,
              suffixIcon: Icon(Icons.remove_red_eye),
            ),
          ],
        ),
      ),
    );
  }
}
