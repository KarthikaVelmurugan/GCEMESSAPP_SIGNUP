import 'package:flutter/material.dart';
class FinalUIScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      body: Container(
        height:size.height,
        color:Colors.deepPurple,

      )
    );
  }
  }
