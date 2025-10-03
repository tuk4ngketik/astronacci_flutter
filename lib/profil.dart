// ignore_for_file: use_key_in_widget_constructors

import 'package:astronacci_flutter/Controller/app_controller.dart';
import 'package:astronacci_flutter/Helper/helper_widget.dart';
import 'package:astronacci_flutter/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profil extends StatelessWidget { 
  
  Profil({super.key});
  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Daftar Akun Baru',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.indigo),
              ),
              br(30),
          
              // --- 1. Pemilih Foto (Reactive) ---
              // Obx(() => Column(
              //       children: [
              //         CircleAvatar(
              //           radius: 60,
              //           backgroundColor: Colors.grey.shade300,
              //           child: regController.selectedImage.value == null
              //               ? const Icon(Icons.person, size: 60, color: Colors.white)
              //               // Tampilkan gambar dari file yang dipilih
              //               : ClipOval( 
              //                   child: Image.file(
              //                     regController.selectedImage.value!,
              //                     fit: BoxFit.cover,
              //                     width: 120,
              //                     height: 120,
              //                   ),
              //                 ),
              //         ),
              //         TextButton.icon(
              //           onPressed: regController.pickImage,
              //           icon: const Icon(Icons.camera_alt, color: Colors.indigo),
              //           label: Text(
              //             regController.selectedImage.value == null ? 'Pilih Foto Profil' : 'Ganti Foto',
              //             style: const TextStyle(color: Colors.indigo),
              //           ),
              //         ),
              //       ],
              //     )),
              //     br(20),
          
              // --- 2. Field Nama ---
              TextFormField( 
                decoration: const InputDecoration(
                  labelText: 'Nama Lengkap',
                  prefixIcon: Icon(Icons.person_outline),
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? 'Nama tidak boleh kosong' : null,
              ),
              br(20),
          
              // --- 3. Field Email ---
              TextFormField( 
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) return 'Email tidak boleh kosong';
                  if (!GetUtils.isEmail(value)) return 'Format email tidak valid';
                  return null;
                },
              ),
              br(20),
          
              // --- 4. Field Password ---
              TextFormField( 
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.length < 6 ? 'Password minimal 6 karakter' : null,
              ),
              br(20),
          
              // --- 5. Tombol Regist 
              TextButton.icon(
                // onPressed: () => Get.to(()=>Login()), 
                onPressed: () {
                  controller.setLogin(false); 
                  Get.offAll(() => Login() );
                  // Get.off(() => Login() );
                },
                // onPressed: () => Get.toNamed('login', preventDuplicates: false),
                icon: Icon(Icons.logout_outlined), 
                label: Text('Logout', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              ),
          
            ],
          ),
        ),
      ),
    );
  }
  
  
}