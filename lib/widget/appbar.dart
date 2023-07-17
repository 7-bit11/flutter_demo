// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class StudyAppBar {
  static PreferredSizeWidget MyAppBar(String title, BuildContext context,
      {List<Widget>? actions, Key? key, Color? backgroundColor}) {
    backgroundColor ??= Theme.of(context).colorScheme.inversePrimary;
    return AppBar(
      key: key,
      centerTitle: true,
      backgroundColor: backgroundColor,
      title: Text(title),
      actions: actions,
    );
  }
}
