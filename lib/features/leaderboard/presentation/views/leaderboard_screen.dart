import 'package:flutter/material.dart';
import 'package:mcca/core/config/extensions.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme/app_colors.dart';
import '../providers/leaderboard_provider.dart';
import '../widgets/leaderboard_tile.dart';
import '../widgets/podium_widget.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: context.read<LeaderboardProvider>().filters.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LeaderboardProvider>(
      builder: (context, leaderBoardState, child) {
        return DefaultTabController(
          length: leaderBoardState.filters.length,
          child: Scaffold(
            appBar: AppBar(
              forceMaterialTransparency: true,
              title: Text("leaderboard".cap, style: TextStyle(fontWeight: FontWeight.bold)),
              bottom: TabBar(
                controller: _tabController,
                indicatorColor: AppColors.primaryColor,
                labelColor: AppColors.primaryColor,
                tabs: leaderBoardState.filters.map((filter) => Tab(text: filter)).toList(),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TabBarView(
                controller: _tabController,
                children:
                leaderBoardState.filters
                    .map((filter) => LeaderBoardScreenList(users: leaderBoardState.dummyData[filter] ?? []))
                    .toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}

class LeaderBoardScreenList extends StatelessWidget {
  final List<Map<String, dynamic>> users;
  const LeaderBoardScreenList({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    if (users.isEmpty) {
      return Center(child: Text('No leaderboard data available.'));
    }

    final sortedUsers = List<Map<String, dynamic>>.from(users)..sort((a, b) => b['score'].compareTo(a["score"]));

    final topUsers = sortedUsers.take(3).toList();
    final remainingUsers = sortedUsers.skip(3).toList();
    return Column(
      spacing: 20,
      children: [
        //podium
        PodiumTopThreeUsersWidget(topUsers: topUsers),

        Expanded(
          child: ListView.builder(
            itemCount: remainingUsers.length,
            itemBuilder: (context, index) {
              final user = remainingUsers[index];
              return LeaderBoardTile(rank: index + 4, username: user['username'], score: user['score']);
            },
          ),
        ),
      ],
    );
  }
}
