import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../core/config/constants.dart';
import '../../../../core/theme/app_colors.dart';

class CommunityPostCard extends StatelessWidget {
  final String username;
  final String postContent;
  final String timeAgo;
  const CommunityPostCard({super.key, required this.username, required this.postContent, required this.timeAgo});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text(username, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(timeAgo, style: TextStyle(color: AppColors.grey)),
              leading: CircleAvatar(backgroundImage: CachedNetworkImageProvider(avatar(username))),
            ),

            Text(postContent),

            Row(
              children: [
                IconButton(icon: Icon(Icons.thumb_up_alt_outlined), onPressed: () {}),
                Text("23", style: TextStyle(color: AppColors.darkGrey, fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}