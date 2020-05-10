import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:sample_app/finalUIPage.dart';

class HostelUIScreen extends StatefulWidget{
  @override
  _HostelUIScreen createState() => _HostelUIScreen();
}
class _HostelUIScreen extends State<HostelUIScreen>{
  bool _validateHN = false;
  bool _validateROOMNO = false;
  bool _validateHD = false;

  String hname,roomno,joindate;

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

  @override
  Widget build(BuildContext context) {


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
            _validateHN = false;
            hname = value;

          }
          if(i==2)
          {
            _validateROOMNO = false;
            roomno= value;
          }
          if(i==3){
            _validateHD= false;
            joindate= value;

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
                                            'Hostel Info',style:_style
                                        ),
                                      ),
                                      SizedBox(
                                        height:size.width/60,
                                      ),
                                      inputBox('Hostel Name','Name must contains Letters',1,_validateHN,TextInputType.text,Icon(Icons.home,size:28,color:Colors.deepPurple)),
                                      SizedBox(
                                        height:size.width/60,
                                      ),
                                      inputBox('Your Room Number','Invalid  Number',2,_validateROOMNO,TextInputType.number,Icon(Icons.confirmation_number,size:28,color:Colors.deepPurple)),
                                      SizedBox(
                                        height:size.width/60,
                                      ),





                                      SizedBox(
                                        height: size.width/60,
                                      ),
                                      inputBox('Join Date','please enter your joining date',3,_validateHD,TextInputType.datetime,Icon(Icons.calendar_today,size:28,color:Colors.deepPurple)),
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
                                                if(hname == null){
                                                  _validateHN = true;
                                                  i=1;
                                                }

                                                if(roomno == null){
                                                  _validateROOMNO = true;
                                                  i=2;
                                                }
                                                if(joindate == null){
                                                  _validateHD= true;
                                                  i=3;

                                                }

                                                if(i==0){
                                                  Navigator.push(context,MaterialPageRoute(builder:(context)=>FinalUIScreen()));
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