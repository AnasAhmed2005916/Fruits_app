import 'package:firebase_course/core/utils/app_colors.dart';
import 'package:firebase_course/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.onPressed, required this.text});
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: AppColors.primaryColor),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppTextStyles.font16Bold.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
