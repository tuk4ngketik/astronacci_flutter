import 'package:astronacci_flutter/Config/routes.dart';
import 'package:astronacci_flutter/Controller/app_controller.dart';
import 'package:astronacci_flutter/home.dart';
import 'package:astronacci_flutter/login.dart';
import 'package:astronacci_flutter/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; 

void main() async { 
  WidgetsFlutterBinding.ensureInitialized();  
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Protected AppRoutes Demo',
       
      getPages: [
        GetPage(
          name: AppRoutes.register,
          page: () => Register(),  
        ),
        GetPage(
          name: AppRoutes.login,
          page: () => Login(),  
        ),
        GetPage(
          name: AppRoutes.home,
          page: () => (appController.isLoading.value == true)  ? Home() : Login(), // Halaman Home 
        ),
      ],
      
      initialRoute:  AppRoutes.home,
    );
  }
}