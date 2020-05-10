import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:sample_app/hostelUIPage.dart';

class CollegeUIScreen extends StatefulWidget{
  @override
  _CollegeUIScreen createState() => _CollegeUIScreen();
}
class _CollegeUIScreen extends State<CollegeUIScreen>{
  bool _validateREG = false;
  bool _validateROLL = false;
  bool _validateBATCH = false;
  bool _validateBRANCH = false;
  String regno,rollno,batch,branch;
  String errMsgbatch='';
  String errMsgbranch='';

  final _btnstyle = TextStyle(
    color:Colors.deepPurple,
    fontSize: 20,

    fontWeight: FontWeight.bold,
  );



  final _style = TextStyle(
    color:Colors.deepPurple,
    fontSize: 24,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold,
  );
  var currentSelectvalue;
  var currentSelectvalue1;

  //const bloodgroups = ['o+','A+','A-','B+','B-','AB+','AB-'];
  @override
  Widget build(BuildContext context) {


    Widget selectBatch(){
      return InputDecorator(
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color:Colors.deepPurple,width:3),
            )
        ),
        child: DropdownButtonHideUnderline(
            child:DropdownButton<String>(
              hint: Text('Select Your Batch',style: TextStyle(color:Colors.blueGrey),),
              value:currentSelectvalue,
              isDense: true,

              onChanged: (String newValue){

                setState(() {
                  currentSelectvalue = newValue;
                  _validateBATCH = false;
                });
              },
              items: <String>[
                '2016 - 2020','2017 - 2021','2018 - 2022','2019 - 2023','2020 - 2024','2021 - 2025'
              ].map<DropdownMenuItem<String>>((String value){

                return DropdownMenuItem<String>(
                  value:value,
                  child: Text(value),
                );


              }).toList(),
            )
        ),


      );

    }
    Widget selectBranch(){
      return InputDecorator(
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color:Colors.deepPurple,width:3),
            )
        ),
        child: DropdownButtonHideUnderline(
            child:DropdownButton<String>(
              hint: Text('Select Your Branch',style: TextStyle(color:Colors.blueGrey),),
              value:currentSelectvalue1,
              isDense: true,

              onChanged: (String newValue){

                setState(() {
                  currentSelectvalue1 = newValue;
                  _validateBRANCH = false;
                });
              },
              items: <String>[
                'CSE','ECE','EEE','MECH','CIVIL'
              ].map<DropdownMenuItem<String>>((String value){

                return DropdownMenuItem<String>(
                  value:value,
                  child: Text(value),
                );


              }).toList(),
            )
        ),


      );

    }




    Widget inputBox(
        String label,String errMsg, int i, bool validate, TextInputType t,Icon icon){
      return TextFormField(
        keyboardType: t,
        autofocus: false,

        decoration: InputDecoration(


          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color:Colors.deepPurple,width: 3)
          ),
          errorText: validate ? errMsg : null,
          errorStyle:TextStyle(color:Colors.deepPurple,),
          labelText: label,
          labelStyle:TextStyle(color: Colors.blueGrey) ,
          prefixIcon:icon,


          hasFloatingPlaceholder: true,
        ),
        cursorColor: Colors.purple,
        showCursor: true,
        autocorrect: true,

        onChanged: (value){
          if(i==1){
            _validateREG = false;
            regno= value;

          }
          if(i==2)
          {
            _validateROLL = false;
            rollno = value;
          }





        },

      );
    }


    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child:Container(

              decoration: BoxDecoration(
                  gradient:LinearGradient(
                    colors:[
                      Colors.deepPurple[500],
                      Colors.deepPurple[700],
                      Colors.deepPurple[900],
                      Colors.deepPurple[900],
                    ],
                    begin: Alignment.topCenter,
                    end:Alignment.bottomCenter,
                    stops: [0.1,0.5,0.7,0.9],
                  )
              ),
              child:Column(

                  children:<Widget>[


                    Container(


                        margin: EdgeInsets.only(left:10,right:10,top:40,bottom:10),


                        child: Card(
                            shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),

                            ),
                            elevation: 8,


                            child:Padding(
                                padding:const EdgeInsets.all(30.0),


                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[

                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                            'College Info',style:_style
                                        ),
                                      ),
                                      SizedBox(
                                        height:size.width/60,
                                      ),
                                      inputBox('Your Register Number','Regno. must Contains 12 digits',1,_validateREG,TextInputType.number,Icon(Icons.account_balance,size:28,color:Colors.deepPurple)),
                                      SizedBox(
                                        height:size.width/60,
                                      ),
                                      inputBox('your Roll Number','Invalid Roll Number',2,_validateROLL,TextInputType.text,Icon(Icons.confirmation_number,size:28,color:Colors.deepPurple)),
                                      SizedBox(
                                        height:size.width/60,
                                      ),



                                      selectBatch(),
                                      Text(errMsgbatch),
                                      selectBranch(),
                                      Text(errMsgbranch),


                                      SizedBox(
                                        height: size.width/40,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          FlatButton(
                                            child:Text('next',style: _btnstyle),
                                            onPressed: (){
                                              setState(() {
                                                var i=0;
                                                if(regno == null || regno.length !=12){
                                                  _validateREG = true;
                                                  i=1;
                                                }

                                                if(rollno == null){
                                                  _validateROLL= true;
                                                  i=2;
                                                }

                                                if(i==0){
                                                  Navigator.push(context,MaterialPageRoute(builder:(context)=>HostelUIScreen()));
                                                }



                                              });
                                            },
                                          ),
                                          Icon(Icons.arrow_forward,color:Colors.deepPurple,size:28)

                                        ],
                                      )




                                    ]
                                )

                            )
                        )  )]
              )

          )



      ) ,
    );











  }
}