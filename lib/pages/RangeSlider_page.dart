import 'package:flutter/material.dart';
import 'package:study_demo/widget/appbar.dart';

class RangeSliderPage extends StatefulWidget {
  const RangeSliderPage({super.key});

  @override
  State<RangeSliderPage> createState() => _RangeSliderPageState();
}

class _RangeSliderPageState extends State<RangeSliderPage> {
  double opacity = 1.0;
  double circular = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StudyAppBar.MyAppBar("RangeSlider-Opacity--Demo", context),
      body: Column(
        children: [
          const SizedBox(height: 60),
          Center(
            child: AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(seconds: 1),
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    borderRadius: BorderRadius.circular(circular)),
              ),
            ),
          ),
          const SizedBox(height: 40),
          const Text("透明度"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Slider(
              onChanged: (double value) {
                opacity = value;
                setState(() {});
              },
              value: opacity,
              min: 0,
              max: 1,
            ),
          ),
          const SizedBox(height: 40),
          const Text("圆角值"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Slider(
              onChanged: (double value) {
                circular = value;
                setState(() {});
              },
              value: circular,
              min: 0,
              max: 150,
            ),
          ),
          const Spacer(),
          const SizedBox(height: 40)
        ],
      ),
    );
  }
}
