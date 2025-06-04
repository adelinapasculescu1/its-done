import 'package:flutter/material.dart';
import 'package:mcca/core/config/extensions.dart';
import 'package:mcca/core/theme/app_colors.dart';

import '../../../../core/config/constants.dart';
import '../../../main_activity.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset("assets/logo.png", height: 200),
            30.height(),
            Text("$appName".cap, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Spacer(),
            ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(AppColors.primaryColor),
                foregroundColor: WidgetStateProperty.all(AppColors.white),
              ),
              icon: Icon(Icons.g_mobiledata, color: AppColors.red),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => MainScreen()));
              },
              label: Text("Rise with Google"),
            ),
            20.height(),
            ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(AppColors.primaryColor),
                foregroundColor: WidgetStateProperty.all(AppColors.white),
              ),
              icon: Icon(Icons.apple, color: AppColors.black),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => MainScreen()));
              },
              label: Text("Rise with Apple"),
            ),

            Spacer(),
          ],
        ),
      ),
    );
  }
}
