import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mcca/core/config/extensions.dart';
import 'package:mcca/core/theme/app_colors.dart';

import '../../../../core/config/constants.dart';
import '../dialogs/show_habit_details_sheet.dart';
import '../dialogs/show_streak_modal_sheet.dart';
import 'log_habits.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  int currentUserIndex = 3;
  late PageController _pageController;
  late CarouselSliderController _carouselController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIndex = currentUserIndex;
    _pageController = PageController(initialPage: currentUserIndex);
    _carouselController = CarouselSliderController();
  }

  void _syncPageView(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void _syncCarousel(int index) {
    setState(() {
      _currentIndex = index;
    });
    _carouselController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            20.height(),
            //carousel slider
            CarouselSlider.builder(
              carouselController: _carouselController,
              itemCount: 5,
              itemBuilder: (context, index, realIndex){
                return GestureDetector(
                  onTap: (){
                    //sync view
                  },
                  child: Card(
                    color: AppColors.primaryColor,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      width: screenSize(context).width,
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: _currentIndex == index ? 40 :30,
                            backgroundImage: CachedNetworkImageProvider(avatar(index)),
                          ),
                          5.height(),
                          Text(
                            currentUserIndex == _currentIndex ? "You" : "User ${index + 1}",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.white),
                          ),
                          Text(
                            "${index + 3} months of building habits",
                            style: TextStyle(fontSize: 16, color: AppColors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: 160,
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
                pageSnapping: false,
                initialPage: currentUserIndex,
                onPageChanged: (index, reason){
                  //sync pageView
                  _syncPageView(index);
                },
        
              ),
            ),
            20.height(),
            //pageview habit cards
            Expanded(
              child: PageView(
                onPageChanged: (value) {
                  //sync carousel
                  _syncCarousel(value);
                },
                controller: _pageController,
                children: List.generate(5, (index) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, habitIndex) {
                      return GestureDetector(
                        onTap: () {
                          showHabitDetailsBottomSheet(
                            context,
                            friendName: "Destiny Ed",
                            habitName: "Habit ${habitIndex + 1}",
                            streakCount: habitIndex * 13,
                            missedDays: 20,
                            unMissedDays: 3,
                            comments: [],
                            isCurrentUser: currentUserIndex == _currentIndex,
                          );
                        },
                        child: Card(
                          color: habitIndex.isEven ? AppColors.primaryColor.withAlpha(50) : null,
                          shape: StadiumBorder(side: BorderSide(color: AppColors.secondaryColor)),
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(streakIcons(habitIndex * 13), width: 50),
                                    5.width(),
                                    Text(
                                      "${habitIndex * 13}",
                                      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),

                                Text(
                                  "Habit ${habitIndex + 1}",
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),

                                Text("daily", style: TextStyle(fontSize: 16)),
                                8.height(),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.comment, size: 18),
                                    5.width(),
                                    Text("${habitIndex * 3}"),
                                    15.width(),
                                    Checkbox(
                                      shape: CircleBorder(),
                                      semanticLabel: "mark habit",
                                      splashRadius: 20,
                                      value: habitIndex.isEven,
                                      onChanged: (value) {
                                        showStreakModalSheet(
                                          context,
                                          habitName: "Habit ${habitIndex + 1}",
                                          loggedDates: [
                                            {DateTime(2025, 3, 1): true},
                                            {DateTime(2025, 3, 6): true},
                                          ],
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: 6,
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: AnimatedOpacity(
        duration: const Duration(seconds: 1),
        opacity: _currentIndex == currentUserIndex ? 1 : 0,
        child: FloatingActionButton(
          onPressed: () {
            ///
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddHabitScreen()));
          },
          tooltip: "Log Habit",
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.white,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}