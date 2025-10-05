import 'package:astronacci_flutter/edit_profil.dart';
import 'package:astronacci_flutter/forgot_passwort.dart';
import 'package:astronacci_flutter/home.dart';
import 'package:astronacci_flutter/login.dart';
import 'package:astronacci_flutter/register.dart';
import 'package:astronacci_flutter/user_detail.dart'; 
import 'package:get/get.dart';

class AppRoutes {
  static const home = '/home';
  static const login = '/login';
  static const register = '/register';
  static const forgotPassword = '/forgot-password';
  static const editProfile = '/edit-profile';
  static const userList = '/users';
  static const userDetail = '/users/detail';
  static const logout = '/logout';
}

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.home, page: () => Home()),
    GetPage(name: AppRoutes.login, page: () => Login()),
    GetPage(name: AppRoutes.register, page: () => Register()),
    GetPage(name: AppRoutes.forgotPassword, page: () => ForgotPassword()),
    GetPage(name: AppRoutes.editProfile, page: () => EditProfile()), 
    // logout bisa diarahkan ke login lagi
    GetPage(name: AppRoutes.logout, page: () => Login()),
  ];
}
