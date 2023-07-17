import 'package:flutter/material.dart';
import 'package:study_demo/widget/appbar.dart';

class ListWheelScrollViewPage extends StatefulWidget {
  const ListWheelScrollViewPage({super.key});

  @override
  State<ListWheelScrollViewPage> createState() =>
      _ListWheelScrollViewPageState();
}

class _ListWheelScrollViewPageState extends State<ListWheelScrollViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StudyAppBar.MyAppBar("3D列表滚动", context),
      body: RotatedBox(
        //组件旋转

        quarterTurns: 1,
        child: ListWheelScrollView(
            itemExtent: 400,
            children: List.generate(
                13,
                (index) => RotatedBox(
                      quarterTurns: -1,
                      child: Image.asset(
                        "assets/images/${index + 1}.png",
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ))),
      ),
    );
  }
}
