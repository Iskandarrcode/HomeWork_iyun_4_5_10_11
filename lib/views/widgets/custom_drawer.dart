import 'package:flutter/material.dart';
import 'package:iyun4/utils/app_constants.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CustomDrawer extends StatelessWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> onBackgroundImageChanged;
  final ValueChanged<Color> onAppBarColorChanged;
  final ValueChanged<double> onTextFontSize;
  final ValueChanged<Color> onTextColor;

  const CustomDrawer({
    super.key,
    required this.onThemeChanged,
    required this.onBackgroundImageChanged,
    required this.onAppBarColorChanged,
    required this.onTextFontSize,
    required this.onTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppConstants.appBarColor,
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Courses Screen"),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacementNamed(context, "/navigationBar");
            },
            title: const Text("Bosh sahifa"),
            trailing: const Icon(
              Icons.keyboard_arrow_right,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, "/mainScreen");

            },
            title: Text(
              "Course",
              style: TextStyle(
                fontSize: AppConstants.fontSize,
                color: AppConstants.textColor,
              ),
            ),
            trailing: const Icon(
              Icons.keyboard_arrow_right,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, "/settingsScreen");

            },
            title: Text(
              "Sozlamalar",
              style: TextStyle(
                fontSize: AppConstants.fontSize,
                color: AppConstants.textColor,
              ),
            ),
            trailing: const Icon(
              Icons.keyboard_arrow_right,
            ),
          ),
          const SizedBox(height: 20),
          ZoomTapAnimation(
            onTap: () {
              Navigator.pushNamed(context, "/logInScreen");
            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Exit",
                style: TextStyle(
                  fontSize: AppConstants.fontSize,
                  color: AppConstants.textColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
