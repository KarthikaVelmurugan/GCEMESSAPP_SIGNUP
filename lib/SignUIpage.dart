import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:sample_app/messUIPage.dart';
import 'package:sample_app/gaurdianUIPage.dart';
class SignUIScreen extends StatefulWidget{
  @override
   _SignUIScreen createState() => _SignUIScreen();
}
class _SignUIScreen extends State<SignUIScreen>{
  bool _validateN = false;
  bool _validateD = false;
  bool _validateE = false;
  bool _validateM = false;
  bool _validateB = false;
  bool _validateAD = false;
  String name,dob,email,mobno,address,blood;
  String errMsgBlood='';

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

  //const bloodgroups = ['o+','A+','A-','B+','B-','AB+','AB-'];
  @override
  Widget build(BuildContext context) {


    Widget selectBlood(){
      return InputDecorator(
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color:Colors.deepPurple,width:3),
          )
        ),
        child: DropdownButtonHideUnderline(
          child:DropdownButton<String>(
            hint: Text('Your Blood Group',style: TextStyle(color:Colors.blueGrey),),
            value:currentSelectvalue,
            isDense: true,

            onChanged: (String newValue){

              setState(() {
                currentSelectvalue = newValue;
                _validateB = false;
              });
            },
            items: <String>[
              'o+','A+','A-','B+','B-','AB+','AB-','others'
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
            _validateN = false;
            name = value;

          }
          if(i==2)
            {
              _validateD = false;
              dob = value;
            }
          if(i==3){
            _validateE = false;
            email = value;

          }
          if(i==4){
            _validateM = false;
            mobno = value;
          }


          if(i==5){
            _validateAD = false;
            address = value;
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
                            'Personal Info',style:_style
                          ),
                        ),
                        SizedBox(
                          height:size.width/60,
                        ),
                        inputBox('Your Name','Name must contains Alphabets',1,_validateN,TextInputType.text,Icon(Icons.person,size:28,color:Colors.deepPurple)),
                          SizedBox(
                            height:size.width/60,
                          ),
                      inputBox('Your Date of Birth','Invalid Date of Birth',2,_validateB,TextInputType.datetime,Icon(Icons.calendar_today,size:28,color:Colors.deepPurple)),
                        SizedBox(
                          height:size.width/60,
                        ),
                        inputBox('Your Mail ID','Invalid Mail id',3,_validateE,TextInputType.emailAddress,Icon(Icons.email,size:28,color:Colors.deepPurple)),

                        SizedBox(
                          height:size.height/60,
                        ),
                       inputBox('Your Mobile Number','Mobile number must containe 10 digits',4,_validateM,TextInputType.phone,Icon(Icons.call,size:28,color:Colors.deepPurple)),
                         SizedBox(
                           height: size.width/60,
                         ),

                        selectBlood(),
                        Text(errMsgBlood),

                        SizedBox(
                          height: size.width/60,
                        ),
                       inputBox('Your Home Address','please enter your address',5,_validateAD,TextInputType.multiline,Icon(Icons.home,size:28,color:Colors.deepPurple)),
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
                                  if(name == null){
                                    _validateN = true;
                                    i=1;
                                  }
                                  if(dob == null){
                                    _validateD = true;
                                    i=2;
                                  }
                                  if(email == null){
                                    _validateE = true;
                                    i=3;
                                  }
                                  if(mobno == null || mobno.length !=10){
                                    _validateM = true;
                                    i=4;
                                  }
                                  if(address == null){
                                    _validateAD = true;
                                    i=5;

                                  }
                                  if(currentSelectvalue==null){
                                    errMsgBlood='must select any one type';
                                  }
                                  if(i==0){
                                    Navigator.push(context,MaterialPageRoute(builder:(context)=>GaurdianUIScreen()));
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