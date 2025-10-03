// ignore_for_file: avoid_print, unused_local_variable, invalid_use_of_protected_member
 
import 'package:astronacci_flutter/Helper/helper_widget.dart'; 
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Welcome extends StatelessWidget {
  
  Welcome({super.key}); 


  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card( 
            shadowColor: Colors.grey,
            elevation: 20,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Selamat Datang',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.indigo),
                  ),
                  br(30), 
                ],
              ),
            ),
          ),
        ),
      ), 
   
    );
  }


}