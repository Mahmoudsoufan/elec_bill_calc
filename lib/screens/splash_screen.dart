import 'dart:async';
import 'package:flutter/material.dart';
import '../main.dart';




class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(decoration: BoxDecoration(color: Colors.orange),),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 2,
                  child:Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50,
                          child: Icon(
                            Icons.calculate_outlined,
                            color: Colors.green,
                            size: 60,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 10)),
                        RichText(text: TextSpan(
    children:[
    TextSpan(text: 'B',style: TextStyle(
    color: Colors.green,
    fontSize: 50,
    fontWeight: FontWeight.bold,
    fontFamily: 'AkayaTelivigala'
    )),
    TextSpan(text: 'ill',style: TextStyle(
    color: Colors.white,
    fontSize: 25,
    fontWeight: FontWeight.bold,
    fontFamily: ''
    )),
    TextSpan(text: 'C',style: TextStyle(
    color: Colors.green,
    fontSize: 40,
    fontWeight: FontWeight.bold,
    fontFamily: 'AkayaTelivigala'
    )),
    TextSpan(text: 'alculation',  style: TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontFamily: ''
    ))
    ]        ))],
                    ),
                  )
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      Padding(padding: EdgeInsets.only(),)
                    ],
                  )
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MyHomePage())));
  }

}
