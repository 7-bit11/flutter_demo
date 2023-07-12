// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:study_demo/widget/appbar.dart';

class TweenAnimationBuidlderPage extends StatefulWidget {
  const TweenAnimationBuidlderPage({super.key});

  @override
  State<TweenAnimationBuidlderPage> createState() =>
      _TweenAnimationBuidlderPageState();
}

class _TweenAnimationBuidlderPageState
    extends State<TweenAnimationBuidlderPage> {
  var beginwidth = 100.0;
  var endwidth = 100.0;
  var offset = 0.0;
  var angle = 0.0;
  var scale = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StudyAppBar.MyAppBar("TweenAnimationBuidlder补间动画-Demo", context),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TweenAnimationBuilder(
              tween: Tween(begin: beginwidth, end: endwidth),
              duration: const Duration(seconds: 1),
              builder: (context, value, child) {
                return Center(
                  child: Container(
                    width: value,
                    height: value,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                );
              },
            ),
          ),
          TextButton(
              onPressed: () {
                if (endwidth == 100) {
                  endwidth = 300;
                } else {
                  endwidth = 100;
                }
                setState(() {});
              },
              child: const Text("补间动画-放大缩小")),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TweenAnimationBuilder(
              tween: Tween(begin: offset, end: offset),
              duration: const Duration(seconds: 1),
              builder: (context, value, child) {
                return Center(
                  child: Transform.translate(
                    offset: Offset(value, value),
                    child: Container(
                      width: 200,
                      height: 200,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                );
              },
            ),
          ),
          TextButton(
              onPressed: () {
                if (offset == 0) {
                  offset = 50;
                } else {
                  offset = 0;
                }
                setState(() {});
              },
              child: const Text("补间动画-Transform.translate平移")),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TweenAnimationBuilder(
              tween: Tween(begin: angle, end: angle),
              duration: const Duration(seconds: 1),
              builder: (context, value, child) {
                return Center(
                  child: Transform.rotate(
                    angle: value,
                    child: Container(
                      width: 200,
                      height: 200,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                );
              },
            ),
          ),
          TextButton(
              onPressed: () {
                if (angle == 0) {
                  angle = 6.28;
                } else {
                  angle = 0;
                }
                setState(() {});
              },
              child: const Text("补间动画-Transform.rotate旋转")),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TweenAnimationBuilder(
              tween: Tween(begin: scale, end: scale),
              duration: const Duration(seconds: 1),
              builder: (context, value, child) {
                return Center(
                  child: Transform.scale(
                    scale: value,
                    child: Container(
                      width: 200,
                      height: 200,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      child: Image.asset("assets/images/girl.jpg",
                          fit: BoxFit.cover),
                    ),
                  ),
                );
              },
            ),
          ),
          TextButton(
              onPressed: () {
                if (scale == 1) {
                  scale = 7;
                } else {
                  scale = 1;
                }
                setState(() {});
              },
              child: const Text("补间动画-Transform.scale缩放"))
        ],
      ),
    );
  }
}
