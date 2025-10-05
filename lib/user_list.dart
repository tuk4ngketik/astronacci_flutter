// ignore_for_file: use_key_in_widget_constructors, prefer_typing_uninitialized_variables, use_function_type_syntax_for_parameters, unnecessary_null_comparison

import 'package:astronacci_flutter/Api/api_user.dart'; 
import 'package:astronacci_flutter/Controller/listuser_controller.dart'; 
import 'package:astronacci_flutter/Helper/form_pencarian.dart';
import 'package:astronacci_flutter/Models/m_list_user.dart';
import 'package:astronacci_flutter/user_detail.dart'; 
import 'package:flutter/material.dart';
import 'package:get/get.dart'; 

class UserList extends StatelessWidget {

  final header;
  UserList({super.key, required this.header});


  final listController = Get.put(ListuserController());   
  final apiUser = ApiUser(); 
  
  
  @override 
  Widget build(BuildContext context) {
      return Column(
        children: [
          FormPencarian(),  
          Expanded( child: 
           GetBuilder<ListuserController>(  
              initState: (state) => Future.microtask(() =>   listController.getListuser(),) ,
              builder: (controller) { 
            
                if( controller.isLoading.value == true ){
                  return Center(child: CircularProgressIndicator(),);
                } 
             
                
                final data = controller.listDatauser;
                return (  data == null ) 
                  ? Center(child: CircularProgressIndicator(color: Colors.red,),) 
                  : (data!.isEmpty)  
                    ? Center(child: Text('Tidak ada data')) 
                    : Stack(
                      children: [ 
                        daftarUser( data, controller. scrollController ), 
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: double.infinity,
                            height: 2,
                            child: ( listController.isScrollingDown.value == true ) 
                                      ? LinearProgressIndicator(color: Colors.orange,) 
                                      : Center(child: Text('')),
                        )), 
                      ],
                    );
              },
            ),
          ),
        ],
      );
  }  

  Widget daftarUser(List<Datauser> data, ScrollController? scrollController ){
   return  ListView.builder(
            padding: EdgeInsets.all(10),
            // controller: scrollController,
            controller: (listController.statusAktif.value == 'all_user') ? scrollController : null,
            itemCount: data!.length,
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Card( 
                  child: ListTile( 
                    title: Text('${data?[i].name}', style: TextStyle(fontSize: 17),),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('${data?[i].email}', style: TextStyle(fontSize: 15),),
                        Text('${data?[i].createdAt}', style: TextStyle(fontSize: 15),),
                      ],
                    ),
                    trailing: IconButton(onPressed: ()=>Get.to(()=>UserDetail(data: data[i],)), icon: Icon(Icons.arrow_right_alt)),
                  ) ,
                ),
              );              
        });
  }

}