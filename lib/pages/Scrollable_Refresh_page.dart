import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_demo/widget/appbar.dart';

class ScrollableRefreshPage extends StatefulWidget {
  const ScrollableRefreshPage({super.key});

  @override
  State<ScrollableRefreshPage> createState() => _ScrollableRefreshPageState();
}

class _ScrollableRefreshPageState extends State<ScrollableRefreshPage> {
  ScrollController scrollController = ScrollController();
  var isa = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StudyAppBar.MyAppBar("列表下拉刷新&上拉加载", context,
          backgroundColor: isa
              ? Theme.of(context).colorScheme.inversePrimary
              : Colors.blue[300]),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 3));
          isa = !isa;
          setState(() {});
        },
        child: CupertinoScrollbar(
          controller: scrollController,
          child: ListView.builder(
              itemCount: 100,
              controller: scrollController,
              itemBuilder: (c, i) {
                return Container(
                  color: isa
                      ? Colors.purple[i % 9 * 100]
                      : Colors.blue[i % 9 * 100],
                  height: 100,
                );
              }),
        ),
      ),
    );
  }
}
