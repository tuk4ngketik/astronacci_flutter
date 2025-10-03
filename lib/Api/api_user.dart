 // ignore_for_file: avoid_print

import 'package:astronacci_flutter/Api/eksepsion.dart';
import 'package:astronacci_flutter/Models/m_all.dart';
import 'package:astronacci_flutter/Models/m_list_user.dart';
import 'package:astronacci_flutter/Models/m_user.dart';
import 'package:http/http.dart' as http;

class ApiUser{  

  Future<MUser?> login(String url,  var data,  Map<String, String> headers) async { 
    
        print('DON:: apiLogin $url');
      try{   
          var res = await http.post( Uri.parse( url ), headers: headers, body: data );   
          
          if(res.statusCode == 200){ 
            print('DON:: res ${res.body}');
            final  hasil = mUserFromJson(res.body);
            return hasil;
          }else{
            print('DON:: NULl res.statusCode ${ res.statusCode}  res.body ${ res.body}'); 
            throw  Exception('Error Page ${ res.statusCode} ');
          }

      } 
      catch(e){
          print('DON:: e =>  $e');
          Ekseption(e: e).trow(); 
      }
      return null;   
  }

  Future<MAll?> register(String url,  var data,  Map<String, String> headers) async { 
    
        print('DON:: apiLogin $url');
      try{   
          var res = await http.post( Uri.parse( url ), headers: headers, body: data );   
          
          if(res.statusCode == 200){ 
            print('DON:: res ${res.body}');
            final  hasil = mAllFromJson (res.body);
            return hasil;
          }else{
            print('DON:: NULl res.statusCode ${ res.statusCode}  res.body ${ res.body}'); 
            throw  Exception('Error Page ${ res.statusCode} ');
          }

      } 
      catch(e){
          print('DON:: e =>  $e');
          Ekseption(e: e).trow(); 
      }
      return null;   
  }

  Future<MListUser?> listUser(String url,  Map<String, String> headers) async {

     print('DON:: apiLogin $url');
      try{   
          var res = await http.get( Uri.parse( url ), headers: headers );   
          
          if(res.statusCode == 200){ 
            print('DON:: res ${res.body}');
            final  hasil = mListUserFromJson(res.body);
            return hasil;
          }else{
            print('DON:: NULl res.statusCode ${ res.statusCode}  res.body ${ res.body}'); 
            throw  Exception('Error Page ${ res.statusCode} ');
          }

      } 
      catch(e){
          print('DON:: e =>  $e');
          Ekseption(e: e).trow(); 
      }
      return null; 
  }

}