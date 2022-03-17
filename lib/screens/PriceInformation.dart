import 'package:e_bill/models/high_voltage_model.dart';
import 'package:e_bill/models/low_voltage_model.dart';
import 'package:e_bill/models/middle_voltage_model.dart';
import 'package:e_bill/screens/high_voltage_screen.dart';
import 'package:e_bill/screens/low_voltage_screen.dart';
import 'package:e_bill/screens/middle_voltage_screen.dart';
import 'package:e_bill/utilities/AppTheme.dart';
import 'package:e_bill/utilities/NavBar.dart';
import 'package:flutter/material.dart';

class PriceInformation extends StatefulWidget {
  @override
  _PriceInformationState createState() => _PriceInformationState();
}

class _PriceInformationState extends State<PriceInformation> {
  LowVoltageModel lowPowerModel = LowVoltageModel(1,1);
  MiddleVoltageModel middlPowerModel = MiddleVoltageModel(1);
  HighVoltageModel highPowerModel = HighVoltageModel(1,1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: NavBar(),
      appBar: getAppBar(),
      backgroundColor: Colors.green,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: RichText(
              textDirection: TextDirection.rtl,
              text: TextSpan(
                text:'معلومات حول التعرفة',
                style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),),
          ),
          ListView(
          children: <Widget>[
            SizedBox(height: 50),
            Container(
              height: MediaQuery.of(context).size.height - 140,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(75))
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ListView(
                  children: [
                    RichText(
                        textDirection: TextDirection.rtl,
                        text: TextSpan(
                      children: [
                        TextSpan(text: 'التوتر العالي 20 ك ف:',style: AppTheme.heading),
                        TextSpan(text: '\n'),
                        getPrice(HighVoltageModel.investigationTypeList[0],HighVoltageModel.metalmelting_20),
                        getPrice(HighVoltageModel.investigationTypeList[1],HighVoltageModel.other20),
                      ]
                    )),
                    ListTile(
                      leading: Icon(Icons.arrow_back),
                      title: Text('انفر هنا لحساب الفاتورة',style: AppTheme.taphere,),
                      onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return HighVoltage('assets/images/img (3).png', 'توتر 20 ك ف', 'عدادات المخارج الخاصة',highPowerModel);
                          }));
                      },
                    ),
                    Divider(),
                    RichText(
                        textDirection: TextDirection.rtl,
                        text: TextSpan(
                            children: [
                             TextSpan(text: 'التوتر المتوسط 20/0.4 ك ف:',style: AppTheme.heading),
                              TextSpan(text: '\n'),
                              getPrice(MiddleVoltageModel.investigationTypeList[0],MiddleVoltageModel.commercial20_04),
                              getPrice(MiddleVoltageModel.investigationTypeList[1],MiddleVoltageModel.industrial20_04),
                              getPrice(MiddleVoltageModel.investigationTypeList[2],MiddleVoltageModel.agronomic_20_04),
                              getPrice(MiddleVoltageModel.investigationTypeList[3],MiddleVoltageModel.formalsections_20_04),
                              getPrice(MiddleVoltageModel.investigationTypeList[4],MiddleVoltageModel.charity_20_04),
                              getPrice(MiddleVoltageModel.investigationTypeList[5],MiddleVoltageModel.holyplace_20_04),
                              getPrice(MiddleVoltageModel.investigationTypeList[6],MiddleVoltageModel.publiclighting_20_04),
                              getPrice(MiddleVoltageModel.investigationTypeList[7],MiddleVoltageModel.lightingadvirtising_20_04),
                              getPrice(MiddleVoltageModel.investigationTypeList[8],MiddleVoltageModel.drinkWater_20_04),
                            ]
                        )),
                    ListTile(
                      leading: Icon(Icons.arrow_back),
                      title: Text('انفر هنا لحساب الفاتورة',style: AppTheme.taphere,),
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return MiddleVoltage('assets/images/img (2).png','توتر 0.4/20 ك ف', 'عدادات المراكز الخاصة',middlPowerModel);
                            }));
                      },
                    ),
                    Divider(),
                    RichText(
                        textDirection: TextDirection.rtl,
                        text: TextSpan(
                            children: [
                              TextSpan(text: 'التوتر المنخفض 0.4 ك ف:',style: AppTheme.heading),
                              TextSpan(text: '\n'),
                              /*['منزلي','تجاري','صناعي','زراعي','دوائر رسمية','جمعيات خيرية','دور عبادة','إنارة عامة','لوحات إعلانية'];*/
                              showLowVoltagePrice(LowVoltageModel.investigationTypeList[1], LowVoltageModel.commercial_04),
                              showLowVoltagePrice(LowVoltageModel.investigationTypeList[2], LowVoltageModel.industrial_04),
                              showLowVoltagePrice(LowVoltageModel.investigationTypeList[3], LowVoltageModel.agronomic_04),
                              showLowVoltagePrice(LowVoltageModel.investigationTypeList[4], LowVoltageModel.formalsections_04),
                              showLowVoltagePrice(LowVoltageModel.investigationTypeList[5], LowVoltageModel.charity_04),
                              showLowVoltagePrice(LowVoltageModel.investigationTypeList[6], LowVoltageModel.holyplace_04),
                              showLowVoltagePrice(LowVoltageModel.investigationTypeList[7], LowVoltageModel.publiclighting_04),
                              showLowVoltagePrice(LowVoltageModel.investigationTypeList[8], LowVoltageModel.lightingadvirtising_04),
                              showdomesticPrice(LowVoltageModel.domestic)
                            ]
                        )),
                    ListTile(
                      leading: Icon(Icons.arrow_back),
                      title: Text('انفر هنا لحساب الفاتورة',style: AppTheme.taphere,),
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return LowVoltage('assets/images/img (1).png', 'التوتر المنخفض', 'العداد الأحادي ,الثلاثي',lowPowerModel);
                            }));
                      },
                    ),
                    ],
                )
              ),
            ),
          ],
        )],
      ),
    );
  }
  TextSpan getPrice(String investigationType,List<int> price){
    return TextSpan(
          children: [
            TextSpan(text: ' تعرفة $investigationType ',style: AppTheme.subHeading),
            TextSpan(text: '\n'),
            TextSpan(text: 'النهار: كل 1 ك.و.س بسعر ',style: AppTheme.display4),
            TextSpan(text: price[0].toString(),style: AppTheme.display5),
            TextSpan(text: ' ل.س',style: AppTheme.display4),
            TextSpan(text: '\n'),
            TextSpan(text: 'الذروة: كل 1 ك.و.س بسعر ',style: AppTheme.display4),
            TextSpan(text: price[1].toString(),style: AppTheme.display5),
            TextSpan(text: ' ل.س',style: AppTheme.display4),
            TextSpan(text: '\n'),
            TextSpan(text: 'الليل: كل 1 ك.و.س بسعر ',style: AppTheme.display4),
            TextSpan(text: price[2].toString(),style:  AppTheme.display5),
            TextSpan(text: ' ل.س',style: AppTheme.display4),
            TextSpan(text: '\n'),
          ]
      );
  }
  TextSpan showLowVoltagePrice(String investigationType , int price){
    return TextSpan(
        children: [
    TextSpan(text: ' تعرفة $investigationType ',style: AppTheme.subHeading),
    TextSpan(text: '\n'),
    TextSpan(text: '- كل 1 ك.و.س بسعر ',style: AppTheme.display4),
    TextSpan(text: price.toString(),style: AppTheme.display5),
    TextSpan(text: ' ل.س',style: AppTheme.display4),
    TextSpan(text: '\n'),
    ]
    );
  }
  TextSpan showdomesticPrice(List<int> domestic){
    return TextSpan(
        children: [
        TextSpan(text: ' تعرفة المنزلي ',style: AppTheme.subHeading),
        TextSpan(text: '\n'),
        TextSpan(text: '- الاستهلاك من 1 ك.و.س حتى 600 ك.و.س بسعر ',style: AppTheme.display4),
        TextSpan(text: domestic[0].toString(),style: AppTheme.display5),
        TextSpan(text: ' ل.س',style: AppTheme.display4),
        TextSpan(text: '\n'),
          TextSpan(text: '- الاستهلاك من 601 ك.و.س حتى 1000 ك.و.س بسعر ',style: AppTheme.display4),
          TextSpan(text: domestic[1].toString(),style: AppTheme.display5),
          TextSpan(text: ' ل.س',style: AppTheme.display4),
          TextSpan(text: '\n'),
          TextSpan(text: '- الاستهلاك من 1001 ك.و.س حتى 1500 ك.و.س بسعر ',style: AppTheme.display4),
          TextSpan(text: domestic[2].toString(),style: AppTheme.display5),
          TextSpan(text: ' ل.س',style: AppTheme.display4),
          TextSpan(text: '\n'),
          TextSpan(text: '- الاستهلاك من 1501 ك.و.س حتى 2500 ك.و.س بسعر ',style: AppTheme.display4),
          TextSpan(text: domestic[3].toString(),style: AppTheme.display5),
          TextSpan(text: ' ل.س',style: AppTheme.display4),
          TextSpan(text: '\n'),
          TextSpan(text: '- الاستهلاك من 2501 ك.و.س وما فوق بسعر ',style: AppTheme.display4),
          TextSpan(text: domestic[4].toString(),style: AppTheme.display5),
          TextSpan(text: ' ل.س',style: AppTheme.display4),
          TextSpan(text: '\n'),
    ]
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

