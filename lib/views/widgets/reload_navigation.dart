import 'package:flutter/material.dart';
import 'package:iyun4/views/screens/home_screen.dart';
import 'package:iyun4/views/screens/profile_screen.dart';
import 'package:iyun4/views/screens/results_screen.dart';

class ReloadNavigationBar extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> onBackgroundImageChanged;
  final ValueChanged<Color> onAppBarColorChanged;
  final ValueChanged<double> onTextFontSize;
  final ValueChanged<Color> onTextColor;

  const ReloadNavigationBar({
    super.key,
    required this.onThemeChanged,
    required this.onBackgroundImageChanged,
    required this.onAppBarColorChanged,
    required this.onTextFontSize,
    required this.onTextColor,
  });

  @override
  State<ReloadNavigationBar> createState() {
    return _ReloadNavigationState();
  }
}

class _ReloadNavigationState extends State<ReloadNavigationBar> {
  late List<Widget> screens;
  int selectIndex = 0;
  @override
  void initState() {
    super.initState();
    screens = [
      HomeScreen(
        onThemeChanged: widget.onThemeChanged,
        onBackgroundImageChanged: widget.onBackgroundImageChanged,
        onAppBarColorChanged: widget.onAppBarColorChanged,
        onTextFontSize: widget.onTextFontSize,
        onTextColor: widget.onTextColor,
      ),
      ResultScreen(),
      ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: selectIndex,
            onDestinationSelected: (int index) {
              setState(() {
                selectIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text("Home"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.repartition_sharp),
                label: Text("Results"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.person),
                label: Text("Profile"),
              ),
            ],
          ),
          Expanded(
            child: screens.elementAt(selectIndex),
          ),
        ],
      ),
    );
  }
}
