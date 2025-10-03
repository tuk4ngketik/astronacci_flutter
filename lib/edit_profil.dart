// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfile extends StatelessWidget {
  final TextEditingController nameCtrl = TextEditingController(text: "User Demo");
  final TextEditingController emailCtrl = TextEditingController(text: "demo@email.com");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: nameCtrl, decoration: InputDecoration(labelText: "Nama")),
            TextField(controller: emailCtrl, decoration: InputDecoration(labelText: "Email")),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // contoh: simpan dan kembali
                Get.snackbar("Sukses", "Profil berhasil diperbarui");
                Get.back();
              },
              child: Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}
