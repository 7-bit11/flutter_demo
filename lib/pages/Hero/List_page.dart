// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:study_demo/pages/Hero/Hero_page.dart';
import 'package:study_demo/widget/appbar.dart';

class ListHeroPage extends StatefulWidget {
  const ListHeroPage({super.key});

  @override
  State<ListHeroPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListHeroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StudyAppBar.MyAppBar("Hero_List-Demo", context),
      body: MasonryGridView.count(
        crossAxisCount: 2,
        itemCount: 13,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () =>
                Get.to(HeroPage(url: "assets/images/${index + 1}.png")),
            child: Hero(
                tag: "assets/images/${index + 1}.png",
                child: Image.asset("assets/images/${index + 1}.png")),
          );
        },
      ),
    );
  }
}
