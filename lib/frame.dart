import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_demo/pages/AnimatedContainer_page.dart';
import 'package:study_demo/pages/AnimationBuilder_page.dart';
import 'package:study_demo/pages/AnimationController_page.dart';
import 'package:study_demo/pages/AnimationController_page1.dart';
import 'package:study_demo/pages/Autocomplete_page.dart';
import 'package:study_demo/pages/BindingObserver_page.dart';
import 'package:study_demo/pages/Curves_page.dart';
import 'package:study_demo/pages/Dismissible_page.dart';
import 'package:study_demo/pages/FutureBuilder_page.dart';
import 'package:study_demo/pages/Hero/List_page.dart';
import 'package:study_demo/pages/ListView_page.dart';
import 'package:study_demo/pages/ListWheelScrollView_page.dart';
import 'package:study_demo/pages/Magnifier_page.dart';
import 'package:study_demo/pages/RangeSlider_page.dart';
import 'package:study_demo/pages/ReorderableListView_page.dart';
import 'package:study_demo/pages/Scrollable_Refresh_page.dart';
import 'package:study_demo/pages/Shirne_page.dart';
import 'package:study_demo/pages/SliverAppBar_page.dart';
import 'package:study_demo/pages/TweenAnimationBuidlder_page.dart';
import 'package:study_demo/pages/TweenAnimationBuidlder_page1.dart';
import 'package:study_demo/pages/button_page.dart';
import 'package:study_demo/pages/watermark_page.dart';

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
          const SizedBox(height: 20),
          getItem("Curves-线性动画", const CurvesPage()),
          const SizedBox(height: 20),
          getItem("拖动条-透明度", const RangeSliderPage()),
          const SizedBox(height: 20),
          getItem("TweenAnimationBuidlder-补间动画",
              const TweenAnimationBuidlderPage()),
          const SizedBox(height: 20),
          getItem("TweenAnimationBuidlder-计数器",
              const TweenAnimationBuidlderPage1()),
          const SizedBox(height: 20),
          getItem("AnimationController-动画控制器", const AnimationControllerPage()),
          const SizedBox(height: 20),
          getItem("AnimationBuilder-自定义动画", const AnimationBuilderPage()),
          const SizedBox(height: 20),
          getItem("AnimatedContainer-多个动画控制器", const AnimatedContainerPage1()),
          const SizedBox(height: 20),
          getItem("Hero-动画效果", const ListHeroPage()),
          const SizedBox(height: 20),
          getItem("ReorderableListView-拖拽", const ReorderableListViewPage()),
          const SizedBox(height: 20),
          getItem("ListView-跳转动画", const ListViewPage()),
          const SizedBox(height: 20),
          getItem("Refresh-下拉刷新&上拉加载", const ScrollableRefreshPage()),
          const SizedBox(height: 20),
          getItem("Dismissible-左右滑动删除", const DismissiblePage()),
          const SizedBox(height: 20),
          getItem("ListWheelScrollView-3D列表", const ListWheelScrollViewPage()),
          const SizedBox(height: 20),
          getItem("FutureBuilder-异步构建", const FutureBuilderPage()),
          const SizedBox(height: 20),
          getItem("SliverAppBar", const SliverAppBarPage()),
          const SizedBox(height: 20),
          getItem("ButtonPage-DIY各种按钮", const ButtonPage()),
          const SizedBox(height: 20),
          getItem("Watermark-水印", const WatermarkPage()),
          const SizedBox(height: 20),
          getItem("拖拽放大自定义组件", const Shirne()),
          const SizedBox(height: 20),
          const SizedBox(height: 100),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "发现"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "我的")
      ]),
    );
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
