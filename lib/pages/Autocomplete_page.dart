// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:study_demo/widget/appbar.dart';

class AutoCompletePage extends StatefulWidget {
  const AutoCompletePage({super.key});

  @override
  State<AutoCompletePage> createState() => _AutoCompletePageState();
}

class _AutoCompletePageState extends State<AutoCompletePage> {
  final SearchController controller = SearchController();
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
              Column(
                children: [
                  SearchAnchor(
                      isFullScreen: false,
                      searchController: controller,
                      viewConstraints: const BoxConstraints(
                          minWidth: 300, minHeight: 100.0, maxHeight: 200),
                      builder:
                          (BuildContext context, SearchController controller) {
                        return IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {
                            controller.openView();
                          },
                        );
                      },
                      suggestionsBuilder:
                          (BuildContext context, SearchController controller) {
                        return List<ListTile>.generate(5, (int index) {
                          final String item = 'item $index';
                          return ListTile(
                            title: Text(item),
                            onTap: () {
                              setState(() {
                                Feedback.forTap(context);
                                controller.closeView(item);
                              });
                            },
                          );
                        });
                      }),
                  Center(
                    child: controller.text.isEmpty
                        ? const Text('未选择')
                        : Text('选择的值为: ${controller.value.text}'),
                  ),
                ],
              ),
              const SizedBox(height: 50),
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
