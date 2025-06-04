import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mcca/core/config/extensions.dart';
import 'package:mcca/features/home_screen/presentation/dialogs/show_share_invite_modal.dart';
import '../../../../core/config/constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../community/presentation/widgets/comment_tile.dart';
import '../widgets/streak_box.dart';

void showHabitDetailsBottomSheet(
    BuildContext context, {
      required String friendName,
      required String habitName,
      required int streakCount,
      required int missedDays,
      required int unMissedDays,
      required List<Map<String, dynamic>> comments,
      bool isCurrentUser = false,
    }) {
  TextEditingController commentController = TextEditingController();

  showModalBottomSheet(
    useSafeArea: true,
    isScrollControlled: true,
    showDragHandle: true,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    context: context,
    builder: (ctx) {
      return Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          children: [
            10.height(),
            CircleAvatar(
              radius: 40,
              backgroundColor: AppColors.primaryColor,
              child: CachedNetworkImage(imageUrl: avatar(friendName)),
            ),

            10.height(),

            Text(friendName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("Current Habit: $habitName", style: TextStyle(fontSize: 16, color: AppColors.grey)),

            10.height(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                streakBox(title: "🔥 Streak", value: streakCount, color: Colors.orangeAccent),
                10.width(),
                streakBox(title: "✅ Unmissed", value: unMissedDays, color: AppColors.secondaryColor),
                10.width(),
                streakBox(title: "❌ Missed", value: missedDays, color: AppColors.red),
              ],
            ),
            16.height(),

            Row(
              children: [
                Text("Comments (${comments.length})", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

                Spacer(),

                if (isCurrentUser)
                  InkWell(
                    onTap: () {
                      //show share invite modal
                      Navigator.pop(ctx);
                      showShareInviteModal(context);
                    },
                    child: Row(
                      children: [
                        Text("Invite Friends", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        5.width(),
                        Icon(Icons.share),
                      ],
                    ),
                  ),
              ],
            ),

            10.height(),

            Expanded(
              child:
              comments.isEmpty
                  ? Center(child: Text("No comments yet. Be the first!"))
                  : ListView.builder(
                shrinkWrap: true,
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  final comment = comments[index];
                  return commentTile(username: "Destiny Ed", comment: "Nice Progress, Mate!", likes: 4);
                },
              ),
            ),

            TextFormField(
              controller: commentController,
              decoration: InputDecoration(
                hintText: "Write a comment...",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                suffixIcon: IconButton(
                  onPressed: () {
                    //sent
                  },
                  icon: Icon(Icons.send),
                  color: AppColors.primaryColor,
                ),
              ),
            ),

            30.height(),
          ],
        ),
      );
    },
  );
}