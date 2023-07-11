// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class StudyAppBar {
  static PreferredSizeWidget MyAppBar(String title, BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(title),
    );
  }
}
