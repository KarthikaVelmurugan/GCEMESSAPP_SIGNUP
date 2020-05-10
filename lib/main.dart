import 'package:flutter/material.dart';
import 'package:sample_app/nextPage.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GCE -TJ -MESS FEE App',

      home:UIscreen(),
    );
  }

}