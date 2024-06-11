import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iyun4/controllers/savat_controller.dart';
import 'package:iyun4/views/widgets/like_coustum_builder.dart';

class LikeScreen extends StatefulWidget {
  const LikeScreen({super.key});

  @override
  State<LikeScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  final bool _isViewStylePressed = false;

  SavatController savatController = SavatController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Like Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Gap(30),
            Expanded(
              child: FutureBuilder(
                future: savatController.savatList,
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
                          child: LikeCostumBuilder(
                            isViewStylePressed: _isViewStylePressed,
                            course: courseList[index],
                            isDelete: true,
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
