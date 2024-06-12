import 'package:flutter/material.dart';
import 'package:iyun4/models/course_model.dart';
import 'package:iyun4/views/screens/lesson_screen.dart';

class SearchViewDelegate extends SearchDelegate<String> {
  final List<CourseModel> data;

  SearchViewDelegate(this.data);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, "");
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? data
        : data
            .where((element) =>
                element.title.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(suggestionList[index].title),
                Text(
                  "Year: ${suggestionList[index].title.toString()}",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
            onTap: () {
              query = suggestionList[index].title;
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return LessonScreen(course: suggestionList[index]);
                },
              ));
            },
          );
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }
}
