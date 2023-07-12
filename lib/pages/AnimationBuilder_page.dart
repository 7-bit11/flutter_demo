// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:study_demo/widget/appbar.dart';

class AnimationBuilderPage extends StatefulWidget {
  const AnimationBuilderPage({super.key});

  @override
  State<AnimationBuilderPage> createState() => _AnimationBuilderPageState();
}

class _AnimationBuilderPageState extends State<AnimationBuilderPage>
    with TickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Animation animation1 = Tween(begin: .3, end: 1.0).animate(controller);
    Animation animation2 = Tween(begin: 100.0, end: 300.0).animate(controller);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: StudyAppBar.MyAppBar("AnimationBuilder-Demo", context),
        body: Center(
          child: AnimatedBuilder(
            animation: controller,
            builder: (BuildContext context, Widget? child) {
              return Opacity(
                opacity: animation1.value,
                child: Container(
                  width: animation2.value,
                  height: animation2.value,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  child: child,
                ),
              );
            },
            child: Image.asset("assets/images/girl.jpg", fit: BoxFit.cover),
          ),
        ));
  }
}
