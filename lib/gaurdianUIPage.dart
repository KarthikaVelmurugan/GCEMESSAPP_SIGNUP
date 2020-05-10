import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:sample_app/collegeUIPage.dart';

class GaurdianUIScreen extends StatefulWidget{
  @override
  _GaurdianUIScreen createState() => _GaurdianUIScreen();
}
class _GaurdianUIScreen extends State<GaurdianUIScreen>{
  bool _validateGN = false;
  bool _validateGM = false;
  bool _validateR = false;
  bool _validateGAD = false;
  String gname,gmobno,relation,gaddress;
  String errMsgBloodRalation='';

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


    Widget selectBloodRelation(){
      return InputDecorator(
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color:Colors.deepPurple,width:3),
            )
        ),
        child: DropdownButtonHideUnderline(
            child:DropdownButton<String>(
              hint: Text('Your RelationShip',style: TextStyle(color:Colors.blueGrey),),
              value:currentSelectvalue,
              isDense: true,

              onChanged: (String newValue){

                setState(() {
                  currentSelectvalue = newValue;
                  _validateR = false;
                });
              },
              items: <String>[
                'Father','Mother','relative','others'
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
            _validateGN = false;
            gname = value;

          }
          if(i==2)
          {
            _validateGM = false;
            gmobno = value;
          }
          if(i==3){
            _validateGAD= false;
             gaddress= value;

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
                                            'Gaurdian Info',style:_style
                                        ),
                                      ),
                                      SizedBox(
                                        height:size.width/60,
                                      ),
                                      inputBox('Gaurdian Name','Name must contains Letters',1,_validateGN,TextInputType.text,Icon(Icons.person,size:28,color:Colors.deepPurple)),
                                      SizedBox(
                                        height:size.width/60,
                                      ),
                                      inputBox('Gaurdian MobileNumber','Invalid Mobile Number',2,_validateGN,TextInputType.number,Icon(Icons.call,size:28,color:Colors.deepPurple)),
                                      SizedBox(
                                        height:size.width/60,
                                      ),



                                      selectBloodRelation(),
                                      Text(errMsgBloodRalation),

                                      SizedBox(
                                        height: size.width/60,
                                      ),
                                      inputBox('Gaurdian Home Address','please enter your address',3,_validateGAD,TextInputType.multiline,Icon(Icons.home,size:28,color:Colors.deepPurple)),
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
                                                if(gname == null){
                                                  _validateGN = true;
                                                  i=1;
                                                }

                                                if(gmobno == null || gmobno.length !=10){
                                                  _validateGM = true;
                                                  i=2;
                                                }
                                                if(gaddress == null){
                                                  _validateGAD = true;
                                                  i=3;

                                                }
                                                if(currentSelectvalue==null){
                                                  errMsgBloodRalation='must select any one type';
                                                }
                                                if(i==0){
                                                  Navigator.push(context,MaterialPageRoute(builder:(context)=>CollegeUIScreen()));
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