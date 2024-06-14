// import 'package:flutter/material.dart';
// import 'package:flutter_colorpicker/flutter_colorpicker.dart';
// import 'package:iyun4/utils/app_constants.dart';
// import 'package:iyun4/views/widgets/custom_drawer.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:zoom_tap_animation/zoom_tap_animation.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// class SettingsScreen extends StatefulWidget {
//   final ValueChanged<bool> onThemeChanged;
//   final ValueChanged<String> onBackgroundImageChanged;
//   final ValueChanged<Color> onAppBarColorChanged;
//   final ValueChanged<double> onTextFontSize;
//   final ValueChanged<Color> onTextColor;
//   final Function(Locale) localeChange;

//   const SettingsScreen({
//     super.key,
//     required this.onThemeChanged,
//     required this.onBackgroundImageChanged,
//     required this.onAppBarColorChanged,
//     required this.onTextFontSize,
//     required this.onTextColor,
//     required this.localeChange,
//   });

//   @override
//   State<SettingsScreen> createState() => _SettingsScreenState();
// }

// class _SettingsScreenState extends State<SettingsScreen> {
//   Color _currentColor = Colors.blue;

//   final imageController = TextEditingController();
//   final fontSizeController = TextEditingController();
//   String errorMessageFontSize = "";

//   Future<void> saveImage() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString("image", imageController.text);
//   }

//   @override
//   void dispose() {
//     imageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         image: AppConstants.images.isEmpty
//             ? null
//             : DecorationImage(
//                 image: NetworkImage(AppConstants.images),
//                 fit: BoxFit.fill,
//               ),
//       ),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             AppLocalizations.delegate.of(context),
//             style: TextStyle(
//               fontSize: AppConstants.fontSize,
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 widget.localeChange(const Locale('en'));
//               },
//               child: const Text("UZ"),
//             )
//           ],
//         ),
//         drawer: CustomDrawer(
//           onThemeChanged: widget.onThemeChanged,
//           onBackgroundImageChanged: widget.onBackgroundImageChanged,
//           onAppBarColorChanged: widget.onAppBarColorChanged,
//           onTextFontSize: widget.onTextFontSize,
//           onTextColor: widget.onTextColor,
//         ),
//         body: Container(
//           decoration: BoxDecoration(
//             image: AppConstants.images.isEmpty
//                 ? null
//                 : DecorationImage(
//                     image: NetworkImage(AppConstants.images),
//                     fit: BoxFit.fill,
//                   ),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(20),
//             child: ListView(
//               children: [
//                 Column(
//                   children: [
//                     SwitchListTile(
//                       value: AppConstants.themeMode == ThemeMode.dark,
//                       onChanged: widget.onThemeChanged,
//                       title: Text(
//                         "Tungi holat",
//                         style: TextStyle(
//                           fontSize: AppConstants.fontSize,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     TextField(
//                       controller: imageController,
//                       // obscureText: true,
//                       keyboardType: TextInputType.text,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(84),
//                         ),
//                         contentPadding: const EdgeInsets.symmetric(
//                             vertical: 10, horizontal: 20),
//                         fillColor: const Color(0xffF1F1FE),
//                         filled: true,
//                         label: Text(
//                           "Image Link",
//                           style: TextStyle(
//                             fontSize: AppConstants.fontSize,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     ZoomTapAnimation(
//                       onTap: () {
//                         saveImage();
//                         String imageUrl = imageController.text;
//                         imageController.clear();
//                         widget.onBackgroundImageChanged(imageUrl);
//                       },
//                       child: Container(
//                         height: 40,
//                         width: 80,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(22),
//                           color: const Color.fromARGB(77, 11, 26, 70),
//                         ),
//                         child: Center(
//                           child: Text(
//                             "Change",
//                             style: TextStyle(
//                               fontSize: AppConstants.fontSize,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 100),
//                     ZoomTapAnimation(
//                       onTap: () {
//                         showDialog(
//                           context: context,
//                           builder: (context) {
//                             return AlertDialog(
//                               title: Text(
//                                 'Pick a color!',
//                                 style: TextStyle(
//                                   fontSize: AppConstants.fontSize,
//                                 ),
//                               ),
//                               content: SingleChildScrollView(
//                                 child: ColorPicker(
//                                   pickerColor: _currentColor,
//                                   onColorChanged: (color) {
//                                     setState(() {
//                                       _currentColor = color;
//                                     });
//                                   },
//                                   // ignore: deprecated_member_use
//                                   showLabel: true,
//                                   pickerAreaHeightPercent: 0.8,
//                                 ),
//                               ),
//                               actions: <Widget>[
//                                 ElevatedButton(
//                                   child: const Text('Got it'),
//                                   onPressed: () {
//                                     widget.onAppBarColorChanged(_currentColor);
//                                     Navigator.of(context).pop();
//                                   },
//                                 ),
//                               ],
//                             );
//                           },
//                         );
//                       },
//                       child: Text(
//                         "Edit AppBar Color",
//                         style: TextStyle(
//                           fontSize: AppConstants.fontSize,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     ZoomTapAnimation(
//                       onTap: () {
//                         Navigator.pushReplacementNamed(context, "/pinCode");
//                       },
//                       child: Text(
//                         "Add Pin Code",
//                         style: TextStyle(
//                           fontSize: AppConstants.fontSize,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 95, right: 95),
//                       child: TextField(
//                         controller: fontSizeController,
//                         // obscureText: true,
//                         keyboardType: TextInputType.phone,
//                         onSubmitted: (value) {
//                           if (double.tryParse(value) != null) {
//                             widget.onTextFontSize(double.tryParse(value)!);
//                           }
//                         },
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(84),
//                           ),
//                           contentPadding: const EdgeInsets.symmetric(
//                               vertical: 5, horizontal: 20),
//                           fillColor: const Color(0xffF1F1FE),
//                           filled: true,
//                           errorStyle: const TextStyle(color: Colors.red),
//                           label: const Text("Edit FontSize"),
//                           errorText: errorMessageFontSize.isEmpty
//                               ? null
//                               : errorMessageFontSize,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 15),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:iyun4/views/widgets/custom_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> onBackgroundImageChanged;
  final ValueChanged<Color> onAppBarColorChanged;
  final ValueChanged<double> onTextFontSize;
  final ValueChanged<Color> onTextColor;
  final Function(Locale) localeChange;

  const SettingsScreen({
    super.key,
    required this.onThemeChanged,
    required this.onBackgroundImageChanged,
    required this.onAppBarColorChanged,
    required this.onTextFontSize,
    required this.onTextColor,
    required this.localeChange,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Color _currentColor = Colors.blue;
  bool _isDarkTheme = false;
  String _backgroundImage = '';
  double _fontSize = 14.0;
  String errorMessageFontSize = "";

  final imageController = TextEditingController();
  final fontSizeController = TextEditingController();

  @override
  void dispose() {
    imageController.dispose();
    fontSizeController.dispose();
    super.dispose();
  }

  Future<void> saveImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("image", imageController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: _backgroundImage.isEmpty
            ? null
            : DecorationImage(
                image: NetworkImage(_backgroundImage),
                fit: BoxFit.fill,
              ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.settings,
            style: TextStyle(
              fontSize: _fontSize,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                widget.localeChange(const Locale('uz'));
              },
              child: const Text("UZ"),
            ),
            TextButton(
              onPressed: () {
                widget.localeChange(const Locale('en'));
              },
              child: const Text("EN"),
            ),
            TextButton(
              onPressed: () {
                widget.localeChange(const Locale('ru'));
              },
              child: const Text("RU"),
            ),
          ],
        ),
        drawer: CustomDrawer(
          onThemeChanged: widget.onThemeChanged,
          onBackgroundImageChanged: widget.onBackgroundImageChanged,
          onAppBarColorChanged: widget.onAppBarColorChanged,
          onTextFontSize: widget.onTextFontSize,
          onTextColor: widget.onTextColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              SwitchListTile(
                value: _isDarkTheme,
                onChanged: (value) {
                  setState(() {
                    _isDarkTheme = value;
                  });
                  widget.onThemeChanged(value);
                },
                title: Text(
                  AppLocalizations.of(context)!.night,
                  style: TextStyle(
                    fontSize: _fontSize,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: imageController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(84),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  fillColor: const Color(0xffF1F1FE),
                  filled: true,
                  labelText: AppLocalizations.of(context)!.write,
                  labelStyle: TextStyle(
                    fontSize: _fontSize,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ZoomTapAnimation(
                onTap: () {
                  saveImage();
                  setState(() {
                    _backgroundImage = imageController.text;
                  });
                  imageController.clear();
                  widget.onBackgroundImageChanged(_backgroundImage);
                },
                child: Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: const Color.fromARGB(77, 11, 26, 70),
                  ),
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.save,
                      style: TextStyle(
                        fontSize: _fontSize,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 100),
              ZoomTapAnimation(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          AppLocalizations.of(context)!.color,
                          style: TextStyle(
                            fontSize: _fontSize,
                          ),
                        ),
                        content: SingleChildScrollView(
                          child: ColorPicker(
                            pickerColor: _currentColor,
                            onColorChanged: (color) {
                              setState(() {
                                _currentColor = color;
                              });
                            },
                            showLabel: true,
                            pickerAreaHeightPercent: 0.8,
                          ),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            child: Text(AppLocalizations.of(context)!.save),
                            onPressed: () {
                              widget.onAppBarColorChanged(_currentColor);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  AppLocalizations.of(context)!.color,
                  style: TextStyle(
                    fontSize: _fontSize,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ZoomTapAnimation(
                onTap: () {
                  Navigator.pushReplacementNamed(context, "/pinCode");
                },
                child: Text(
                  AppLocalizations.of(context)!.password,
                  style: TextStyle(
                    fontSize: _fontSize,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 95),
                child: TextField(
                  controller: fontSizeController,
                  keyboardType: TextInputType.phone,
                  onSubmitted: (value) {
                    if (double.tryParse(value) != null) {
                      setState(() {
                        _fontSize = double.parse(value);
                      });
                      widget.onTextFontSize(double.parse(value));
                    } else {
                      setState(() {
                        errorMessageFontSize =
                            AppLocalizations.of(context)!.style;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(84),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    fillColor: const Color(0xffF1F1FE),
                    filled: true,
                    errorStyle: const TextStyle(color: Colors.red),
                    labelText: AppLocalizations.of(context)!.style,
                    errorText: errorMessageFontSize.isEmpty
                        ? null
                        : errorMessageFontSize,
                  ),
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
