// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_demo/widget/appbar.dart';

class TweenAnimationBuidlderPage1 extends StatefulWidget {
  const TweenAnimationBuidlderPage1({super.key});

  @override
  State<TweenAnimationBuidlderPage1> createState() =>
      _TweenAnimationBuidlderPage1State();
}

class _TweenAnimationBuidlderPage1State
    extends State<TweenAnimationBuidlderPage1> {
  var seconds = 0.0;
  var seconds1 = 0.0;
  var seconds2 = 0.0;
  var seconds3 = 0.0;
  var seconds4 = 0.0;
  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    while (true) {
      await Future.delayed(const Duration(seconds: 1), () {
        seconds++;
        if (seconds == 10) {
          seconds1++;
          seconds = 0;
        }
        if (seconds1 == 10) {
          seconds2++;
          seconds1 = 0;
        }
        if (seconds2 == 10) {
          seconds3++;
          seconds2 = 0;
        }
        if (seconds3 == 10) {
          seconds4++;
          seconds3 = 0;
        }
        if (mounted) {
          setState(() {});
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: StudyAppBar.MyAppBar("TweenAnimationBuidlder计数器", context),
      body: Center(
        child: Wrap(
          children: [
            getItem(seconds3),
            getItem(seconds2),
            getItem(seconds1),
            getItem(seconds)
          ],
        ),
      ),
    );
  }

  Widget getItem(double seconds) {
    return Container(
      width: 90,
      height: 150,
      color: Theme.of(context).colorScheme.inversePrimary,
      child: TweenAnimationBuilder(
        tween: Tween(end: seconds),
        duration: const Duration(seconds: 1),
        builder: (context, value, child) {
          final whole = value ~/ 1;
          final decimal = value - whole;
          return Stack(alignment: Alignment.center, children: [
            Positioned(
                top: -100 * decimal,
                child: Opacity(
                  opacity: 1.0 - decimal,
                  child: Text(
                    "$whole",
                    style: const TextStyle(fontSize: 100),
                  ),
                )),
            Positioned(
                top: 100 - decimal * 100,
                child: Opacity(
                  opacity: decimal,
                  child: Text(
                    "${whole + 1}",
                    style: const TextStyle(fontSize: 100),
                  ),
                ))
          ]);
        },
      ),
    );
  }
}
