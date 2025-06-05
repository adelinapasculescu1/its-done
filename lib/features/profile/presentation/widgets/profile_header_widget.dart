import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mcca/core/config/extensions.dart';
import '../../../../core/config/constants.dart';
import '../../../../core/theme/app_colors.dart';

Widget buildProfileHeader() {
  return Container(
    padding: const EdgeInsets.all(20),
    alignment: Alignment.center,
    child: Column(
      children: [
        CircleAvatar(radius: 40, backgroundImage: CachedNetworkImageProvider(avatar("1"))),
        10.height(),
        Text("Destiny Ed", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text("destiny.ed@example.com", style: TextStyle(fontSize: 14, color: AppColors.grey)),
      ],
    ),
  );
}