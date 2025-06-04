import 'package:flutter/material.dart';
import 'package:mcca/features/home_screen/presentation/views/home_screen.dart';
import 'package:mcca/features/leaderboard/presentation/views/leaderboard_screen.dart';

import '../core/theme/app_colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    LeaderboardScreen(),
    Text("community screen"),
    Text("profile screen"),
  ];
  //final List<Widget> _screens = [HomeScreen(), LeaderboardScreen(), CommunityScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(duration: Duration(milliseconds: 300), child: _screens[_selectedIndex]),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.bgColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          child: BottomNavigationBar(
            backgroundColor: AppColors.white,
            currentIndex: _selectedIndex,
            showUnselectedLabels: false,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: AppColors.grey,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.leaderboard_rounded), label: "Leaderboard"),
              BottomNavigationBarItem(icon: Icon(Icons.people_alt_rounded), label: "Community"),
              BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: "Profile"),
            ],
          ),
        ),
      ),
    );
  }
}