import 'package:flutter/material.dart';
import 'package:mcca/core/config/extensions.dart';

import '../../../../core/theme/app_colors.dart';
import '../widgets/log_habits_widgets.dart';

class AddHabitScreen extends StatefulWidget {
  const AddHabitScreen({super.key});

  @override
  State<AddHabitScreen> createState() => _AddHabitScreenState();
}

class _AddHabitScreenState extends State<AddHabitScreen> with SingleTickerProviderStateMixin {
  final TextEditingController _habitNameController = TextEditingController();

  String? _selectedCategory;
  String? _selectedFrequency;
  TimeOfDay? _reminderTime;
  final bool _isSaving = false;

  final List<String> categories = ["Health", "Productivity", "Mindfulness", "Learning", "Others"];
  final List<String> frequencies = ["Daily", "Weekly", "Monthly"];

  late AnimationController _animationController;
  late Animation<double> _animation;

  void _saveHabit() {
    // if (_habitNameController.text.isEmpty || _selectedCategory == null || _selectedFrequency == null) {
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please fill all fields")));
    //   return;
    // }

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,

        title: Text("Create a Habit", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.black)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildLabel("🎯 Habit Name"),

                    buildTextField("Enter Habit name", _habitNameController, Icons.edit),
                    15.height(),
                    buildLabel("📂 Category"),
                    buildDropdown(categories, "Select Category", Icons.category, (value) {
                      setState(() {
                        _selectedCategory = value;
                      });
                    }),
                    15.height(),

                    buildLabel("⏳ Frequency"),
                    buildDropdown(frequencies, "Select Frequency", Icons.repeat, (value) {
                      setState(() {
                        _selectedFrequency = value;
                      });
                    }),
                    15.height(),

                    buildLabel("⏰ Reminder"),

                    GestureDetector(
                      onTap: () {
                        ///pick time
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                        decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _reminderTime == null ? "Set Reminder" : _reminderTime!.format(context),
                              style: TextStyle(color: AppColors.black),
                            ),
                            Icon(Icons.alarm, color: AppColors.black),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              50.height(),

              //save button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saveHabit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: AppColors.white,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text("Save Habit", style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
