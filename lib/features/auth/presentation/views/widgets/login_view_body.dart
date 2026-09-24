import 'package:firebase_course/core/constants/constants.dart';
import 'package:firebase_course/core/utils/app_colors.dart';
import 'package:firebase_course/core/utils/app_text_styles.dart';
import 'package:firebase_course/core/widgets/custom_button.dart';
import 'package:firebase_course/core/widgets/custom_text_form_field.dart';
import 'package:firebase_course/features/auth/presentation/views/widgets/dont_have_account.dart';
import 'package:firebase_course/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:firebase_course/features/auth/presentation/views/widgets/social_login_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            const CustomTextFormField(
              hintText: 'البريد الالكترونى',
              textInputType: TextInputType.emailAddress,
              suffixIcon: Icon(Icons.email),
            ),
            const SizedBox(height: 16),

            const CustomTextFormField(
              hintText: ' كلمة المرور',
              textInputType: TextInputType.emailAddress,
              suffixIcon: Icon(Icons.remove_red_eye),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'نسيت كلمة المرور ؟',
                style: AppTextStyles.font14Bold.copyWith(
                  color: AppColors.lightPrimaryColor,
                ),
              ),
            ),
            const SizedBox(height: 33),
            CustomButton(onPressed: () {}, text: 'تسجيل دخول'),
            const SizedBox(height: 33),

            const DontHaveAccount(),
            const SizedBox(height: 35),
            OrDivider(),
            const SizedBox(height: 30),
            SocialLoginButton(
              title: 'تسجيل بواسطة فيسبوك',
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.facebook,
                color: Colors.blue,
                size: 25,
              ),
            ),
            const SizedBox(height: 16),
            SocialLoginButton(
              title: 'تسجيل بواسطة جوجل',
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.google,
                color: Colors.red,
                size: 25,
              ),
            ),
            const SizedBox(height: 16),

            SocialLoginButton(
              title: 'تسجيل بواسطة ابل',
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.apple,
                color: Colors.black,
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
