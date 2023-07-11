import 'package:flutter/material.dart';
import 'package:study_demo/widget/appbar.dart';

class CurvesPage extends StatefulWidget {
  const CurvesPage({super.key});

  @override
  State<CurvesPage> createState() => _CurvesPageState();
}

class _CurvesPageState extends State<CurvesPage> {
  Curve curve = Curves.linear;
  double top = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: StudyAppBar.MyAppBar("Curves线性动画-Demo", context),
        body: Column(
          children: [
            AnimatedPadding(
              padding: EdgeInsets.only(top: top),
              duration: const Duration(seconds: 1),
              curve: curve,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            const Spacer(),
            Wrap(
              children: [
                TextButton(
                    onPressed: () {
                      if (top == 0) {
                        top = 300;
                      } else {
                        top = 0;
                      }
                      curve = Curves.linear;
                      setState(() {});
                    },
                    child: const Text("线性动画-平移")),
                TextButton(
                    onPressed: () {
                      if (top == 0) {
                        top = 300;
                      } else {
                        top = 0;
                      }
                      curve = Curves.ease;
                      setState(() {});
                    },
                    child: const Text("线性动画-先快后慢")),
                TextButton(
                    onPressed: () {
                      if (top == 0) {
                        top = 300;
                      } else {
                        top = 0;
                      }
                      curve = Curves.bounceOut;
                      setState(() {});
                    },
                    child: const Text("线性动画-到达坐标后反弹")),
                TextButton(
                    onPressed: () {
                      if (top == 0) {
                        top = 300;
                      } else {
                        top = 0;
                      }
                      curve = Curves.decelerate;
                      setState(() {});
                    },
                    child: const Text("线性动画-先快后慢有点丝滑")),
                TextButton(
                    onPressed: () {
                      if (top == 0) {
                        top = 300;
                      } else {
                        top = 0;
                      }
                      curve = Curves.fastEaseInToSlowEaseOut;
                      setState(() {});
                    },
                    child: const Text("线性动画-先快后慢")),
                TextButton(
                    onPressed: () {
                      if (top == 0) {
                        top = 300;
                      } else {
                        top = 0;
                      }
                      curve = Curves.fastLinearToSlowEaseIn;
                      setState(() {});
                    },
                    child: const Text("线性动画-级速"))
              ],
            ),
            const SizedBox(height: 40)
          ],
        ));
  }
}
