import 'package:flutter/material.dart';


 

 void main(){
  runApp(
    MaterialApp(
      home: MyLoginWidget()); 
    ); 
 }

 class MyLoginWiget extends StatefulWidget {
   const MyLoginWiget({Key? key}) : super(key: key);
 
   @override
   State<MyLoginWiget> createState() => _MyLoginWigetState();
 }
 
 class _MyLoginWigetState extends State<MyLoginWiget> {
   @override
   Widget build(BuildContext context) {
     return Container();
   }
 }