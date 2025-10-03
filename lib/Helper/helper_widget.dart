import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget br(double h ){
  return SizedBox(height: h,);
}
Widget spasi(double w){
  return SizedBox(width: w,);
}

void dialogError(String msg){
  Get.defaultDialog( 
    content: Container(
      child : Text(msg)
    )
  );
}