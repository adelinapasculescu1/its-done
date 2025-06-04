import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

Widget streakBox({required String title, required int value, required Color color}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
    child: Column(
      children: [
        Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.white)),
        Text("$value", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.white)),
      ],
    ),
  );
}