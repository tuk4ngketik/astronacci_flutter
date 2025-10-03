// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String username = Get.arguments ?? "Unknown User";

    return Scaffold(
      appBar: AppBar(title: Text("Detail User")),
      body: Center(
        child: Text("Detail dari $username"),
      ),
    );
  }
}
