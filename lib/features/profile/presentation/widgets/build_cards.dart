import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

Widget buildStreakCard({required int count}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          spacing: 10,
          children: [
            Image.asset("assets/streak_fire.png", width: 30),
            Text("Current Streak: $count", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    ),
  );
}

Widget buildLeaderBoardCard({required int position}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          spacing: 10,
          children: [
            Icon(Icons.leaderboard, color: AppColors.secondaryColor, size: 30),
            Text("Leaderboard position: Level $position", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    ),
  );
}