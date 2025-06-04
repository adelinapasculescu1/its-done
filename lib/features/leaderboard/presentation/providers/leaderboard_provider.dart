import 'package:flutter/foundation.dart';

class LeaderboardProvider extends ChangeNotifier {
  final List<String> filters = ["Today", "This Week", "All-time"];

  final Map<String, List<Map<String, dynamic>>> dummyData = {
    "Today": [
      {"username": "Alice", "score": 2500},
      {"username": "Bob", "score": 2800},
      {"username": "David", "score": 1700},
      {"username": "Charlie", "score": 2600},
      {"username": "Eve", "score": 1500},
    ],
    "All-time": [
      {"username": "Alice", "score": 2500},
      {"username": "Bob", "score": 2800},
      {"username": "David", "score": 1700},
      {"username": "Charlie", "score": 2600},
      {"username": "Eve", "score": 1500},
    ],
  };
}