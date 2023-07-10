import 'dart:ui';

import 'package:flutter/material.dart';

class BindingObserverPage extends StatefulWidget {
  const BindingObserverPage({super.key});

  @override
  State<BindingObserverPage> createState() => _BindingObserverPageState();
}

class _BindingObserverPageState extends State<BindingObserverPage>
    with WidgetsBindingObserver {
  bool ishidden = false;
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    setState(() {
      debugPrint("state=$state");
      ishidden = state != AppLifecycleState.resumed;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("后台挂起页面模糊（安卓无效）-Demo"),
      ),
      body: !ishidden
          ? Image.asset("assets/images/girl.jpg")
          : ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Image.asset("assets/images/girl.jpg")),
    );
  }
}
