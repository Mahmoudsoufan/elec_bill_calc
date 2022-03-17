import 'package:flutter/material.dart';
import '../models/middle_voltage_model.dart';
import 'dart:math';

class MiddleVoltage extends StatefulWidget{
  final heroTag;
  final voltageType;
  final description;
  final MiddleVoltageModel middleVoltageModel;
  MiddleVoltage(this.heroTag, this.voltageType, this.description,this.middleVoltageModel);

  @override
  _MiddleVoltageState createState() => _MiddleVoltageState(middleVoltageModel);
}

class _MiddleVoltageState extends State<MiddleVoltage>{
  int  compensationval = 0;//قيمة التعويض
  int  revFee = 0;//رسوم ردية
  int  consumptionval = 0;//قيمة الحسم
  int consValue = 0;
  int consum = 0;
  int countSlice=1;
  int feeValue  = 0 ;//قيمة الرسوم
  int counterRent = 0;//أجرة العداد
  int allvalprice =0;
  String finalValue ='';
  double capacityFactor=0;
  bool showdetails =false;
  List<int> conActive = [0,0,0];
  List<int> conRev = [0,0,0];
  MiddleVoltageModel middleVoltageModel;
  _MiddleVoltageState(this.middleVoltageModel);
  var _investigationType = MiddleVoltageModel.investigationTypeList;
  TextEditingController consActDayController = TextEditingController();
  TextEditingController consActTopController = TextEditingController();
  TextEditingController consActNightController = TextEditingController();
  TextEditingController consRevDayController = TextEditingController();
  TextEditingController consRevTopController = TextEditingController();
  TextEditingController consRevNightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    TextStyle? textStyle  = Theme.of(context).textTheme.subtitle1;
    consActDayController.text ;
    consActTopController.text ;
    consActNightController.text ;
    consRevDayController.text ;
    consRevTopController.text ;
    consRevNightController.text ;
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('حساب الفاتورة',
          textDirection: TextDirection.rtl,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ),
        centerTitle: true,
        actions:<Widget> [
          IconButton(
            icon: Icon(Icons.more_horiz),
            color: Colors.white,
            onPressed: (){},
          ),
        ],
      ),
      body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 75),
              child: Container(
                height: MediaQuery.of(context).size.height-100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(45),topLeft:Radius.circular(45) )
                ),
                child: Stack(
                    children:<Widget> [
                      Padding(
                        padding: EdgeInsets.only(top: 100,left:25,right: 25),
                        child: SingleChildScrollView(
                          child: Column(
                            textDirection: TextDirection.rtl,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:<Widget> [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: ListTile(
                                      title: DropdownButton(
                                        items: _investigationType.map((String val){
                                          return DropdownMenuItem<String>(
                                            value:val,
                                            child: Text(val,style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.pinkAccent
                                            )),
                                          );
                                        }).toList(),
                                        style: textStyle,
                                        value: getInvestigationType(middleVoltageModel.investigationType),
                                        onChanged: (selectedItem) {
                                          setState(() {
                                            setInvestigationType(selectedItem.toString());
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:<Widget> [
                                  Expanded(
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      textDirection: TextDirection.rtl,
                                      controller: consRevDayController,
                                      style: textStyle,
                                      onEditingComplete: (){
                                        consRevDayController.text = conRev[0].toString();
                                        FocusScope.of(context).unfocus();
                                      },
                                      onChanged: (value){
                                        try{
                                          conRev[0] = int.parse(value);
                                        }catch(Exception)
                                        {
                                          
                                        }
                                      },
                                      decoration: InputDecoration(
                                          hintTextDirection: TextDirection.rtl,
                                          labelText: "ردي نهار",
                                          labelStyle: textStyle,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                          )
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  Expanded(
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      textDirection: TextDirection.rtl,
                                      controller: consActDayController,
                                      style: textStyle,
                                      onEditingComplete: (){
                                        consActDayController.text = conActive[0].toString();
                                        FocusScope.of(context).unfocus();
                                      },
                                      onChanged: (value){
                                        try{
                                          conActive[0] = int.parse(value);
                                        }catch(Exception)
                                        {
                                          
                                        }
                                      },
                                      decoration: InputDecoration(
                                          hintTextDirection: TextDirection.rtl,
                                          labelText: "فعلي نهار",
                                          labelStyle: textStyle,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                          )
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:<Widget> [
                                  Expanded(
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      textDirection: TextDirection.rtl,
                                      controller: consRevTopController,
                                      style: textStyle,
                                      onEditingComplete: (){
                                        consRevTopController.text = conRev[1].toString();
                                        FocusScope.of(context).unfocus();
                                      },
                                      onChanged: (value){
                                        try{
                                          conRev[1] = int.parse(value);
                                        }catch(Exception)
                                        {
                                          
                                        }
                                      },
                                      decoration: InputDecoration(
                                          hintTextDirection: TextDirection.rtl,
                                          labelText: "ردي ذروة",
                                          labelStyle: textStyle,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                          )
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  Expanded(
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      textDirection: TextDirection.rtl,
                                      controller: consActTopController,
                                      style: textStyle,
                                      onEditingComplete: (){
                                        consActTopController.text = conActive[1].toString();
                                        FocusScope.of(context).unfocus();
                                      },
                                      onChanged: (value){
                                        try{
                                          conActive[1] = int.parse(value);
                                        }catch(Exception)
                                        {
                                          
                                        }
                                      },
                                      decoration: InputDecoration(
                                          hintTextDirection: TextDirection.rtl,
                                          labelText: "فعلي ذروة",
                                          labelStyle: textStyle,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                          )
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:<Widget> [
                                  Expanded(
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      textDirection: TextDirection.rtl,
                                      controller: consRevNightController,
                                      style: textStyle,
                                      onEditingComplete: (){
                                        consRevNightController.text = conRev[2].toString();
                                        FocusScope.of(context).unfocus();
                                      },
                                      onChanged: (value){
                                        try{
                                          conRev[2] = int.parse(value);
                                        }catch(Exception)
                                        {
                                          
                                        }
                                      },
                                      decoration: InputDecoration(
                                          hintTextDirection: TextDirection.rtl,
                                          labelText: "ردي ليل",
                                          labelStyle: textStyle,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                          )
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  Expanded(
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      textDirection: TextDirection.rtl,
                                      controller: consActNightController,
                                      style: textStyle,
                                      onEditingComplete: (){
                                        consActNightController.text = conActive[2].toString();
                                        FocusScope.of(context).unfocus();
                                      },
                                      onChanged: (value){
                                        try{
                                          conActive[2] = int.parse(value);
                                        }catch(Exception)
                                        {
                                          
                                        }
                                      },
                                      decoration: InputDecoration(
                                          hintTextDirection: TextDirection.rtl,
                                          labelText: "فعلي ليل",
                                          labelStyle: textStyle,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                          )
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15,bottom: 15),
                                child: Row(
                                  children: <Widget> [
                                    Expanded(
                                        child: RaisedButton(
                                          splashColor: Colors.brown,
                                          elevation: 10,
                                          color: Colors.green,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                          textColor: Theme.of(context).primaryColorLight,
                                          child: Text("حساب" ,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold
                                            ),
                                            textScaleFactor: 2,),
                                          onPressed: (){
                                            calcBill();
                                            capacityFactor = calcCapacityfactor(conRev[0]+conRev[1]+conRev[2]
                                                ,conActive[0]+conActive[1]+conActive[2]);
                                            manageRangCF(capacityFactor,consValue);
                                            calcFeeValue();
                                            calcCounterRent();
                                            calcAllBillVale();
                                            showResultData();
                                          },
                                        )
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          finalValue,
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.purple
                                          ),
                                          maxLines: 1,
                                          textAlign: TextAlign.right,
                                        ),
                                      )
                                    ],
                                  ),
                                  InkWell(
                                    onTap: (){
                                      if(allvalprice>0){
                                        setState(() {
                                          showdetails = !showdetails;
                                        });
                                      }
                                    },
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                            Icons.more_horiz,
                                            color: Colors.grey.shade500
                                        ),
                                        Text(
                                          'أضغط لعرض التفاصيل',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey.shade500
                                          ),
                                          maxLines: 1,
                                          textAlign: TextAlign.right,
                                        ),

                                      ],
                                    ),
                                  ),
                                  Opacity(
                                    opacity:showdetails ? 1 : 0,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Text(
                                            consValue.toString()+' :قيمة الاستهلاك',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.purple.shade300
                                            ),
                                            maxLines: 1,
                                            textAlign: TextAlign.right,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Opacity(
                                    opacity:showdetails ? 1 : 0,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Text(
                                            feeValue.toString()+' :قيمة الرسوم',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.purple.shade300
                                            ),
                                            maxLines: 1,
                                            textAlign: TextAlign.right,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Opacity(
                                    opacity:showdetails ? 1 : 0,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Text(
                                            counterRent.toString()+' :أجرة العداد',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.purple.shade300
                                            ),
                                            maxLines: 1,
                                            textAlign: TextAlign.right,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Opacity(
                                    opacity:showdetails ? 1 : 0,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Text(
                                            consumptionval.toString()+' :قيمة الحسم',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.purple.shade300
                                            ),
                                            maxLines: 1,
                                            textAlign: TextAlign.right,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Opacity(
                                    opacity:showdetails ? 1 : 0,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Text(
                                            compensationval.toString()+' :قيمة التعويض',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.purple.shade300
                                            ),
                                            maxLines: 1,
                                            textAlign: TextAlign.right,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Opacity(
                                    opacity:showdetails ? 1 : 0,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Text(
                                            revFee.toString()+' :رسوم ردية',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.purple.shade300
                                            ),
                                            maxLines: 1,
                                            textAlign: TextAlign.right,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]

                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width/2,
              child: Hero(
                  tag: widget.heroTag,
                  child: Image.asset(widget.heroTag)),
            ),
            Positioned(
              left: 50,
              top:100,
              child:  Text(widget.voltageType,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            )
          ]
      ),
    );
  }

  void setInvestigationType(String value){
    switch(value){
      case 'تجاري':
        middleVoltageModel.investigationType = 1;
        break;
      case 'صناعي':
        middleVoltageModel.investigationType = 2;
        break;
      case 'زراعي':
        middleVoltageModel.investigationType = 3;
        break;
      case 'دوائر رسمية':
        middleVoltageModel.investigationType = 4;
        break;
      case 'جمعيات خيرية':
        middleVoltageModel.investigationType = 5;
        break;
      case 'دور عبادة':
        middleVoltageModel.investigationType = 6;
        break;
      case 'إنارة عامة':
        middleVoltageModel.investigationType = 7;
        break;
      case 'لوحات إعلانية':
        middleVoltageModel.investigationType = 8;
        break;
      case 'ضخ مياه الشرب':
        middleVoltageModel.investigationType = 9;
        break;
    }
  }
  String getInvestigationType(int value){
    String investigationType='';
    switch(value){
      case 1:
        investigationType = _investigationType[0];
        break;
      case 2:
        investigationType = _investigationType[1];
        break;
      case 3:
        investigationType = _investigationType[2];
        break;
      case 4:
        investigationType = _investigationType[3];
        break;
      case 5:
        investigationType = _investigationType[4];
        break;
      case 6:
        investigationType = _investigationType[5];
        break;
      case 7:
        investigationType = _investigationType[6];
        break;
      case 8:
        investigationType = _investigationType[7];
        break;
      case 9:
        investigationType = _investigationType[8];
        break;
    }
    return investigationType;
  }

  void calcBill() {
    consValue = 0;
    switch (getInvestigationType(middleVoltageModel.investigationType)) {
      case 'تجاري':
        for(int i = 0 ; i<3 ; i++)
          consValue += conActive[i]*(MiddleVoltageModel.commercial20_04[i]);
        break;
      case 'صناعي':
        for(int i = 0 ; i<3 ; i++)
          consValue += conActive[i]*(MiddleVoltageModel.industrial20_04[i]);
        break;
      case 'زراعي':
        for(int i = 0 ; i<3 ; i++)
          consValue += conActive[i]*(MiddleVoltageModel.agronomic_20_04[i]);
        break;
      case 'دوائر رسمية':
        for(int i = 0 ; i<3 ; i++)
          consValue += conActive[i]*(MiddleVoltageModel.formalsections_20_04[i]);
        break;
      case 'جمعيات خيرية':
        for(int i = 0 ; i<3 ; i++)
          consValue += conActive[i]*(MiddleVoltageModel.charity_20_04[i]);
        break;
      case 'دور عبادة':
            //calcforHolyPlace();
        break;
      case 'إنارة عامة':
        for(int i = 0 ; i<3 ; i++)
          consValue += conActive[i]*(MiddleVoltageModel.publiclighting_20_04[i]);
        break;
      case 'لوحات إعلانية':
        for(int i = 0 ; i<3 ; i++)
          consValue += conActive[i]*(MiddleVoltageModel.lightingadvirtising_20_04[i]);
        break;
    case 'ضخ مياه الشرب':
      for(int i = 0 ; i<3 ; i++)
          consValue += conActive[i]*(MiddleVoltageModel.drinkWater_20_04[i]);
    break;
    }
     }
  void calcFeeValue() {
    int finanicalFee = (consValue*0.105%10)>0?  (consValue*0.105/10).floor()*10 + 10 :  (consValue*0.105/10).floor()*10;
    int anotherFee = (consValue*0.11%10)>0?  (consValue*0.11/10).floor()*10 + 10 :  (consValue*0.11/10).floor()*10;
    switch (getInvestigationType(middleVoltageModel.investigationType)) {
      case 'تجاري':
      case 'صناعي':
      case 'زراعي':
      case 'جمعيات خيرية':
      case 'لوحات إعلانية':
        feeValue = middleVoltageModel.martyrStamp + finanicalFee + anotherFee;
        break;
      case 'إنارة عامة':
      case 'دوائر رسمية':
      case 'ضخ مياه الشرب':
        feeValue = middleVoltageModel.martyrStamp + finanicalFee;
        break;
      case 'دور عبادة':
        feeValue = 0;
        break;
    }
  }
  void calcCounterRent() {
    counterRent = middleVoltageModel.COUNTERRENTRIOTHER;
  }
  void calcAllBillVale() {
    allvalprice = (consValue + feeValue + counterRent - consumptionval + compensationval + revFee).round();
    if(allvalprice>3000 && getInvestigationType(middleVoltageModel.investigationType) != 'دور عبادة')//ليس دور عبادة
        {
      feeValue += middleVoltageModel.rebuild ;
      allvalprice += middleVoltageModel.rebuild;
    }
  }
  double calcCapacityfactor(int revConsumption, int actConsumption) {
    double value = 1 , ratio = 0.0;
    if(actConsumption!=0)
      ratio = revConsumption/actConsumption;
    if(ratio != 0)
      value = 1/(sqrt(1 + ratio*ratio));
    return value;
  }
  void manageRangCF(double capacityfactor,int actValue) {
    if (capacityfactor >= 0 && capacityfactor < 0.9){
      if (capacityfactor < middleVoltageModel.MIN_capacityFactor)
        compensationval = (actValue*(0.9 / middleVoltageModel.MIN_capacityFactor - 1)).round();
      else
        compensationval = (actValue*(0.9 / double.parse(capacityfactor.toStringAsPrecision(4)) - 1)).round();
    revFee = (compensationval * 0.313 / 100).round();
    consumptionval = 0;
  }
    if(capacityfactor >= 0.9 && capacityfactor <= 0.93)
    {
      compensationval = 0;
      revFee = 0;
      consumptionval = 0;
    }
    if(capacityfactor>0.93 && capacityfactor <= middleVoltageModel.MAX_capacityFactor)
    {
      compensationval = 0;
      revFee = 0;
      consumptionval = actValue*((capacityfactor)/0.93 - 1).round();
    }
    if(capacityfactor> middleVoltageModel.MAX_capacityFactor)
    {
      compensationval = 0;
      revFee = 0;
      if(conRev[0]+conRev[1]+conRev[2] == 0)
      {
        consumptionval = 0;
      }
      else
      {
        consumptionval = (actValue*(middleVoltageModel.MAX_capacityFactor/0.93 - 1)).round();
      }
    }
  }
  void showResultData() {
    setState(() {
      finalValue ='إجمالي الفاتورة: '+ allvalprice.toString() + ' ل.س';
    });
  }
}
