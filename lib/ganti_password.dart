// ignore_for_file: avoid_print, unused_local_variable, invalid_use_of_protected_member

import 'package:astronacci_flutter/Api/api_user.dart';
import 'package:astronacci_flutter/Config/headers.dart';
import 'package:astronacci_flutter/Controller/app_controller.dart';  
import 'package:astronacci_flutter/Helper/helper_widget.dart';
import 'package:astronacci_flutter/Controller/login_controller.dart';
import 'package:astronacci_flutter/home.dart';
import 'package:astronacci_flutter/login.dart'; 
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class GantiPassword extends StatelessWidget {
  
  GantiPassword({super.key});
  
  final apiUser = ApiUser();
  final appController = Get.put(AppController(), permanent: true); 
  final loginController = Get.put(LoginController(), permanent: true); 
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title : Text('Ganti Password', style: TextStyle(color:Colors.white),)
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card( 
            shadowColor: Colors.grey,
            elevation: 20,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32.0),
              child: Form(
                // key: loginController._formKey,
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Astronacci',
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.orange),
                    ),
                    br(30),
                    
                    // -  Password Lama---
                    TextFormField( 
                      controller: loginController.passwdlama,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password lama',
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password lama tidak boleh kosong';
                        } 
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
            
                    // -  Password ---
                    TextFormField( 
                      controller: loginController.passwdbaru,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password Baru',
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password tidak boleh kosong';
                        }
                        if (value.length < 6) {
                          return 'Password minimal 6 karakter';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),

                    // -  Ulangi --- 
                      TextFormField( 
                        controller: loginController.passwdUlangi,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Ulangi Password Baru',
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(),
                        ),
                      ), 
                    const SizedBox(height: 30),
            
            
                    Obx(() => SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton( 
                            onPressed: () => _submitForm(), 
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange, 
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: loginController.isLoading.value
                                ? const CircularProgressIndicator(color: Colors.white)
                                : const Text(
                                    'KIRIM',
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                          ),
                    )),
                    br(10), 
                  
                  ],
                ),
              ),
            ),
          ),
        ),
      ), 
   
    );
  }

  _submitForm() async { 
    
    if (_formKey.currentState!.validate() == false) { return; }
 
    loginController.handleLupapasswd();     

    if(loginController.passwdbaru.text != loginController.passwdUlangi.text){
      dialogError("password baru tidak sesuai");
      return;
    }
    
    print('DON:: formLupa ${loginController.formGantipasswd}'); 
    loginController.setLoading(true);



    String host = appController.ipServer.value;
    String port = appController.portServer.value;
    String url = 'http://$host:$port/api/ganti-passwd';  
    final res = await apiUser.gantiPasswd(url, loginController.formGantipasswd, HeaderCleant().map ) 
                        .catchError((onError){ 
                           loginController.setLoading(false);
                           dialogError('${onError.message}');   
                           return null;
                        });
    final status = res!.status;
    final msg = res.msg!; 
    if(status == false){
        dialogError('${res.msg}');  
        loginController.setLoading(false); // loading false 
        return;
    }

     Get.snackbar('Sukses', msg, backgroundColor: Colors.greenAccent ); 
     loginController.setLoading(false); // loading false   
      appController.setLogin(false);  
      Get.offNamedUntil(
        '/home', // Halaman tujuan
        (route) => false // Predikat: Hapus SEMUA halaman sebelumnya
      );
  }

}