import 'package:e_bill/screens/splash_screen.dart';
import 'package:e_bill/utilities/NavBar.dart';
import 'screens/middle_voltage_screen.dart';
import 'screens/high_voltage_screen.dart';
import 'screens/low_voltage_screen.dart';
import 'models/low_voltage_model.dart';
import 'models/high_voltage_model.dart';
import 'models/middle_voltage_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Electricity Bill Calculation',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashScreen()
      //MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  LowVoltageModel lowPowerModel = LowVoltageModel(1,1);
  MiddleVoltageModel middlPowerModel = MiddleVoltageModel(1);
  HighVoltageModel highPowerModel = HighVoltageModel(1,1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: NavBar(),
      appBar: getAppBar(),
      backgroundColor: Colors.green,
      body: ListView(
        children: <Widget>[
          SizedBox(height: 50,),
          Container(
            height: MediaQuery.of(context).size.height - 185,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(75))
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25, right: 25),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 45),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 250,
                    child: ListView(
                      children: <Widget>[
                        _buildVlotageItem(
                            'assets/images/img (1).png', 'التوتر المنخفض', 'العداد الأحادي ,الثلاثي'),
                        _buildVlotageItem(
                            'assets/images/img (2).png', 'توتر 0.4/20 ك ف', 'عدادات المراكز الخاصة'),
                        _buildVlotageItem(
                            'assets/images/img (3).png', 'توتر 20 ك ف', 'عدادات المخارج الخاصة'),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: CircleAvatar(
                            radius: 150,
                            backgroundColor: Colors.white,
                            child: ClipOval(
                              child: Image(
                                image: AssetImage('assets/images/splash.gif'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget _buildVlotageItem(String imgPath, String voltageType, String description) {
    return Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                   if(voltageType == 'التوتر المنخفض') return LowVoltage(imgPath, voltageType, description,lowPowerModel);
                   else if(voltageType == 'توتر 0.4/20 ك ف')  return MiddleVoltage(imgPath, voltageType, description,middlPowerModel);
                   else return HighVoltage(imgPath, voltageType, description,highPowerModel);
                }
            ));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            textDirection: TextDirection.rtl,
            children: <Widget>[
              Container(
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: <Widget>[
                    Hero(
                        tag: imgPath,
                        child: Image(
                          image: AssetImage(imgPath),
                          fit: BoxFit.cover,
                          height: 75,
                          width: 75,
                        )
                    ),
                    SizedBox(width: 10,),
                    Column(
                      textDirection: TextDirection.rtl,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(voltageType,
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(description,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              IconButton(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LowVoltage(imgPath, voltageType, description,lowPowerModel)
                ));
              },
                icon: Icon(Icons.calculate),
                color: Colors.black,
              )
            ],
          ),
        )
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
