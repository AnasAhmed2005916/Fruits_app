import 'package:firebase_course/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.icon,
  });

  final String title;
  final VoidCallback onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton.icon(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color(0xFFDCDEDE)),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onPressed,
        icon: icon,
        label: Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyles.font16Bold,
        ),
      ),
    );
  }
}
