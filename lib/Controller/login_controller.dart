import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController { 
 
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  // Observable untuk menampilkan status loading
  var isLoading = false.obs; 
  var formLogin = {}.obs; // OK   

  @override
  void onClose() { 
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  // Metode untuk menangani proses login
  void handleLogin() async {
    
      isLoading.value = true;

      // Dapatkan nilai input
      String email = emailController.text;
      String password = passwordController.text;
      
      formLogin.value = {'email' : email, 'password' : password };  
      
  } 

  setLoading(bool v) => isLoading.value = v; 
  

}