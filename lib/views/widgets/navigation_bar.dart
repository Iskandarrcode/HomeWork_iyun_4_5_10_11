import 'package:flutter/material.dart';
import 'package:iyun4/views/screens/home_screen.dart';
import 'package:iyun4/views/screens/profile_screen.dart';
import 'package:iyun4/views/screens/results_screen.dart';

class NavigationBars extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> onBackgroundImageChanged;
  final ValueChanged<Color> onAppBarColorChanged;
  final ValueChanged<double> onTextFontSize;
  final ValueChanged<Color> onTextColor;
  const NavigationBars({
    super.key,
    required this.onThemeChanged,
    required this.onBackgroundImageChanged,
    required this.onAppBarColorChanged,
    required this.onTextFontSize,
    required this.onTextColor,
  });

  @override
  State<NavigationBars> createState() => _NavigationBarsState();
}

class _NavigationBarsState extends State<NavigationBars> {
  int selectIndex = 0;
  late List<Widget> screens;

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

  void onItemTap(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth <= 512 ? Scaffold(
      body: screens[selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectIndex,
        onTap: onItemTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.repartition_sharp),
            label: "Results",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    ): Scaffold(
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
