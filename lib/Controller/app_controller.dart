
import 'package:astronacci_flutter/Api/api_user.dart'; 
import 'package:astronacci_flutter/Models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; 

class AppController extends GetxController{

  final apiUser = ApiUser();
  final ipController = TextEditingController();
  final portController = TextEditingController();
  var  isLoading = false.obs;

  @override
  void onClose() { 
    ipController.dispose(); 
    portController.dispose();  
    super.onClose();
  } 

  var user =  User().obs; 
  setDatauser(User usr)=> user.value = usr; 

  var isLogin = false .obs;
  setLogin(bool v ) =>  isLogin.value = v;   

  var currentIndex = 0.obs;
  setCurrentIndex(int i) => currentIndex.value = i;  
  
  var ipServer = ''.obs;
  setIpServer(String ip) => ipServer.value = ip; 
  
  var portServer = ''.obs;
  setPortServer(String v) => portServer.value = v;  
  
}