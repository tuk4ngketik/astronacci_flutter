// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
  final TextEditingController emailCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lupa Password")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Masukkan email untuk reset password:"),
            SizedBox(height: 10),
            TextField(controller: emailCtrl, decoration: InputDecoration(labelText: "Email")),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // nanti disambungkan ke API reset password
                Get.snackbar("Info", "Link reset password terkirim ke email");
                Get.back();
              },
              child: Text("Kirim"),
            ),
          ],
        ),
      ),
    );
  }
}
