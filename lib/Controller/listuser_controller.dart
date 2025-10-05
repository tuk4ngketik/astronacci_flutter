
// ignore_for_file: avoid_print

import 'package:astronacci_flutter/Api/api_user.dart';
import 'package:astronacci_flutter/Config/headers.dart';
import 'package:astronacci_flutter/Controller/app_controller.dart';
import 'package:astronacci_flutter/Models/m_list_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; 

class ListuserController extends GetxController{

  final apiUser = ApiUser(); 
  final appController = Get.find<AppController>();
  final headerCleant = HeaderCleant();
  var  isLoading = false.obs; 
  var statusAktif = 'all_user'.obs; // all_user = semua user || cari == mode pencarian

  late ScrollController scrollController; 
  double _lastOffset = 0.0; 
  final isScrollingDown = false.obs;
  var page = 1.obs;
 
  // Cari 
  final textCari = TextEditingController();

  @override
  void onClose() {  
    super.onClose();
     scrollController.dispose();
     textCari.dispose();
  } 
  
  void _scrollListener() {     
     
     double currentOffset = scrollController.offset;  
        if (currentOffset > _lastOffset) {
          // print("Scroll ke bawah");
        } else if (currentOffset < _lastOffset) {
          // print("Scroll ke atas"); 
        } 
      _lastOffset = currentOffset;

        if (scrollController.position.atEdge) {
          if (scrollController.position.pixels == 0) {
            print(" Mentok di atas");
          } else {
            print(" Mentok di bawah");
            isScrollingDown.value = true;
            getListuser(); 
            update();
          }
        }
  }
  
  @override
  onInit(){   
     scrollController = ScrollController();
     scrollController.addListener(  _scrollListener );
    super.onInit();
  }
  _init() async {
     isLoading.value = true; 
     await Future.delayed(Duration(seconds: 2));
  }

  var mListUser =  MListUser().obs; 
  RxList<Datauser> listDatauser = <Datauser>[].obs; 
   
  Future<void> getListuser() async { 

    statusAktif.value = 'all_user'; 
    textCari.clear();
    
    if(! isScrollingDown.value  ){
      isLoading.value = true; 
    }   

    String host = appController.ipServer.value;
    String port = appController.portServer.value;
    String url = 'http://$host:$port/api/users/${page.value}'; 
    listDatacari.value = [];
 
    try{   
      
      final  res = await apiUser.listUser(url, headerCleant.map);  
      final newdata = res!.data!.data;
      page.value = res.data!.nextPage!;
      listDatauser.addAll(newdata!);
      
      isLoading.value = false;
      isScrollingDown.value = false;
      update();
    }
     catch (e) { 
      isLoading.value = false;
      print("API Error: $e");
    } 
    finally {  
      isLoading.value = false;
      isScrollingDown.value = false;
      print("Loading selesai.");
    }
  }
  
  // var lengthRow = 0.obs;
  // countRow() => lengthRow.value = listDatauser.length; 

 
  RxList<Datauser> listDatacari = <Datauser>[].obs; 
  Future<void> getPencarian() async { 

    statusAktif.value = 'cari'; 
    final  formCari = {'cari': textCari.text };
    print('DON:: formCari $formCari');
    isLoading.value = true;  
    String host = appController.ipServer.value;
    String port = appController.portServer.value;
    String url = 'http://$host:$port/api/cari';
    
    listDatauser.value = [];
    page.value = 1;
    update();
 
    try{    
      // kosongkan data listuser 

      final  res = await apiUser.pencarian(url, formCari,  headerCleant.map);  
      final newdata = res!.data!.data; 
      listDatauser.addAll(newdata!);
      
      isLoading.value = false; 
      update();
    }
     catch (e) { 
      isLoading.value = false;
      print("API Error: $e");
    } 
    finally {  
      isLoading.value = false;
      print("Loading selesai.");
    }
  }
  
}