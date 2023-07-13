import 'package:flutter/material.dart';
import 'package:study_demo/widget/appbar.dart';

class ReorderableListViewPage extends StatefulWidget {
  const ReorderableListViewPage({super.key});

  @override
  State<ReorderableListViewPage> createState() =>
      _ReorderableListViewPageState();
}

class _ReorderableListViewPageState extends State<ReorderableListViewPage> {
  late List<Widget> list;
  @override
  void initState() {
    super.initState();
    list = List<Widget>.generate(13, (int index) {
      return Image.asset(
        "assets/images/${index + 1}.png",
        fit: BoxFit.fitHeight,
        key: UniqueKey(),
        width: 200,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StudyAppBar.MyAppBar("拖拽", context),
      body: ReorderableListView(
          scrollDirection: Axis.horizontal,
          children: list,
          onReorder: (oldIndex, newIndex) {
            if (newIndex > oldIndex) newIndex--;
            var index = list.removeAt(oldIndex);
            list.insert(newIndex, index);
          }),
    );
  }
}
