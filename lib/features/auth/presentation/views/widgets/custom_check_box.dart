import 'package:firebase_course/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.isChecked,
    required this.onTap,
  });

  final bool isChecked;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        width: 24,
        height: 24,
        duration: const Duration(milliseconds: 300),
        decoration: ShapeDecoration(
          color: isChecked ? AppColors.primaryColor : Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.50,
              color: isChecked ? Colors.transparent : const Color(0xFFDCDEDE),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: isChecked
              ? const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 19,
                  key: ValueKey('checked'),
                )
              : const SizedBox(key: ValueKey('unchecked')),
        ),
      ),
    );
  }
}
