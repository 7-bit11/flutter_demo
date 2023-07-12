// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import 'package:study_demo/widget/appbar.dart';

class HeroPage extends StatefulWidget {
  const HeroPage({super.key, required this.url});
  final String url;
  @override
  State<HeroPage> createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  @override
  void initState() {
    super.initState();
    timeDilation = 4.0;
  }

  @override
  void dispose() {
    timeDilation = 1.0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StudyAppBar.MyAppBar("Hero&设置flutter全局动画速度", context, actions: [
        TextButton.icon(
            onPressed: () async {
              if (Platform.isAndroid || Platform.isIOS) {
                EasyLoading.show(
                    status: "下载中",
                    maskType: EasyLoadingMaskType.black,
                    dismissOnTap: false);
                var file = await rootBundle.load(widget.url);
                final result = await ImageGallerySaver.saveImage(
                    Uint8List.sublistView(file));
                EasyLoading.showToast(result['isSuccess'].toString(),
                    duration: const Duration(seconds: 1));
              } else {
                EasyLoading.showToast("当前下载只支持Android和IOS版本",
                    duration: const Duration(seconds: 1));
              }
            },
            icon: const Icon(Icons.save),
            label: const Text("保存本地"))
      ]),
      body: Hero(
        tag: widget.url,
        child: Image.asset(
          widget.url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
