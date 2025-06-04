import 'package:avatar_stack/animated_avatar_stack.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mcca/core/config/extensions.dart';
import '../../../../core/config/constants.dart';
import '../../../../core/theme/app_colors.dart';

void showShareInviteModal(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return _ShareInviteModal();
    },
  );
}

class _ShareInviteModal extends StatefulWidget {
  const _ShareInviteModal({super.key});

  @override
  State<_ShareInviteModal> createState() => __ShareInviteModalState();
}

class __ShareInviteModalState extends State<_ShareInviteModal> {
  bool _showFriendSelector = false;

  final List<String> _addedFriends = [];

  void _toggleFriendSelector() {
    setState(() {
      _showFriendSelector = !_showFriendSelector;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.3,
      maxChildSize: 0.6,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: _showFriendSelector ? _friendSelector() : _mainContent(),
        );
      },
    );
  }

  Widget _mainContent() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Share and $appName", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close, size: 24),
              ),
            ],
          ),

          15.height(),
          Text(
            "You are more likely to stick to your habits if someone finds out about your progress.",
            style: TextStyle(fontSize: 18, color: AppColors.darkGrey),
            textAlign: TextAlign.center,
          ),
          15.height(),

          Text(
            "Invite your friends to join the $appName and grow together!",
            style: TextStyle(fontSize: 16, color: AppColors.darkGrey),
            textAlign: TextAlign.center,
          ),

          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Center(
              child: AnimatedAvatarStack(
                height: 100,
                avatars: List.generate(_addedFriends.length, (index) {
                  return CachedNetworkImageProvider(avatar(index));
                }),
              ),
            ),
          ),

          OutlinedButton.icon(
            onPressed: _toggleFriendSelector,
            icon: Icon(Icons.person_add, color: AppColors.primaryColor),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: AppColors.primaryColor),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            label: Text(
              "Select ${_addedFriends.isEmpty ? "" : "More "}Friends",
              style: TextStyle(color: AppColors.primaryColor),
            ),
          ),

          15.height(),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              minimumSize: Size(double.infinity, 48),
            ),
            child: Text("Invite", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _friendSelector() {
    List<String> friends = List.generate(20, (index) => "Friend ${index + 1}");
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Select Friends", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            IconButton(icon: Icon(Icons.close, size: 24), onPressed: _toggleFriendSelector),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: friends.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(friends[index]),
                leading: CircleAvatar(backgroundImage: CachedNetworkImageProvider(avatar(index))),
                onTap: () {
                  _addedFriends.add(friends[index]);
                  _toggleFriendSelector();
                },
              );
            },
          ),
        ),
      ],
    );
  }
}