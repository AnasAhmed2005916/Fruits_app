import 'package:firebase_course/core/constants/constants.dart';
import 'package:firebase_course/core/utils/app_colors.dart';
import 'package:firebase_course/core/utils/app_text_styles.dart';
import 'package:firebase_course/features/auth/presentation/views/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';

class TermsAndCoditions extends StatelessWidget {
  const TermsAndCoditions({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });
  final bool isChecked;
  final VoidCallback onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(isChecked: isChecked, onTap: onChanged),
        const SizedBox(width: 16),
        SizedBox(
          width:
              MediaQuery.sizeOf(context).width - (kHorizontalPadding * 2) - 42,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال انشاء حساب فأنك توافق على ',
                  style: AppTextStyles.font16Bold.copyWith(
                    color: const Color(0xFF949D9E),
                  ),
                ),
                const TextSpan(text: ' '),
                TextSpan(
                  text: 'الشروط والأحكام الخاصة بنا',
                  style: AppTextStyles.font16Bold.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
