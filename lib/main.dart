import 'package:flutter/material.dart';
import 'package:iyun4/utils/app_constants.dart';
import 'package:iyun4/views/screens/course_screen.dart';
import 'package:iyun4/views/screens/log_in_screen.dart';
import 'package:iyun4/views/screens/pin_code_screen.dart';
import 'package:iyun4/views/screens/settings_screen.dart';
import 'package:iyun4/views/widgets/navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

int countTrue = 0;
int countFalse = 0;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void toggleThemeMode(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("theme", value);
    AppConstants.themeMode = value ? ThemeMode.dark : ThemeMode.light;
    setState(() {});
  }

  void backgroundImage(String imageUrl) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(
      () {
        if (imageUrl.trim().isNotEmpty) {
          AppConstants.images = imageUrl;
          preferences.setString("image", AppConstants.images);
        }
      },
    );
  }

  void appBarColor(Color appBarStayle) {
    AppConstants.appBarColor = appBarStayle;
    setState(() {});
  }

  void fontSize(double textFontSize) {
    AppConstants.fontSize = textFontSize;
    setState(() {});
  }

  void textColor(Color textFontColor) {
    AppConstants.textColor = textFontColor;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    AppConstants().setConstants().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(home: Scaffold(),);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.amber,
        ),
      ),
      darkTheme: ThemeData.dark(),
      themeMode: AppConstants.themeMode,
      home: PinCodeScreen(
        onThemeChanged: toggleThemeMode,
        onBackgroundImageChanged: backgroundImage,
        onAppBarColorChanged: appBarColor,
        onTextFontSize: fontSize,
        onTextColor: textColor,
      ),
      routes: {
        "/logInScreen": (ctx) {
          return LoginScreen(
            onThemeChanged: toggleThemeMode,
            onBackgroundImageChanged: backgroundImage,
            onAppBarColorChanged: appBarColor,
            onTextFontSize: fontSize,
            onTextColor: textColor,
          );
        },
        "/pinCode": (ctx) {
          return PinCodeScreen(
            onThemeChanged: toggleThemeMode,
            onBackgroundImageChanged: backgroundImage,
            onAppBarColorChanged: appBarColor,
            onTextFontSize: fontSize,
            onTextColor: textColor,
          );
        },
        "/navigationBar": (ctx) {
          return NavigationBars(
            onThemeChanged: toggleThemeMode,
            onBackgroundImageChanged: backgroundImage,
            onAppBarColorChanged: appBarColor,
            onTextFontSize: fontSize,
            onTextColor: textColor,
          );
        },
        "/mainScreen": (ctx) {
          return MainScreen(
            onThemeChanged: toggleThemeMode,
            onBackgroundImageChanged: backgroundImage,
            onAppBarColorChanged: appBarColor,
            onTextFontSize: fontSize,
            onTextColor: textColor,
          );
        },
        "/settingsScreen": (ctx) {
          return SettingsScreen(
            onThemeChanged: toggleThemeMode,
            onBackgroundImageChanged: backgroundImage,
            onAppBarColorChanged: appBarColor,
            onTextFontSize: fontSize,
            onTextColor: textColor,
          );
        }
      },
    );
  }
  // Route<dynamic> _generateRoute(RouteSettings settings) {
  //   switch (settings.name) {
  //     case RouteNames.todoScreen:
  //       return CupertinoPageRoute(
  //         builder: (BuildContext context) => const TodoScreen(),
  //       );
  //     case RouteNames.admin:
  //       return CupertinoPageRoute(
  //         builder: (BuildContext context) => AdminPage(
  //           onThemeChanged: toggleThemeMode,
  //           onBackgroundChanged: onBackgroundChanged,
  //           onLanguageChanged: onLanguageChanged,
  //           onColorChanged: onColorChanged,
  //           onTextChanged: onTextChanged,
  //         ),
  //       );
  //     case RouteNames.courseInfo:
  //       return CupertinoPageRoute(
  //         builder: (BuildContext context) =>
  //             CourseInfoScreen(course: settings.arguments as Course),
  //       );
  //     case RouteNames.mainScreen:
  //       return CupertinoPageRoute(
  //         builder: (BuildContext context) => const MainScreen(),
  //       );
  //     case RouteNames.profileScreen:
  //       return CupertinoPageRoute(
  //         builder: (BuildContext context) => const ProfileScreen(),
  //       );
  //     case RouteNames.onboarding:
  //       return CupertinoPageRoute(
  //         builder: (BuildContext context) => Onboarding(
  //           onThemeChanged: toggleThemeMode,
  //           onBackgroundChanged: onBackgroundChanged,
  //           onLanguageChanged: onLanguageChanged,
  //           onColorChanged: onColorChanged,
  //           onTextChanged: onTextChanged,
  //         ),
  //       );
  //     case RouteNames.resultScreen:
  //       return CupertinoPageRoute(
  //         builder: (BuildContext context) => const ResultsScreen(),
  //       );
  //     case RouteNames.settingsScreen:
  //       return CupertinoPageRoute(
  //         builder: (BuildContext context) => SettingsScreen(
  //           onThemeChanged: toggleThemeMode,
  //           onBackgroundChanged: onBackgroundChanged,
  //           onLanguageChanged: onLanguageChanged,
  //           onColorChanged: onColorChanged,
  //           onTextChanged: onTextChanged,
  //         ),
  //       );
  //     case RouteNames.youTubeVideo:
  //       final Map<String, dynamic> data =
  //           settings.arguments as Map<String, dynamic>;
  //       return CupertinoPageRoute(
  //         builder: (BuildContext context) => YouTubeVideoScreen(
  //           course: data['course'] as Course,
  //           index: data['index'] as int,
  //         ),
  //       );
  //     case RouteNames.homeScreen:
  //       return CupertinoPageRoute(
  //         builder: (BuildContext context) => HomeScreen(
  //           onThemeChanged: toggleThemeMode,
  //           onBackgroundChanged: onBackgroundChanged,
  //           onLanguageChanged: onLanguageChanged,
  //           onColorChanged: onColorChanged,
  //           onTextChanged: onTextChanged,
  //         ),
  //       );
  //     case RouteNames.register:
  //       return CupertinoPageRoute(
  //         builder: (BuildContext context) => const RegisterScreen(),
  //       );
  //     case RouteNames.login:
  //       return CupertinoPageRoute(
  //         builder: (BuildContext context) => const LoginScreen(),
  //       );
  //     case RouteNames.resetPassword:
  //       return CupertinoPageRoute(
  //         builder: (BuildContext context) => const ResetPasswordScreen(),
  //       );
  //     default:
  //       return CupertinoPageRoute(
  //         builder: (BuildContext context) => HomeScreen(
  //           onThemeChanged: toggleThemeMode,
  //           onBackgroundChanged: onBackgroundChanged,
  //           onLanguageChanged: onLanguageChanged,
  //           onColorChanged: onColorChanged,
  //           onTextChanged: onTextChanged,
  //         ),
  //       );
  //   }
  // }
}
