// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:study_demo/widget/appbar.dart';

class AnimatedContainerPage1 extends StatefulWidget {
  const AnimatedContainerPage1({super.key});

  @override
  State<AnimatedContainerPage1> createState() => _AnimatedContainerPage1State();
}

class _AnimatedContainerPage1State extends State<AnimatedContainerPage1>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Animation<Offset> animation1 = Tween(
            begin: const Offset(-.5, 1), end: const Offset(-.5, -1.5))
        .chain(CurveTween(curve: const Interval(0.0, .25, curve: Curves.ease)))
        .animate(controller);
    Animation<Offset> animation2 = Tween(
            begin: const Offset(-.5, -1.5), end: const Offset(.5, -1.5))
        .chain(CurveTween(curve: const Interval(.25, .5, curve: Curves.ease)))
        .animate(controller);
    Animation<Offset> animation3 = Tween(
            begin: const Offset(.5, -1.5), end: const Offset(.5, 1))
        .chain(CurveTween(curve: const Interval(.5, .75, curve: Curves.ease)))
        .animate(controller);
    Animation<Offset> animation4 = Tween(
            begin: const Offset(.5, 1), end: const Offset(-.5, 1))
        .chain(CurveTween(curve: const Interval(.75, 1.0, curve: Curves.ease)))
        .animate(controller);

    return Scaffold(
      appBar: StudyAppBar.MyAppBar("多个动画控制器", context),
      body: Center(
        child: AnimatedBuilder(
            animation: controller,
            builder: (BuildContext context, Widget? child) {
              Animation<Offset> temp = animation1;
              if (controller.value <= .25) {
                temp = animation1;
              } else if (controller.value <= .5) {
                temp = animation2;
              } else if (controller.value <= .75) {
                temp = animation3;
              } else if (controller.value <= 1) {
                temp = animation4;
              }
              return SlideTransition(
                position: temp,
                child: SizedBox(width: 200, height: 200, child: child),
              );
            },
            child: Image.asset(
              "assets/images/girl.jpg",
              fit: BoxFit.cover,
            )),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        controller.repeat();
        //controller.reset();
      }),
    );
  }
}
