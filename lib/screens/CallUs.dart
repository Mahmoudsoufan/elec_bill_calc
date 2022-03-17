import 'package:e_bill/utilities/NavBar.dart';
import 'package:flutter/material.dart';

import '../utilities/AppTheme.dart';

class CallUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: NavBar(),
      appBar: getAppBar(),
      backgroundColor: Colors.green,
      body: Stack(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(top: 10,bottom: 10),
            child: Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                radius: 75,
                backgroundColor: Colors.white,

                child: ClipOval(
                  child: Image.asset('assets/images/me.jpg',
                    width: 150,
                    fit: BoxFit.fill,
                    height: 150,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Align(
              alignment: Alignment.center,
              child: ListView(
                children: <Widget>[

                  SizedBox(height: 205),
                  Container(
                    height: MediaQuery.of(context).size.height - 140,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(75))
                    ),
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                        child: ListView(
                          children: [
                            ListTile(
                              leading:Icon(Icons.account_circle_outlined),
                              title: Text('Eng.Mahmoud Soufan',style: AppTheme.display3,),
                            ),
                            ListTile(
                              leading:Icon(Icons.call),
                              title: Text('+963993879192',style: AppTheme.display3,),
                            ),
                            ListTile(
                              leading:Icon(Icons.mail),
                              title: Text('Mahmoud.Soufan313@gmail.com',style: AppTheme.display3,),
                            ),
                          ],
                        )
                    ),
                  ),
                ],
              ),
            ),
          )],
      ),
    );
  }
  AppBar getAppBar(){
    return AppBar( title: Center (child:  Padding(
      padding: EdgeInsets.only(left: 40),
      child: Row(
        children: <Widget>[
          RichText(text: TextSpan(
              children:[
                TextSpan(text: 'B',style: TextStyle(
                    color: Colors.white,
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
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'AkayaTelivigala'
                )),
                TextSpan(text: 'alculation',  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: ''
                ))
              ]
          )
          ),
        ],
      ),
    ),));
  }
}
