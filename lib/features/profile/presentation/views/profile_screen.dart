import 'package:flutter/material.dart';
import 'package:mcca/core/config/extensions.dart';
import 'package:provider/provider.dart';
import '../../../../core/config/constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../providers/profile_provider.dart';
import '../widgets/build_cards.dart';
import '../widgets/build_listtile.dart';
import '../widgets/profile_header_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile"), centerTitle: false, forceMaterialTransparency: true),
      body: Consumer<ProfileProvider>(
        builder: (context, profileState, child) {
          final habitLevel = profileState.getHabitLevel(30);
          return Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //profile picture and username
                  buildProfileHeader(),
                  //settings list
                  buildStreakCard(count: 30),
                  buildLeaderBoardCard(position: 30),
                  20.height(),

                  //gamified badge section
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("🎖️ Your Habit Level: ${habitLevel.title}", style: TextStyle(fontSize: 16)),
                              Spacer(),
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(AppColors.primaryColor),
                                  foregroundColor: WidgetStateProperty.all(AppColors.white),
                                ),
                                onPressed: () {},
                                child: Text("Upgrade"),
                              ),
                            ],
                          ),
                          10.height(),

                          LinearProgressIndicator(
                            value: habitLevel.value / 100,
                            color: habitLevel.color,
                            backgroundColor: AppColors.grey.withAlpha(50),
                            minHeight: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                  10.height(),

                  //app preferences section
                  buildListTile(
                    icon: Icons.dark_mode,
                    title: "Dark Mode",
                    trailing: Switch(
                      value: profileState.isDarkMode,
                      onChanged: (_) {
                        profileState.toggleTheme();
                      },
                    ),
                  ),

                  buildListTile(
                    icon: Icons.notifications,
                    title: "Notifications",
                    trailing: Switch(
                      value: profileState.isNotificationEnabled,
                      onChanged: (val) {
                        profileState.toggleNotificaton();
                      },
                    ),
                  ),

                  buildListTile(
                    icon: Icons.info_outline,
                    title: "About App",
                    onTap: () {
                      showAboutDialog(
                        context: context,
                        applicationName: "Rise - Habit Tracker",
                        applicationVersion: "1.0.0",
                        applicationIcon: Image.asset("assets/logo.png", width: 40),
                        children: [Text(aboutApp)],
                      );
                    },
                  ),

                  buildListTile(icon: Icons.logout, title: "Log out".cap, titleColor: AppColors.red, onTap: () {}),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}