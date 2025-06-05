const appName = "It's Done!";

String avatar(dynamic value) => 'https://robohash.org/$value';

String streakIcons(int level) {
  switch (level) {
    case 0:
      return "assets/streak_zero.png";
    case (> 0 && <= 50):
      return "assets/streak_black.png";
    case > 51:
      return "assets/streak_black_full.png";
    default:
      return "assets/streak_fire.png";
  }
}

const aboutApp = "Rise is a powerful habit tracker designed to help users build and maintain habits, stay consistent, and reach their goals. With features like streak tracking, social habit sharing, reminders, and leaderboards, Rise makes habit-building engaging and effective.";
