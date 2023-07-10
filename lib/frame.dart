import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:study_demo/pages/AnimatedContainer_page.dart';
import 'package:study_demo/pages/Autocomplete_page.dart';
import 'package:study_demo/pages/BindingObserver_page.dart';
import 'package:study_demo/pages/Magnifier_page.dart';

class FramePage extends StatelessWidget {
  const FramePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          elevation: 0,
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          children: [
            const SizedBox(height: 10),
            const Text("DEMO",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            const SizedBox(height: 20),
            getItem("输入框-自动提示", const AutoCompletePage()),
            const SizedBox(height: 20),
            getItem("放大镜", const MagnifierPage()),
            const SizedBox(height: 20),
            getItem("APP挂起后台模糊(安卓无效)", const BindingObserverPage()),
            const SizedBox(height: 20),
            getItem(
                "AnimatedContainer-简单动画效果(隐式)", const AnimatedContainerPage()),
          ],
        ));
  }

  Widget getItem(String text, Widget goto) {
    Color color = const Color.fromARGB(255, 246, 247, 251);
    return GestureDetector(
      onTap: () {
        Get.to(goto);
      },
      child: Container(
        alignment: Alignment.center,
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Text(
          text,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
