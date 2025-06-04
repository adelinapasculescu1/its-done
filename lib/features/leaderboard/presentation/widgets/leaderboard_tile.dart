import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/config/constants.dart';
import '../../../../core/theme/app_colors.dart';

class LeaderBoardTile extends StatelessWidget {
  final int rank;
  final String username;
  final int score;

  const LeaderBoardTile({super.key, required this.rank, required this.username, required this.score});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: CachedNetworkImageProvider(avatar(username)),
        backgroundColor: AppColors.grey,
      ),
      title: Text(username, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text("Score: $score"),
      trailing: Text(
        "#$rank",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: AppColors.primaryColor),
      ),
    );
  }
}