import 'dart:io';

import 'package:e_bill/screens/CallUs.dart';
import 'package:e_bill/screens/PriceInformation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../main.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('الشركة العامة لكهرباء محافظة حلب',textDirection: TextDirection.rtl,),
              accountEmail: Text('AlepElec'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: Image.asset('assets/images/logo.png',
                    width: 90,
                    height: 90,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('الرئيسية'),
              onTap: (){Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MyHomePage()));},
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('حول التعرفات'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PriceInformation()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('الاشعارات'),
              trailing: Container(width: 20,height: 20,color: Colors.red,
                child: Center(
                  child: Text('8',style: TextStyle(fontSize: 15, color: Colors.white),),
                ),),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.call),
              title: Text('اتصل بنا'),
              onTap: (){Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CallUs()));},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('الاعدادات'),
              onTap: (){},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('خروج'),
              onTap: (){if (Platform.isAndroid) {
                SystemNavigator.pop();
              } else if (Platform.isIOS) {
                exit(0);
              }},
            )
          ],
        ),
      ),
    );
  }
}
