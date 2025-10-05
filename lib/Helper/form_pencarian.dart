
// ignore_for_file: avoid_print

import 'package:astronacci_flutter/Controller/app_controller.dart';
import 'package:astronacci_flutter/Controller/listuser_controller.dart'; 
import 'package:astronacci_flutter/Helper/helper_widget.dart'; 
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormPencarian  extends StatelessWidget {  
  FormPencarian({super.key});

  final appController = Get.put(AppController());   
  final cariController = Get.put(ListuserController());
 

  @override
  Widget build(BuildContext context) { 
    return Container( 
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft:Radius.circular(20), topRight: Radius.circular(20)),
                color: Colors.white
              ),
              padding : EdgeInsets.all(20),
              width: Get.width, 
              // height: 200,
              child:  Row(
                    children: [
                      Flexible(
                        flex: 5,
                        child: TextFormField( 
                                controller: cariController.textCari, 
                                decoration: const InputDecoration(  
                                  // labelText: 'IP Server',
                                  hintText:'Cari ...',
                                  prefixIcon: Icon(Icons.person_2_outlined), 
                                  border: OutlineInputBorder(),
                                ),  
                        ),
                      ),  
                      spasi(5),
                      Flexible(
                        // flex: 4,
                        child:Obx( () =>
                              SizedBox( 
                                height: 65,
                                child: (cariController.statusAktif.value == 'all_user') ? ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.pink,  
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ), 
                                    onPressed : (){
                                      print('DON:: BTN Cari');
                                      cariController.getPencarian();
                                    },
                                  child: Icon(Icons.search, color:Colors.white, size: 30,),  
                                )
                                : ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey,  
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ), 
                                    onPressed : (){ 
                                      cariController.getListuser();
                                    },
                                  child: Icon(Icons.close, color:Colors.white, size: 30,),  
                                ),
                              ),
                        )
                      ),
                    ],
                  ), 
    );
  }
}