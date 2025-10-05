// ignore_for_file: use_key_in_widget_constructors

import 'dart:convert';

import 'package:astronacci_flutter/Controller/app_controller.dart';
import 'package:astronacci_flutter/Helper/helper_widget.dart';
import 'package:astronacci_flutter/Models/m_list_user.dart';
import 'package:astronacci_flutter/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetail extends StatelessWidget { 
  Datauser data; 
  UserDetail({super.key, required this.data});
  final controller = Get.put(AppController());


  @override
  Widget build(BuildContext context) {
    
    return (controller.isLogin.value == false ) ? Login() : Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Detail User', style: TextStyle(color:Colors.white),),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
           
              Column(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey.shade300,
                        child: data.profileImage == null
                            ? const Icon(Icons.person, size: 60, color: Colors.white) 
                            // : Image.memory(
                            //       base64Decode('${data.profileImage}') 
                            //     ) 
                            : ClipOval( 
                                child : Image.memory(
                                  base64Decode('${data.profileImage}') 
                                ) 
                              ),
                      ), 
                    ],
                  ),
                  br(20),
          
              // --- 2. Field Nama ---
              ListTile(  
                  title: Text('Name'),
                  subtitle: Text('${data.name }'),
                  leading: Icon(Icons.person_outline), 
              ), 
              br(20),
          
              // --- 3. Field Email ---
              ListTile(  
                  title: Text('Email'),
                  subtitle: Text('${data.email }'),
                  leading: Icon(Icons.email), 
              ),
              br(20),
          
              // --- 4. Field Password ---
              ListTile(  
                  title: Text('Level'),
                  subtitle: Text( data.level ??= 'User' ),
                  leading: Icon(Icons.star_half_rounded), 
              ),
              br(20),
              ListTile(  
                  title: Text('Created'),
                  subtitle: Text( DateTime.parse('${data.createdAt}').toString() ),
                  leading: Icon(Icons.star_half_rounded), 
              ),
              br(20), 
              
          
            ],
          ),
        ),
      ),
    );
  }
  
  
}