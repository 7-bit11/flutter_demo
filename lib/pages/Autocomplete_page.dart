import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:study_demo/widget/appbar.dart';

class AutoCompletePage extends StatefulWidget {
  const AutoCompletePage({super.key});

  @override
  State<AutoCompletePage> createState() => _AutoCompletePageState();
}

class _AutoCompletePageState extends State<AutoCompletePage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: StudyAppBar.MyAppBar("AutoComplete-Demo", context),
        body: SingleChildScrollView(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            children: [
              const Text("区分大小写", style: TextStyle(fontSize: 18)),
              Autocomplete(
                optionsBuilder: (textEditingValue) {
                  var text = textEditingValue.text;
                  final candidates = ['application', 'bar', 'clean', 'double'];
                  return candidates.where((element) => element.contains(text));
                },
              ),
              const SizedBox(height: 50),
              const Text("不区分大小写", style: TextStyle(fontSize: 18)),
              Autocomplete(
                optionsBuilder: (textEditingValue) {
                  var text = textEditingValue.text;
                  final candidates = ['application', 'bar', 'clean', 'double'];
                  return candidates.where((element) =>
                      element.toUpperCase().contains(text.toUpperCase()));
                },
              ),
              const SizedBox(height: 50),
              const Text("异步等待两秒后显示搜索结果", style: TextStyle(fontSize: 18)),
              Autocomplete(
                optionsBuilder: (textEditingValue) async {
                  await Future.delayed(const Duration(seconds: 1));
                  var text = textEditingValue.text;
                  final candidates = ['application', 'bar', 'clean', 'double'];
                  return candidates.where((element) =>
                      element.toUpperCase().contains(text.toUpperCase()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
