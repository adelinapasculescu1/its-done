import 'package:flutter/material.dart';
import 'package:mcca/core/config/extensions.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/generate_new_list_date.dart';

showStreakModalSheet(
    BuildContext context, {
      required String habitName,
      required List<Map<DateTime, bool>> loggedDates,
    }) {
  final getDays = generateNewListWithAllDates(loggedDates);

  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.4,
        maxChildSize: 0.6,
        builder: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/streak_fire.png", width: 100),
                15.height(),
                Text("You just earned 1 streak".cap, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                10.height(),

                Text(
                  "Key going! Completing your habit daily is the key to staying motivated.".cap,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: AppColors.grey),
                ),

                10.height(),

                Wrap(
                  spacing: 5,
                  children:
                  getDays.completeDays.map((e) {
                    return CircleAvatar(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: AppColors.white,
                      child: e.containsValue(true) ? Icon(Icons.check) : SizedBox(),
                    );
                  }).toList(),
                ),

                10.height(),

                Text(
                  "🔥 ${getDays.durationIndays} days of $habitName – Keep Going!",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.orange),
                ),

                30.height(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Close Streak"),
                    ),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.amber,
                        foregroundColor: AppColors.white,
                      ),
                      onPressed: () {
                        //navigator to the add community post screen
                      },
                      child: Text("share streak".cap),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    },
  );
}