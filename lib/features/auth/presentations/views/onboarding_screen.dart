import 'package:flutter/material.dart';
import 'package:mcca/core/config/extensions.dart';

import '../../../../core/theme/app_colors.dart';
import 'auth_screens.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/onboarding_one.png',
      'title': 'Build Better Habits',
      'desc': 'Track and improve your daily habits effortlessly.',
    },
    {
      'image': 'assets/onboarding_two.png',
      'title': 'Stay Consistent',
      'desc': 'Earn streaks and keep yourself accountable.',
    },
    {
      'image': 'assets/onboarding_three.png',
      'title': 'Join the Community',
      'desc': 'Support friends and stay motivated together.',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  _currentIndex = value;
                });
              },
              itemCount: onboardingData.length,
              itemBuilder: (context, index) {
                final data = onboardingData[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Image.asset(data['image'] ?? "")),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['title'] ?? "", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        10.height(),
                        Text(data['desc'] ?? "", textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
                        10.height(),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: List.generate(onboardingData.length, (index) {
                  return Container(
                    margin: EdgeInsets.all(4),
                    height: 8,
                    width: _currentIndex == index ? 12 : 8,
                    decoration: BoxDecoration(
                      color: _currentIndex == index ? AppColors.primaryColor : AppColors.darkGrey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  );
                }),
              ),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: () {
                    if (_currentIndex == onboardingData.length - 1) {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AuthScreen()));
                    } else {
                      _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                    }
                  },
                  child: CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: AppColors.white,
                    child: Icon(
                      _currentIndex == onboardingData.length - 1 ? Icons.check : Icons.arrow_forward,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),

          30.height(),
        ],
      ),
    );
  }
}

