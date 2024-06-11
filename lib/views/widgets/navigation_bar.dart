import 'package:flutter/material.dart';
import 'package:iyun4/views/screens/home_screen.dart';
import 'package:iyun4/views/screens/like_screen.dart';
import 'package:iyun4/views/screens/profile_screen.dart';
import 'package:iyun4/views/screens/results_screen.dart';
import 'package:iyun4/views/screens/savat_screen.dart';

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
  int selectedIndex = 0;
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
      const ResultScreen(),
      const ProfileScreen(),
      const LikeScreen(),
      const SavatScreen(),
    ];
  }

  void onItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth <= 512
        ? Scaffold(
            body: screens[selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor: const Color.fromARGB(255, 95, 94, 94),
              currentIndex: selectedIndex,
              fixedColor: Colors.black,
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
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: "Like",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag),
                  label: "Card",
                ),
              ],
            ),
          )
        : Scaffold(
            body: Row(
              children: [
                NavigationRail(
                  selectedIndex: selectedIndex,
                  onDestinationSelected: onItemTap,
                  labelType: NavigationRailLabelType.selected,
                  destinations: const [
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
                    NavigationRailDestination(
                      icon: Icon(Icons.favorite),
                      label: Text("Like"),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.shopping_bag),
                      label: Text("Card"),
                    ),
                  ],
                ),
                Expanded(
                  child: screens[selectedIndex],
                ),
              ],
            ),
          );
  }
}
