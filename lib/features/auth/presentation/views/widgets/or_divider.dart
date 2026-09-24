import 'package:firebase_course/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Color(0xFFDCDEDE))),
        const SizedBox(width: 16),
        Text('أو', style: AppTextStyles.font16Bold),
        const SizedBox(width: 18),
        Expanded(child: Divider(color: Color(0xFFDCDEDE))),
      ],
    );
  }
}
