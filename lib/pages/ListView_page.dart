import 'package:flutter/material.dart';
import 'package:study_demo/widget/appbar.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  late ScrollController controller;
  @override
  void initState() {
    super.initState();
    controller = ScrollController();
  }

  var globalkey = GlobalKey();
  double x = 100;
  double y = 0;
  var globalkey1 = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StudyAppBar.MyAppBar("ListView跳转动画", context, key: globalkey1),
      body: Stack(
        children: [
          ListView.builder(
              controller: controller,
              itemCount: 13,
              itemBuilder: (c, i) {
                return Image.asset("assets/images/${i + 1}.png");
              }),
          Positioned(
            top: y,
            left: x,
            child: Listener(
              onPointerMove: (event) {
                x = event.position.dx - 20;
                y = event.position.dy - 100;
                setState(() {});
              },
              child: Draggable(
                key: globalkey,
                feedback: FloatingActionButton(
                  heroTag: "feedback",
                  onPressed: () {},
                  child: const Icon(Icons.arrow_drop_up_sharp),
                ),
                childWhenDragging: FloatingActionButton(
                  onPressed: () {},
                  heroTag: "childWhenDragging",
                  backgroundColor: Colors.transparent,
                  child: const Icon(Icons.arrow_drop_up_sharp),
                ),
                child: FloatingActionButton(
                  onPressed: () {
                    controller.animateTo(-20,
                        curve: Curves.ease,
                        duration: const Duration(milliseconds: 500));
                  },
                  heroTag: "child",
                  child: const Icon(Icons.arrow_drop_up_sharp),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.animateTo(controller.offset + 600,
              curve: Curves.ease, duration: const Duration(milliseconds: 500));
          //print(controller.offset);
        },
        child: const Icon(Icons.arrow_drop_down_sharp),
      ),
    );
  }
}
