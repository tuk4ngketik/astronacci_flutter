import 'package:astronacci_flutter/Controller/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController { 
 
 
  final appController = Get.put(AppController() ); 
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  // Ganti passwod
  final passwdlama = TextEditingController();
  final passwdbaru = TextEditingController();
  final passwdUlangi = TextEditingController();

  // Observable untuk menampilkan status loading
  var isLoading = false.obs; 
  var formLogin = {}.obs; // OK   
  var formGantipasswd = {}.obs; // OK   

  @override
  void onClose() { 
    emailController.dispose();
    passwordController.dispose();
    passwdlama.dispose();
    passwdbaru.dispose();
    passwdUlangi.dispose();
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
  void handleLupapasswd() async {
    
      String passwd_lama = passwdlama.text;
      String passwd_baru = passwdbaru.text; 
      formGantipasswd.value = { 'passwd_lama' : passwd_lama, 'passwd_baru' : passwd_baru, 'email':appController.user.value.email };  
      
  } 

  setLoading(bool v) => isLoading.value = v; 

  clearFormlogin(){
      emailController.clear();
      passwordController.clear();
      passwdUlangi.clear();
      passwdbaru.clear();
      passwdlama.clear();

  }  

}
