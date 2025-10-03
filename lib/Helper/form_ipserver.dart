
import 'package:astronacci_flutter/Controller/app_controller.dart';
import 'package:astronacci_flutter/Helper/helper_widget.dart'; 
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormIpserver  extends StatelessWidget {  
  FormIpserver({super.key});

  final appController = Get.put(AppController());  
 

  @override
  Widget build(BuildContext context) { 
    return Container( 
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft:Radius.circular(20), topRight: Radius.circular(20)),
                color: Colors.white
              ),
              padding : EdgeInsets.all(20),
              width: Get.width, 
              height: 200,
              child:  Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 7,
                        child: TextFormField( 
                                controller: appController.ipController,
                                keyboardType : TextInputType.number,
                                decoration: const InputDecoration( 
                                  labelText: 'IP Server',
                                  hintText:'Ex: 192.168.x.x',
                                  prefixIcon: Icon(Icons.wifi),
                                  border: OutlineInputBorder(),
                                ),  
                        ),
                      ),  
                      Flexible(
                        flex: 4,
                        child: TextFormField( 
                                  controller: appController.portController,
                                  keyboardType : TextInputType.number,
                                  decoration: const InputDecoration( 
                                    labelText: 'Port',
                                    hintText:'Ex: 8000', 
                                    border: OutlineInputBorder(),
                                  ),  
                          ),
                      ),
                    ],
                  ),
                  br(10),
                  SizedBox(
                      width: double.infinity,
                      height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink, 
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      onPressed: (){ 
                      appController.setIpServer( appController.ipController.text );
                      appController.setPortServer( appController.portController.text );
                      print('DON:: ${appController.ipController.text} : ${appController.portController.text}');
                      print('DON:: ${appController.ipServer.value} : ${appController.portServer.value}');
                      Get.back();
                    }, 
                    child: Text('Simpan IP & Port Server'),  
                    ),
                  )
                ],
              )
    );
  }
}