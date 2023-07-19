import 'dart:math';

import 'package:flutter/material.dart';
import 'package:study_demo/widget/appbar.dart';

class FutureBuilderPage extends StatefulWidget {
  const FutureBuilderPage({super.key});

  @override
  State<FutureBuilderPage> createState() => _FutureBuilderPageState();
}

class _FutureBuilderPageState extends State<FutureBuilderPage> {
  Future<dynamic> initData() async {
    await Future.delayed(const Duration(seconds: 3), () {
      //throw "错误";
      return "assets/images/2.png";
    });
  }

  @override
  void initState() {
    super.initState();
    //initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StudyAppBar.MyAppBar("FutureBuilder", context),
      body: Center(
        child: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 3), () {
            //throw "错误";
            return "assets/images/2.png";
          }),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Image.asset(
                snapshot.data ?? "assets/images/1.png",
                fit: BoxFit.cover,
              );
            } else if (snapshot.hasError) {
              return const Icon(Icons.error);
            }
            // if (snapshot.connectionState == ConnectionState.waiting) {
            // }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
