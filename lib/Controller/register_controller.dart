// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; // Digunakan untuk tipe File

class RegisterController extends GetxController {
  
  // Controllers untuk input teks
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Observable untuk menyimpan file foto yang dipilih
  Rx<File?> selectedImage = Rx<File?>(null);
  
  // Observable untuk status loading
  var isLoading = false.obs;

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose(); 
    super.onClose();
  }

  // --- Metode untuk Memilih Gambar ---
  void pickImage() async {
    final picker = ImagePicker();
    // final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    final pickedFile = await picker.pickImage(source: ImageSource.camera, imageQuality:10 );

    if (pickedFile != null) {
      // Set nilai Rx dengan File yang baru
      selectedImage.value = File(pickedFile.path);
    } else {
      Get.snackbar('Informasi', 'Pengambilan foto dibatalkan.',
          backgroundColor: Colors.yellow.shade100);
    }
  }

  // --- Metode untuk Registrasi ---
  void handleRegister() async {
    
      // Set loading state
      isLoading.value = true;

      // Dapatkan semua nilai
      String name = nameController.text;
      String email = emailController.text;
      String password = passwordController.text;
      File photoFile = selectedImage.value!; // File foto
      final bytes = await photoFile.readAsBytes(); 

      // --- Simulasi Proses Registrasi ke API ---
      formRegister.value = {'email' : email, 
                            'password' : password,
                            'name' : name, 
                            // 'profile_image' : bytes,
                            'profile_image' : base64Encode(bytes), 
              };  

      await Future.delayed(const Duration(seconds: 1));  

  }

    var formRegister = {}.obs;
    setLoading(bool v) => isLoading.value = v; 
}