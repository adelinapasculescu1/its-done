import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class ProfileProvider extends ChangeNotifier {
  ({Color color, String title, int value}) getHabitLevel(int level) {
    switch (level) {
      case < 50:
        return (color: AppColors.red, title: "Silver", value: level);
      case > 49 && < 100:
        return (color: AppColors.amber, title: "Bronze", value: level);
      case >= 100:
        return (color: AppColors.secondaryColor, title: "Platinum", value: level);
      default:
        return (color: AppColors.red, title: "No Level", value: level);
    }
  }

  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  bool _isNotificationEnabled = false;
  bool get isNotificationEnabled => _isNotificationEnabled;
  void toggleNotificaton() {
    _isNotificationEnabled = !_isNotificationEnabled;
    notifyListeners();
  }
}