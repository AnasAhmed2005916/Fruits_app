import 'package:firebase_course/core/constants/constants.dart';
import 'package:firebase_course/core/services/shared_preferences_singleton.dart';
import 'package:firebase_course/features/auth/presentation/views/login_view.dart';
import 'package:firebase_course/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:firebase_course/features/splash/presentation/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  static const routeName = 'splash';
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void initState() {
    super.initState();

    executeNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SplashViewBody());
  }

  void executeNavigation() {
    bool? isOnBoardingViewSeen = SharedPreferencesSingleton.instance.getBool(
      kIsOnBoardingViewSeen,
    );
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      if (isOnBoardingViewSeen == true) {
        Navigator.pushReplacementNamed(context, LoginView.routeName);
      } else {
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      }
    });
  }
}
