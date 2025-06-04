import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mcca/core/config/extensions.dart';

import '../../../../core/config/constants.dart';
import '../../../../core/theme/app_colors.dart';

class PodiumTopThreeUsersWidget extends StatelessWidget {
  final List<Map<String, dynamic>> topUsers;
  const PodiumTopThreeUsersWidget({super.key, required this.topUsers});

  @override
  Widget build(BuildContext context) {
    if ((topUsers.length < 3)) return SizedBox();

    return FadeIn(
      duration: Duration(microseconds: 500),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: [Colors.blue.shade200, Colors.blue.shade600]),
        ),

        child: Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _TopUserPodiumWidget(rank: 2, username: topUsers[1]['username'], score: topUsers[1]['score'], height: 120),

            _TopUserPodiumWidget(
              rank: 1,
              username: topUsers[0]['username'],
              score: topUsers[0]['score'],
              height: 150,
              isChampion: true,
            ),

            _TopUserPodiumWidget(rank: 3, username: topUsers[2]['username'], score: topUsers[2]['score'], height: 100),
          ],
        ),
      ),
    );
  }
}

class _TopUserPodiumWidget extends StatelessWidget {
  final int rank;
  final String username;
  final int score;
  final double height;
  final bool isChampion;

  const _TopUserPodiumWidget({
    required this.rank,
    required this.username,
    required this.score,
    required this.height,
    this.isChampion = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isChampion
            ? BounceInDown(
          duration: Duration(milliseconds: 700),
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Icon(Icons.emoji_events, color: AppColors.amber),
          ),
        )
            : SizedBox(),

        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          padding: EdgeInsets.all(isChampion ? 10 : 6),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: isChampion ? AppColors.amber : AppColors.white, width: 3),
          ),
          child: CircleAvatar(
            radius: isChampion ? 40 : 30,
            backgroundImage: CachedNetworkImageProvider(avatar(username)),
            backgroundColor: AppColors.white,
          ),
        ),
        8.height(),

        Text(username, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.white)),
        Text("Score : $score", style: TextStyle(color: AppColors.white)),

        10.height(),

        Container(
          height: height,
          width: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isChampion ? AppColors.amber : Colors.grey.shade300,
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          ),
          child: Text("#$rank", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.black)),
        ),
      ],
    );
  }
}