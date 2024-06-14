import 'package:flutter/material.dart';
import 'package:iyun4/utils/app_constants.dart';
import 'package:iyun4/views/screens/course_screen.dart';
import 'package:iyun4/views/screens/log_in_screen.dart';
import 'package:iyun4/views/screens/pin_code_screen.dart';
import 'package:iyun4/views/screens/settings_screen.dart';
import 'package:iyun4/views/widgets/navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


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

  Locale _locale = const Locale("uz");

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(home: Scaffold(),);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      theme: ThemeData(
        buttonTheme: const ButtonThemeData(buttonColor: Colors.blue),
        colorSchemeSeed: Colors.blue,
        elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.blue),
          ),
        ),
        // ignore: prefer_const_constructors
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
      // localeChange: _setLocale,

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
            localeChange: setLocale,
          );
        }
      },
    );
  }
}
