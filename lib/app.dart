import 'package:flutter/material.dart';
import 'core/theme/app_colors.dart';
import 'features/auth/presentations/views/splash_screen.dart';

class ItsDoneApp extends StatelessWidget {
  const ItsDoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashScreen(), theme: ThemeData(scaffoldBackgroundColor: AppColors.bgColor));
  }
}
