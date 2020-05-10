import 'package:flutter/material.dart';
import 'package:sample_app/nextPage.dart';
import 'package:sample_app/SignUIpage.dart';
class messUIScreen extends StatefulWidget{
  @override

  _messUIScreen createState()=>_messUIScreen();
}
class _messUIScreen extends State<messUIScreen>{
  final _style = TextStyle(
    fontSize:18.0,
    fontFamily:'CM Sans Serif',
    fontWeight: FontWeight.w500,
    color:Colors.white,
  );
  final _subStyle = TextStyle(
    color:Colors.white70,
    fontStyle: FontStyle.italic,
    fontSize:15.0,
    fontFamily: 'CM Sans Serif',

  );

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
        body:Container(

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
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: <Widget>[
                  Container(
                    height:size.height/1.75,

                    alignment: Alignment.topCenter,

                      child:Image.asset('image/messUI.png',width:size.width,height:size.height,fit:BoxFit.fill),


                      //Text('hii'),
                    ),
                  SizedBox(height:20),

                  Container(
                      child:Column(
                        children: <Widget>[
                          SizedBox(height:20.0),
                          Text('Food is not Just Eating Energy, It is an Experience!!',style: _style,textAlign: TextAlign.center,),
                          SizedBox(height:20.0),
                          Text('Life is a combination of Magic and Pasta',style:_subStyle),
                        ],
                      )
                  ),
                  SizedBox(height:40),
                  Container(
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                      Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                        children:<Widget>[
                          Icon(Icons.arrow_back,color:Colors.white,size: 20.0),
                          FlatButton(
                            child:Text('Back',style:_style),
                            onPressed: (){
                              setState(() {
                                print("back is pressed");
                                Navigator.push(context,MaterialPageRoute(builder:(context)=>UIscreen()));
                              });
                            },
                          ),


                        ],
                      ),

                        Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children:<Widget>[

                          FlatButton(
                            child:Text('Next',style:_style),
                            onPressed: (){
                              setState(() {
                                print("next is pressed");
                                Navigator.push(context,MaterialPageRoute(builder:(context)=>SignUIScreen()));
                              });
                            },
                          ),
                          Icon(Icons.arrow_forward,color:Colors.white,size: 20.0,
                          )
                        ],
                      )
                 ] ),

                  ) ])

        ));}}





