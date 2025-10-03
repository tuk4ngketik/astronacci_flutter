// ignore_for_file: avoid_print

import 'package:astronacci_flutter/Api/api_user.dart';
import 'package:astronacci_flutter/Config/headers.dart';
import 'package:astronacci_flutter/Controller/app_controller.dart';
import 'package:astronacci_flutter/Controller/register_controller.dart';
import 'package:astronacci_flutter/Helper/form_ipserver.dart';
import 'package:astronacci_flutter/Helper/helper_widget.dart'; 
import 'package:flutter/material.dart';
import 'package:get/get.dart'; 

class Register extends StatelessWidget {

  Register({super.key});
  
  final regController = Get.put(RegisterController());
  final appController = Get.put(AppController(), permanent: true);
  final registerFormKey = GlobalKey<FormState>();
  final apiUser = ApiUser();
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Form(
            // key: regController.registerFormKey,
            key: registerFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Daftar Akun Baru',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo),
                ),
                br(30),

                // --- 1. Pemilih Foto (Reactive) ---
                Obx(() => Column(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.grey.shade300,
                          child: regController.selectedImage.value == null
                              ? const Icon(Icons.person, size: 60, color: Colors.white)
                              // Tampilkan gambar dari file yang dipilih
                              : ClipOval( 
                                  child: Image.file(
                                    regController.selectedImage.value!,
                                    fit: BoxFit.cover,
                                    width: 120,
                                    height: 120,
                                  ),
                                ),
                        ),
                        TextButton.icon(
                          onPressed: regController.pickImage,
                          icon: const Icon(Icons.camera_alt, color: Colors.indigo),
                          label: Text(
                            regController.selectedImage.value == null ? 'Pilih Foto Profil' : 'Ganti Foto',
                            style: const TextStyle(color: Colors.indigo),
                          ),
                        ),
                      ],
                    )),
                    br(20),

                // --- 2. Field Nama ---
                TextFormField(
                  controller: regController.nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nama Lengkap',
                    prefixIcon: Icon(Icons.person_outline),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => value!.isEmpty ? 'Nama tidak boleh kosong' : null,
                ),
                br(20),

                // --- 3. Field Email ---
                TextFormField(
                  controller: regController.emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) return 'Email tidak boleh kosong';
                    if (!GetUtils.isEmail(value)) return 'Format email tidak valid';
                    return null;
                  },
                ),
                br(20),

                // --- 4. Field Password ---
                TextFormField(
                  controller: regController.passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => value!.length < 6 ? 'Password minimal 6 karakter' : null,
                ),
                br(20),

                // --- 5. Tombol Register (Warna INDIGO) ---
                Obx(() => SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        // onPressed: regController.isLoading.value ? null : regController.handleRegister,
                        onPressed: _submitForm,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo, // Warna INDIGO
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: regController.isLoading.value
                            ? const CircularProgressIndicator(color: Colors.white)
                            : const Text(
                                'DAFTAR',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                      ),
                    )),
                br(20), 
                TextButton.icon( 
                  onPressed: () => Get.toNamed('login', preventDuplicates: false),
                  icon: Icon(Icons.login), 
                  label: Text('Sudah punya akun', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                ),

              ],
            ),
          ),
        ),
      ),
   
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () => Get.bottomSheet(FormIpserver()),
        child: Icon(Icons.wifi_find_outlined, color: Colors.white,),
      ),
    );
  }

  _submitForm() async {
    print('DON:: ${appController.ipServer.value} : ${appController.portServer.value}');
    if(appController.ipServer.value == '' || appController.portServer.value == '' ){
      dialogError('IP & Port Server belum ditetapkan');
      return;
    }
    if (registerFormKey.currentState!.validate() == false) { return; }

    if(regController.selectedImage.value == null){
      dialogError('Foto belum dipilih');
      return;
    }

    regController.handleRegister();
    await Future.delayed(const Duration(seconds: 3));  
    print('DON:: formRegister ${regController.formRegister.value}');
    // regController.setLoading(false);
    // return;

    String host = appController.ipServer.value;
    String port = appController.portServer.value;
    String url = 'http://$host:$port/api/register';  
    final res = await apiUser.register(url, regController.formRegister, HeaderCleant().map ) 
                        .catchError((onError){ 
                           regController.setLoading(false);
                           dialogError('${onError.message}');   
                           return null;
                        });
    final status = res!.status;
    final msg = res.msg; 
    if(status == false){
        dialogError('${res.msg}');  
        regController.setLoading(false); // loading false 
        return;
    }
     regController.clearFormRegister();
     regController.setLoading(false);
     Get.toNamed('login');

  }

}