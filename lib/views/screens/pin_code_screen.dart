import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class PinCodeScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> onBackgroundImageChanged;
  final ValueChanged<Color> onAppBarColorChanged;
  final ValueChanged<double> onTextFontSize;
  final ValueChanged<Color> onTextColor;

  const PinCodeScreen({
    super.key,
    required this.onThemeChanged,
    required this.onBackgroundImageChanged,
    required this.onAppBarColorChanged,
    required this.onTextFontSize,
    required this.onTextColor,
  });

  @override
  State<PinCodeScreen> createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  final textPinCodeController1 = TextEditingController();
  final textPinCodeController2 = TextEditingController();

  String errorMessagePinCode1 = "";
  String errorMessagePinCode2 = "";

  Future<void> savePinCodeI() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("pinCode", textPinCodeController1.text);
  }

  Future<String?> getString() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("pinCode");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(201, 43, 46, 78),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              TextField(
                controller: textPinCodeController1,
                // obscureText: true,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(84),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  fillColor: const Color(0xffF1F1FE),
                  filled: true,
                  errorStyle: const TextStyle(color: Colors.red),
                  label: const Text(
                    "PIN CODE",
                    style: TextStyle(fontSize: 14),
                  ),
                  errorText: errorMessagePinCode1.isEmpty
                      ? null
                      : errorMessagePinCode1,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: textPinCodeController2,
                // obscureText: true,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(84),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  fillColor: const Color(0xffF1F1FE),
                  filled: true,
                  errorStyle: const TextStyle(color: Colors.red),
                  label: const Text(
                    "RE-ENTER PIN CODE",
                    style: TextStyle(fontSize: 14),
                  ),
                  errorText: errorMessagePinCode2.isEmpty
                      ? null
                      : errorMessagePinCode2,
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                 
                  Navigator.pushReplacementNamed(context, "/logInScreen");
                },
                child: const Text(
                  "Log in",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              ZoomTapAnimation(
                onTap: () {
                  if (textPinCodeController1.text.length < 4) {
                    errorMessagePinCode1 = "Pin Code 4 tadan kam bo'lmasin";
                  } else if (textPinCodeController1.text !=
                      textPinCodeController2.text) {
                    errorMessagePinCode2 = "Birxil Pin Code kiriting";
                  } else {
                    errorMessagePinCode2 = "";
                    errorMessagePinCode1 = "";
                  }

                  if (errorMessagePinCode1.isEmpty &&
                      errorMessagePinCode2.isEmpty) {
                    savePinCodeI();
                    
                    Navigator.pushNamed(context, "/logInScreen");
                  }
                  setState(() {});
                },
                child: Container(
                  width: 110,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: const Color.fromARGB(171, 22, 41, 108),
                  ),
                  child: const Center(
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
