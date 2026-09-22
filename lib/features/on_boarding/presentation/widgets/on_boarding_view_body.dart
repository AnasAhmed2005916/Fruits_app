import 'package:firebase_course/core/constants/constants.dart';
import 'package:firebase_course/core/services/shared_preferences_singleton.dart';
import 'package:firebase_course/core/widgets/custom_button.dart';
import 'package:firebase_course/features/auth/presentation/views/login_view.dart';
import 'package:firebase_course/features/on_boarding/data/onboarding_data.dart';
import 'package:firebase_course/features/on_boarding/presentation/widgets/custom_dots_indicator.dart';
import 'package:firebase_course/features/on_boarding/presentation/widgets/page_view_item.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingViewBody extends StatefulWidget {
  OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  final PageController pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: pageController,
            itemCount: onboardingPages.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final page = onboardingPages[index];
              return PageViewItem(
                image: page.image,
                backgroundImage: page.backgroundImage,
                title: page.title,
                subTitle: page.subTitle,
                isLastPage: index == onboardingPages.length - 1,
                onSkip: () async {
                  await SharedPreferencesSingleton.instance.setBool(
                    kIsOnBoardingViewSeen,
                    true,
                  );
                  Navigator.pushReplacementNamed(context, LoginView.routeName);
                },
              );
            },
          ),
        ),
        const SizedBox(height: 18),
        CustomDotsIndicator(
          controller: pageController,
          count: onboardingPages.length,
        ),
        const SizedBox(height: 12),
        if (currentPage == onboardingPages.length - 1)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomButton(
              onPressed: () async {
                await SharedPreferencesSingleton.instance.setBool(
                  kIsOnBoardingViewSeen,
                  true,
                );
                Navigator.pushReplacementNamed(context, LoginView.routeName);
              },
              text: 'ابدأ الآن',
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
