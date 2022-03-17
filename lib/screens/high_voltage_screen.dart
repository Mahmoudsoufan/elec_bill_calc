import 'dart:math';
import 'package:flutter/material.dart';
import '../models/high_voltage_model.dart';

class HighVoltage extends StatefulWidget{
  final heroTag;
  final voltageType;
  final description;
  final HighVoltageModel highVoltageModel;
  HighVoltage(this.heroTag, this.voltageType, this.description,this.highVoltageModel);

  @override
  _HighVoltageState createState() => _HighVoltageState(highVoltageModel);
}

class _HighVoltageState extends State<HighVoltage>{
  double capacityFactor=0;
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
  bool showdetails =false;
  List<int> conActive = [0,0,0];
  List<int> conRev = [0,0,0];
  HighVoltageModel highVoltageModel;
  _HighVoltageState(this.highVoltageModel);
  var _investigationType = HighVoltageModel.investigationTypeList;
  var _counterPosition = HighVoltageModel.counterPositionList;
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
      backgroundColor: Colors.deepOrangeAccent,
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
                        padding: EdgeInsets.only(top: 110,left:25,right: 25),
                        child: SingleChildScrollView(
                          child: Column(
                            textDirection: TextDirection.rtl,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:<Widget> [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex:4,
                                    child: Column(
                                      children :[
                                        Text('صفة الاستثمار',style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey.shade500
                                        )),
                                        ListTile(
                                        title: DropdownButton(
                                          items: _investigationType.map((String val){
                                            return DropdownMenuItem<String>(
                                              value:val,
                                              child: Text(val,style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.pinkAccent
                                              )),
                                            );
                                          }).toList(),
                                          style: textStyle,
                                          value: getInvestigationType(highVoltageModel.investigationType),
                                          onChanged: (selectedItem) {
                                            setState(() {
                                              setInvestigationType(selectedItem.toString());
                                            });
                                          },
                                        ),
                                      )],
                                    ),
                                  ),
                                  Expanded(
                                    flex:5,
                                    child: Column(
                                      children: [
                                        Text('موقع العداد',style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey.shade500
                                    ),),
                                        ListTile(
                                        title: DropdownButton(
                                          items: _counterPosition.map((String val){
                                            return DropdownMenuItem<String>(
                                              value:val,
                                              child: Text(val,style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.pinkAccent
                                              )),
                                            );
                                          }).toList(),
                                          style: textStyle,
                                          value: getCounterPosition(highVoltageModel.counterPosition),
                                          onChanged: (selectedItem) {
                                            setState(() {
                                              setCounterPosition(selectedItem.toString());
                                            });
                                          },
                                        ),
                                      )],
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
                                          splashColor: Colors.deepOrangeAccent,
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                          color: Colors.green,
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
                                            capacityFactor.toStringAsPrecision(4)+' :عامل الاستطاعة',
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
      case 'صهر معادن':
        highVoltageModel.investigationType = 1;
        break;
      case 'باقي الصفات':
        highVoltageModel.investigationType = 2;
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
    }
    return investigationType;
  }

  void setCounterPosition(String value){
    switch(value){
      case 'محطة التحويل':
        highVoltageModel.counterPosition = 1;
        break;
      case 'مركز التحويل طرف ال 20':
        highVoltageModel.counterPosition = 2;
        break;
      case 'طرف ال 0.4':
        highVoltageModel.counterPosition = 3;
        break;
    }
  }
  String getCounterPosition(int value){
    String counterPosition='';
    switch(value){
      case 1:
        counterPosition = _counterPosition[0];
        break;
      case 2:
        counterPosition = _counterPosition[1];
        break;
      case 3:
        counterPosition = _counterPosition[2];
        break;
    }
    return counterPosition;
  }


  void calcBill() {
    consValue = 0;
    switch (getInvestigationType(highVoltageModel.investigationType)) {
      case 'صهر معادن':
        for(int i = 0 ; i<3 ; i++)
          consValue += conActive[i]*(HighVoltageModel.metalmelting_20[i]);
        break;
      case 'باقي الصفات':
        for(int i = 0 ; i<3 ; i++)
          consValue += conActive[i]*(HighVoltageModel.other20[i]);
        break;
    }
    switch(getCounterPosition(highVoltageModel.counterPosition)){
      case 'محطة التحويل':
        break;
      case 'مركز التحويل طرف ال 20':
        consValue = consValue + (consValue*0.03).round();
        break;
      case 'طرف ال 0.4':
        consValue = consValue + (consValue*0.04).round();
        break;
    }
    }
  void calcFeeValue() {
    int finanicalFee = (consValue*0.105%10)>0?  (consValue*0.105/10).floor()*10 + 10 :  (consValue*0.105/10).floor()*10;
    int anotherFee = (consValue*0.11%10)>0?  (consValue*0.11/10).floor()*10 + 10 :  (consValue*0.11/10).floor()*10;
    switch (getInvestigationType(highVoltageModel.investigationType)) {
      case 'صهر معادن':
      case 'باقي الصفات':
        feeValue = highVoltageModel.martyrStamp + finanicalFee + anotherFee;
        break;
    }
  }
  void calcCounterRent() {
    counterRent = highVoltageModel.COUNTERRENTRIOTHER;
  }
  void calcAllBillVale() {
    allvalprice = (consValue + feeValue + counterRent - consumptionval + compensationval + revFee).round();
    if(allvalprice>3000)//ليس دور عبادة
        {
      feeValue += highVoltageModel.rebuild ;
      allvalprice += highVoltageModel.rebuild;
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
      if (capacityfactor < highVoltageModel.MIN_capacityFactor)
        compensationval =
            actValue * ((0.9 / highVoltageModel.MIN_capacityFactor - 1)).round();
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
    if(capacityfactor>0.93 && capacityfactor <= highVoltageModel.MAX_capacityFactor)
    {
      compensationval = 0;
      revFee = 0;
      consumptionval = (actValue*((double.parse(capacityfactor.toStringAsPrecision(4))/0.93 - 1))).round();
    }
    if(capacityfactor> highVoltageModel.MAX_capacityFactor)
    {
      compensationval = 0;
      revFee = 0;
      if(conRev[0]+conRev[1]+conRev[2] == 0)
      {
        consumptionval = 0;
      }
      else
      {
        consumptionval = (actValue*(highVoltageModel.MAX_capacityFactor/0.93 - 1)).round();
      }
    }
  }

  void showResultData() {
    setState(() {
      finalValue ='إجمالي الفاتورة: '+ allvalprice.toString() + ' ل.س';
    });
  }
}
