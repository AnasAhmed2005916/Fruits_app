import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_course/core/helper_functions/on_generate_route.dart';
import 'package:firebase_course/core/services/shared_preferences_singleton.dart';
import 'package:firebase_course/core/utils/app_colors.dart';
import 'package:firebase_course/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPreferencesSingleton.instance.init();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const FruitHub(),
      ),
    ),
  );
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      ),
      supportedLocales: const [Locale('ar')],

      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
/**
 * هبدأ فى فيديو 35 
 * 
 */