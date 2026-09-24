import 'package:firebase_course/core/utils/app_colors.dart';
import 'package:firebase_course/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'لا تمتلك حساب ؟ ',
            style: AppTextStyles.font16Bold.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          TextSpan(text: ' '),
          TextSpan(
            text: 'قم بإنشاء حساب',
            style: AppTextStyles.font16Bold.copyWith(
              color: const Color(0xFF616A6B),
            ),
          ),
        ],
      ),
    );
  }
}
