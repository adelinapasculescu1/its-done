import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_colors.dart';
import 'features/auth/presentations/views/splash_screen.dart';
import 'features/leaderboard/presentation/providers/leaderboard_provider.dart';
import 'features/profile/presentation/providers/profile_provider.dart';

class ItsDoneApp extends StatelessWidget {
  const ItsDoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LeaderboardProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
      ],
      child: MaterialApp(
        home: SplashScreen(),
        theme: ThemeData(scaffoldBackgroundColor: AppColors.bgColor, fontFamily: GoogleFonts.aBeeZee().fontFamily),
      ),
    );
  }
}