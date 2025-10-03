
// ignore_for_file: avoid_print 

import 'package:astronacci_flutter/Config/headers.dart';
import 'package:astronacci_flutter/Controller/app_controller.dart';
import 'package:astronacci_flutter/login.dart';
import 'package:astronacci_flutter/profil.dart'; 
import 'package:astronacci_flutter/user_list.dart';
import 'package:astronacci_flutter/welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home  extends StatelessWidget {  
  Home({super.key});

  final appController = Get.put(AppController());  
 
 
   final List<Widget> _children = <Widget>[ 
        Welcome(), 
        UserList(header: HeaderCleant().map,),
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
        leading: Icon(Icons.star, color: Colors.deepOrange),
        title : Text('Astronacci Flutter', style: TextStyle(color: Colors.white),)
      ),
      
      body: Obx(() => _children[  appController.currentIndex.value ],)   ,
      bottomNavigationBar: Container(
        color: Colors.indigo,
        child:  Obx(() => BottomNavigationBar(  
            unselectedItemColor: Colors.blue,
            selectedItemColor: Colors.indigo,
            currentIndex: appController.currentIndex.value, 
            onTap: (v) => onTabTapped(v),
            items:  [ 
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ), 
              BottomNavigationBarItem(
                icon: Icon(Icons.featured_play_list_sharp),
                label: 'List User',
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