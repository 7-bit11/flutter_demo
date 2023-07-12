// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:study_demo/widget/appbar.dart';

class AnimationControllerPage extends StatefulWidget {
  const AnimationControllerPage({super.key});

  @override
  State<AnimationControllerPage> createState() =>
      _AnimationControllerPageState();
}

class _AnimationControllerPageState extends State<AnimationControllerPage>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController controller1;
  late AnimationController controller2;
  late AnimationController controller3;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..forward();
    controller1 =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward();
    controller2 =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward();
    controller3 =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
  }

  @override
  void dispose() {
    controller.dispose();
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StudyAppBar.MyAppBar("AnimationController-动画控制器", context),
      body: ListView(
        shrinkWrap: true,
        children: [
          const Text("旋转", style: TextStyle(fontSize: 20)),
          RotationTransition(
              turns: controller, child: Image.asset("assets/images/girl.jpg")),
          TextButton(
              onPressed: () async {
                await controller.repeat();
              },
              child: const Text("无限旋转")),
          TextButton(
              onPressed: () async {
                controller.reset();
              },
              child: const Text("暂停-重置位置")),
          TextButton(
              onPressed: () async {
                controller.stop();
              },
              child: const Text("暂停")),
          const Text("缩放--控制初始大小", style: TextStyle(fontSize: 20)),
          ScaleTransition(
              //控制初始大小
              scale: controller1.drive(Tween(begin: .5, end: 1.0)),
              child: Image.asset("assets/images/girl.jpg")),
          TextButton(
              onPressed: () async {
                await controller1.repeat(reverse: true);
              },
              child: const Text("无限重复")),
          TextButton(
              onPressed: () async {
                controller1.reset();
              },
              child: const Text("暂停-重置位置")),
          TextButton(
              onPressed: () async {
                controller1.stop();
              },
              child: const Text("暂停")),
          const Text("透明度", style: TextStyle(fontSize: 20)),
          FadeTransition(
              opacity: controller2,
              child: Image.asset("assets/images/girl.jpg")),
          TextButton(
              onPressed: () async {
                await controller2.repeat(reverse: true);
              },
              child: const Text("无限重复")),
          TextButton(
              onPressed: () async {
                controller2.reset();
              },
              child: const Text("暂停-重置位置")),
          TextButton(
              onPressed: () async {
                controller2.stop();
              },
              child: const Text("暂停")),
          SlideTransition(
              position:
                  Tween(begin: const Offset(-.1, 0), end: const Offset(.5, 0))
                      .chain(CurveTween(curve: Curves.bounceIn))
                      .animate(controller3),
              child: Image.asset("assets/images/girl.jpg")),
          TextButton(
              onPressed: () async {
                // await controller3.repeat(reverse: true);
                controller3.forward();
              },
              child: const Text("开始")),
          TextButton(
              onPressed: () async {
                controller3.reset();
              },
              child: const Text("暂停-重置位置")),
          TextButton(
              onPressed: () async {
                controller3.stop();
              },
              child: const Text("暂停")),
        ],
      ),
    );
  }
}
