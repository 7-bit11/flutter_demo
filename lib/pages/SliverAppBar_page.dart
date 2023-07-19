import 'package:flutter/material.dart';

class SliverAppBarPage extends StatefulWidget {
  const SliverAppBarPage({super.key});

  @override
  State<SliverAppBarPage> createState() => _SliverAppBarPageState();
}

class _SliverAppBarPageState extends State<SliverAppBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            //floating: true,
            //snap: true,
            expandedHeight: 200,
            stretch: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/2.png",
                fit: BoxFit.cover,
              ),
              title: const Text(
                "SliverAppBar-Demo",
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              stretchModes: const [
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
                StretchMode.zoomBackground
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Image.asset("assets/images/4.png"),
          ),
          SliverList.builder(
            itemBuilder: (c, i) {
              return Image.asset("assets/images/${i + 1}.png");
            },
            itemCount: 13,
          )
        ],
      ),
    );
  }
}
