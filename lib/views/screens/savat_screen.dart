import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iyun4/controllers/savat_controller.dart';
import 'package:iyun4/views/widgets/savat_costum_builder.dart';

class SavatScreen extends StatefulWidget {
  const SavatScreen({super.key});

  @override
  State<SavatScreen> createState() => _SavatScreenState();
}

class _SavatScreenState extends State<SavatScreen> {
  final SavatController _savatController = SavatController();
  final bool _isViewStylePressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Gap(30),
            Expanded(
              child: FutureBuilder(
                future: _savatController.savatList,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError || !snapshot.hasData) {
                    return Center(child: Text('error: ${snapshot.error}'));
                  } else {
                    final courseList = snapshot.data;

                    return ListView.builder(
                      itemCount: courseList!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          child: SavatCostumBuilder(
                            isViewStylePressed: _isViewStylePressed,
                            course: courseList[index],
                            isDelete: false,
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
