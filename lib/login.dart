// ignore_for_file: avoid_print, unused_local_variable, invalid_use_of_protected_member

import 'package:astronacci_flutter/Api/api_user.dart';
import 'package:astronacci_flutter/Config/headers.dart';
import 'package:astronacci_flutter/Controller/app_controller.dart'; 
import 'package:astronacci_flutter/Helper/form_ipserver.dart';
import 'package:astronacci_flutter/Helper/helper_widget.dart';
import 'package:astronacci_flutter/Controller/login_controller.dart';
import 'package:astronacci_flutter/Models/user.dart'; 
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Login extends StatelessWidget {
  
  Login({super.key});
  
  final apiUser = ApiUser();
  final loginController = Get.put(LoginController(), permanent: true);
  final appController = Get.put(AppController(), permanent: true);
  final loginFormKey = GlobalKey<FormState>();


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
              child: Form(
                // key: loginController.loginFormKey,
                key: loginFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Astronacci',
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.indigo),
                    ),
                    br(30),
            
                    // --- 1.  Email ---
                    TextFormField(
                      controller: loginController.emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email tidak boleh kosong';
                        }
                        if (!GetUtils.isEmail(value)) {
                          return 'Format email tidak valid';
                        }
                        return null;
                      },
                    ),
                    br(20),
            
                    // --- 2.  Password ---
                    TextFormField(
                      controller: loginController.passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
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
            
            
                    Obx(() => SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton( 
                            onPressed: () => _submitLogin(), 
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.indigo, 
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: loginController.isLoading.value
                                ? const CircularProgressIndicator(color: Colors.white)
                                : const Text(
                                    'LOGIN',
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                          ),
                    )),
                    br(10),

                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        // onPressed:() =>  Get.to(()=>Register()),
                        onPressed:() async =>  await Get.toNamed (  'register', preventDuplicates: false) ,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey, 
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child:  const Text(
                                'REGISTER',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                      ),
                    ),
                  
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () {
          Get.bottomSheet(FormIpserver());
        },
        child: Icon(Icons.wifi_find_outlined, color: Colors.white,),
      ),
   
    );
  }

  _submitLogin() async { 
    print('DON:: ${appController.ipServer.value} : ${appController.portServer.value}');
    if(appController.ipServer.value == '' || appController.portServer.value == '' ){
      dialogError('IP & Port Server belum ditetapkan');
      return;
    }
    if (loginFormKey.currentState!.validate() == false) { return; }

    loginController.handleLogin();
    print('DON:: formlogin ${loginController.formLogin.value}');

    String host = appController.ipServer.value;
    String port = appController.portServer.value;
    String url = 'http://$host:$port/api/login';  
    final res = await apiUser.login(url, loginController.formLogin, HeaderCleant().map ) 
                        .catchError((onError){ 
                           loginController.setLoading(false);
                           dialogError('${onError.message}');   
                           return null;
                        });
    final status = res!.status;
    final msg = res.msg; 
    if(status == false){
        dialogError('${res.msg}');  
        loginController.setLoading(false); // loading false 
        return;
    }

     final data = res.data!;
     final user = User(email: data.email, name: data.name, level: data.level, profileImage: data.profileImage );
     appController.setDatauser(user); // simpan data user
     appController.setLogin(true); // User berhasil login
     loginController.setLoading(false); // loading false  
     Get.toNamed('home');
  }

}