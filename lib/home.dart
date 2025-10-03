
// ignore_for_file: avoid_print 

import 'package:astronacci_flutter/Controller/app_controller.dart';
import 'package:astronacci_flutter/login.dart';
import 'package:astronacci_flutter/profil.dart'; 
import 'package:astronacci_flutter/user_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home  extends StatelessWidget {  
  Home({super.key});

  final appController = Get.put(AppController()); 
 
 
   final List<Widget> _children = <Widget>[ 
        UserList(),
        Profil(),
        UserList(),
        Profil(),
    ];  
 

    onTabTapped(int i){
      print ('DON:: _currentIndex $i ');
      appController.setCurrentIndex(i); 
      print ('DON:: appController.currentIndex.value ${appController.currentIndex.value}');
    }

  @override
  Widget build(BuildContext context) { 
    return (appController.isLogin.value == false ) ? Login()
    : Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title : Text('Home')
      ),
      
      body: Obx(() => _children[  appController.currentIndex.value ],)   ,
      bottomNavigationBar: Container(
        color: Colors.indigo,
        child:  Obx(() => BottomNavigationBar(  
            unselectedItemColor: Colors.green,
            selectedItemColor: Colors.blue,
            currentIndex: appController.currentIndex.value, 
            onTap: (v) => onTabTapped(v),
            items:  [ 
              BottomNavigationBarItem(
                icon: Icon(Icons.featured_play_list_sharp),
                label: 'Register',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.featured_play_list_sharp),
                label: 'Login',
              ),   
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'List Users',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profil',
              ), 
            ],
        )),
      ),

    );
  }
}