// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:astronacci_flutter/Config/routes.dart';
import 'package:get/get.dart'; 

class UserList extends StatelessWidget {
  final List<String> users = ["Alice", "Bob", "Charlie", "David"];
  final TextEditingController searchCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: searchCtrl,
              decoration: InputDecoration(
                labelText: "Search User",
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (_, i) => ListTile(
                title: Text(users[i]),
                onTap: () => Get.toNamed(AppRoutes.userDetail, arguments: users[i]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
