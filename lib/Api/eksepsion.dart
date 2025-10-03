// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables

import 'dart:async';
import 'dart:io';

import 'package:http/http.dart';

class Ekseption{
  final e;
  final msg;

  // Ekseption({required this.e, this.msg}); 
  // Ekseption({  this.e, this.msg}); 
  Ekseption({  this.e, this.msg}); 

    Object trow(){ 
          if ( e is FileSystemException ){
             print('DON:: Eksepsion e is  FileSystemException');
             throw  FileSystemException(e.message);  
          }
          if ( e is CertificateException ){
             print('DON:: Eksepsion e is  CertificateException');
             throw  CertificateException(e.message);  
          }
          if ( e is StdoutException ){
             print('DON:: Eksepsion Ekseption is  StdoutException');
             throw  StdoutException(e.message);  
          }
          if ( e is StdinException ){
             print('DON:: Eksepsion Ekseption is  StdinException');
             throw  StdinException(e.message);  
          }
          if ( e is ClientException ){
             print('DON:: Eksepsion Ekseption is  ClientException');
             throw  ClientException(e.message);  
          }
          if ( e is TimeoutException){
             print('DON:: Eksepsion Ekseption is  TimeoutException');
             throw  TimeoutException(e.message);  
          }
          if ( e is SocketException){
             print('DON:: Eksepsion Ekseption is  SocketException');
             throw  SocketException(e.message);  
          } 
          if ( e is HttpException){
             print('DON:: Eksepsion Ekseption is  HttpException');
             throw  HttpException(e.message);  
          }
          if ( e is HandshakeException ){
             print('DON:: Eksepsion Ekseption is  HandshakeException');
             throw  HandshakeException(e.message);
          }
          if ( e is TlsException ){
             print('DON:: Eksepsion Ekseption is  TlsException');
             throw  TlsException(e.message);
          }
          else{ 
             print('DON:: Eksepsion Ekseption else $e');
            throw  Exception("$msg,\nSilahkan coba lagi");
            // throw  Exception(e.toString());
          }
    }
  
}