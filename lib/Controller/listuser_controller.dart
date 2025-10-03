
import 'package:astronacci_flutter/Api/api_user.dart';
import 'package:astronacci_flutter/Config/headers.dart';
import 'package:astronacci_flutter/Controller/app_controller.dart';
import 'package:astronacci_flutter/Models/m_list_user.dart';
import 'package:get/get.dart'; 

class ListuserController extends GetxController{

  final apiUser = ApiUser(); 
  final appController = Get.find<AppController>();
  final headerCleant = HeaderCleant();
  var  isLoading = false.obs;

  @override
  void onClose() {  
    super.onClose();
  } 

  @override
  onInit(){
    // getListuser(  null, headerCleant.map);
    super.onInit();
  }
 
  var mListUser =  MListUser().obs; 
  Future<void> getListuser(String? url,  Map<String, String> headers) async { 
    
    isLoading.value = true;
    // update();

    String host = appController.ipServer.value;
    String port = appController.portServer.value;
    String url = 'http://$host:$port/api/users'; 
    print ('DON:: url $url');
 
    try{
        
      var res = await apiUser.listUser(url, headers);  
      mListUser.value = res!; 
      // isLoading.value = false;
      update();
    }
     catch (e) {
      // Tangani error, tampilkan pesan, dll.
      print("API Error: $e");
    } 
    finally {
      // Blok 'finally' menjamin ini dipanggil. 
      isLoading.value = false;
      print("Loading selesai.");
    }
  }
 

  
}