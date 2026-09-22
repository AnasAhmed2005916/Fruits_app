import 'package:firebase_course/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundImage,
    required this.title,
    required this.subTitle,
    required this.onSkip,
    required this.isLastPage,
  });

  final String image, backgroundImage;
  final String subTitle;
  final Widget title;
  final VoidCallback onSkip;
  final bool isLastPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: SvgPicture.asset(backgroundImage, fit: BoxFit.fill),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SvgPicture.asset(image),
                ),
                if (!isLastPage)
                  Positioned(
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: GestureDetector(
                        onTap: onSkip,
                        child: Text('تخطى', style: AppTextStyles.font18Bold),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          title,
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.font16Medium,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
