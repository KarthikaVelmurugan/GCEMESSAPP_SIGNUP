import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_app/messUIPage.dart';

class UIscreen extends StatefulWidget{
  _UIscreen createState()=>_UIscreen();

}
class _UIscreen extends State<UIscreen>{

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

  final PageController _controller=PageController(initialPage: 0);
  int _currentPage=0;



  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    double screenheight=size.height;
    double screenwidth=size.width;

    return Scaffold(
        body:AnnotatedRegion<SystemUiOverlayStyle>(
          value:SystemUiOverlayStyle.light,
          child: Container(

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
                    height:size.height/1.5,

                    alignment: Alignment.topCenter,
                    child:ClipPath(
                      child:Image.asset('image/clg.jpeg',width:size.width,height:size.height,fit:BoxFit.fill),
                    clipper: MyClipper(),

                    //Text('hii'),
                  ),
                  ),
                  Container(
                    child:Column(
                      children: <Widget>[
                        SizedBox(height:10.0),
                        Text('Goverment College Of Engineering - Thanjavur.'.toUpperCase(),style: _style,textAlign: TextAlign.center,),
                        SizedBox(height:10.0),
                        Text('Knowledge is Power',style:_subStyle),
                      ],
                    )
                  ),
                  SizedBox(height:20),
                  Container(

                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                        children:<Widget>[
                          FlatButton(
                      child:Text('Next',style:_style),
                      onPressed: (){
                        setState(() {
                          print("next is pressed");
                          Navigator.push(context,MaterialPageRoute(builder:(context)=>messUIScreen()));
                        });
                      },
                    ),
                  Icon(Icons.arrow_forward,color:Colors.white,size: 20.0,
                  )
                ],
              )
          ),

          ])

        )));}}



class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path= new Path();
    var firstcpoint= new Offset(size.width/4,size.height);
    var firstepoint= new Offset(size.width/2.25,size.height-30.0);
    var secondcpoint= new Offset(size.width-(size.width/3.25),size.height-65);
    var secondepoint= new Offset(size.width,size.height-40);
    path.lineTo(0.0, size.height-20);
    path.quadraticBezierTo(firstcpoint.dx,firstcpoint.dy ,firstepoint.dx ,firstepoint.dy );
    path.quadraticBezierTo(secondcpoint.dx, secondcpoint.dy, secondepoint.dx, secondepoint.dy);
    path.lineTo(size.width, size.width-30);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;

  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}