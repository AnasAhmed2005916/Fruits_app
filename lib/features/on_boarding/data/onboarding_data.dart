import 'package:firebase_course/core/utils/app_images.dart';
import 'package:firebase_course/features/on_boarding/models/onboarding_model.dart';
import 'package:flutter/material.dart';

final List<OnBoardingModel> onboardingPages = [
  OnBoardingModel(
    image: Assets.imagesPageViewItem1Image,
    backgroundImage: Assets.imagesPageViewItem1BackgroundImage,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text('مرحبا بك فى '), Text('Fruit'), Text('HUB')],
    ),
    subTitle:
        'اكتشف تجربة تسوق فريدة مع FruitHUB استكشف مجموعتنا الواسعة من الفواكه الطاظجة الممتازة واحصل على أفضل العروض والجودة العالية',
  ),
  OnBoardingModel(
    image: Assets.imagesPageViewItem2Image,
    backgroundImage: Assets.imagesPageViewItem2BackgroundImage,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text('مرحبا بك فى '), Text('Fruit'), Text('HUB')],
    ),
    subTitle:
        'اكتشف تجربة تسوق فريدة مع FruitHUB استكشف مجموعتنا الواسعة من الفواكه الطاظجة الممتازة واحصل على أفضل العروض والجودة العالية',
  ),
];
