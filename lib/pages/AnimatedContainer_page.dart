import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({super.key});

  @override
  State<AnimatedContainerPage> createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  var radius = 0.0;
  var width = 300.0;
  var height = 300.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("AnimatedContainer简单动画-Demo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              width: width,
              height: height,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  borderRadius: BorderRadius.circular(radius)),
            ),
          ),
          TextButton(
              onPressed: () {
                if (radius == 0) {
                  radius = 300;
                  height = 10;
                  width = 10;
                } else {
                  radius = 0;
                  height = 300;
                  width = 300;
                }
                setState(() {});
              },
              child: const Text("点击执行动画"))
        ],
      ),
    );
  }
}
