// ignore_for_file: use_key_in_widget_constructors

import 'dart:convert';
import 'dart:typed_data';

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
                'Profil',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.indigo),
              ),
              br(30),
           
              Obx(() => Column(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey.shade300,
                        child: controller.user.value.profileImage == null
                            ? const Icon(Icons.person, size: 60, color: Colors.white) 
                            : ClipOval( 
                                child : Image.memory(
                                  base64Decode('${controller.user.value.profileImage}') 
                                ) 
                              ),
                      ), 
                    ],
                  )),
                  br(20),
          
              // --- 2. Field Nama ---
              ListTile(  
                  title: Text('${controller.user.value.name }'),
                  leading: Icon(Icons.person_outline), 
              ), 
              br(20),
          
              // --- 3. Field Email ---
              ListTile(  
                  title: Text('${controller.user.value.email }'),
                  leading: Icon(Icons.email), 
              ),
              br(20),
          
              // --- 4. Field Password ---
              ListTile(  
                  title: Text( controller.user.value.level ??= 'User' ),
                  leading: Icon(Icons.star_half_rounded), 
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