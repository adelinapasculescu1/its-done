import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../core/config/constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../home_screen/presentation/dialogs/show_habit_details_sheet.dart';
import '../modals/show_invite_bottom_sheet.dart';

class HorizontalAvatarList extends StatelessWidget {
  final List<String> users;
  final bool isInvites;
  const HorizontalAvatarList({super.key, required this.users, required this.isInvites});

  @override
  Widget build(BuildContext context) {
    if (users.isEmpty) return SizedBox();

    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(vertical: 8),
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return GestureDetector(
            onTap: () {
              if (isInvites) {
                //show Invite bottom sheet
                showInviteBottomSheet(context, name: user, habitName: "Habit ${index + 1}");
              } else {
                //show friends details bottom sheet
                showHabitDetailsBottomSheet(
                  context,
                  friendName: user,
                  habitName: "Habit ${index + 1}",
                  streakCount: index * 13,
                  missedDays: 20,
                  unMissedDays: 3,
                  comments: [],
                );
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Column(
                spacing: 5,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: AppColors.secondaryColor.withAlpha(40),
                    backgroundImage: CachedNetworkImageProvider(avatar(user)),
                  ),

                  Text(user, style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}