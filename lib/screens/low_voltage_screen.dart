import 'package:flutter/material.dart';
import '../models/low_voltage_model.dart';

class LowVoltage extends StatefulWidget{
  final heroTag;
  final voltageType;
  final description;
  final LowVoltageModel lowVoltageModel;
  LowVoltage(this.heroTag, this.voltageType, this.description,this.lowVoltageModel);

  @override
  _LowVoltageState createState() => _LowVoltageState(lowVoltageModel);
}

class _LowVoltageState extends State<LowVoltage>{
  int consValue = 0;
  int consum = 0;
  int countSlice=1;
  int feeValue  = 0 ;//قيمة الرسوم
  int counterRent = 0;//أجرة العداد
  int allvalprice =0;
  String finalValue ='';
  bool showdetails =false;
  LowVoltageModel lowVoltageModel;
  _LowVoltageState(this.lowVoltageModel);
  var _counterType = LowVoltageModel.counterTypeList;
  var _investigationType = LowVoltageModel.investigationTypeList;
  TextEditingController consumController = TextEditingController();
  TextEditingController slicingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    TextStyle? textStyle  = Theme.of(context).textTheme.subtitle1;
    consumController.text ;
    slicingController.text ;
    return Scaffold(
      backgroundColor: Colors.purple,
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
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: ListTile(
                                  title: DropdownButton(
                                    items: _counterType.map((String val){
                                      return DropdownMenuItem<String>(
                                        value:val,
                                        child: Text(val,style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.pinkAccent
                                        )),
                                      );
                                    }).toList(),
                                    style: textStyle,
                                    value: getCounterType(lowVoltageModel.counterType),
                                    onChanged: (selectedItem) {
                                      setState(() {
                                        setCounterType(selectedItem.toString());
                                      });
                                    },
                                  ),
                                ),
                              ),
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
                                    value: getInvestigationType(lowVoltageModel.investigationType),
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
                                  controller: slicingController,
                                  style: textStyle,
                                  onEditingComplete: (){
                                    slicingController.text = countSlice.toString();
                                    FocusScope.of(context).unfocus();
                                  },
                                  onChanged: (value){
                                    try{
                                      countSlice = int.parse(value);
                                    }catch(Exception)
                                    {

                                    }

                                  },
                                  decoration: InputDecoration(
                                      hintTextDirection: TextDirection.rtl,
                                      labelText: "دورات التشريح",
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
                                  controller: consumController,
                                  style: textStyle,
                                  onEditingComplete: (){
                                    consumController.text = consum.toString();
                                    FocusScope.of(context).unfocus();
                                  },
                                  onChanged: (value){
                                    try{
                                      consum = int.parse(value);
                                    }catch(Exception)
                                    {

                                    }
                                  },
                                  decoration: InputDecoration(
                                      hintTextDirection: TextDirection.rtl,
                                      labelText: "الاستهلاك",
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
                                      splashColor: Colors.purple,
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
                                          fontSize: 30,
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
  void setCounterType(String value){
    switch(value){
      case 'أحادي':
        lowVoltageModel.counterType = 1;
        break;
      case 'ثلاثي':
        lowVoltageModel.counterType = 2;
        break;
    }
  }
  String getCounterType(int value){
    String counterType='';
    switch(value){
      case 1:
        counterType = _counterType[0];
        break;
      case 2:
        counterType = _counterType[1];
        break;
    }
    return counterType;
  }
  void setInvestigationType(String value){
    switch(value){
      case 'منزلي':
        lowVoltageModel.investigationType = 1;
        break;
      case 'تجاري':
        lowVoltageModel.investigationType = 2;
        break;
      case 'صناعي':
        lowVoltageModel.investigationType = 3;
        break;
      case 'زراعي':
        lowVoltageModel.investigationType = 4;
        break;
      case 'دوائر رسمية':
        lowVoltageModel.investigationType = 5;
        break;
      case 'جمعيات خيرية':
        lowVoltageModel.investigationType = 6;
        break;
      case 'دور عبادة':
        lowVoltageModel.investigationType = 7;
        break;
      case 'إنارة عامة':
        lowVoltageModel.investigationType = 8;
        break;
      case 'لوحات إعلانية':
        lowVoltageModel.investigationType = 9;
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
    switch (getInvestigationType(lowVoltageModel.investigationType)) {
      case 'منزلي':
        consValue = calcforhouse(consum,countSlice);
        break;
      case 'تجاري':
        consValue =  consum *LowVoltageModel.commercial_04;
        break;
      case 'صناعي':
        consValue = consum * LowVoltageModel.industrial_04;
        break;
      case 'زراعي':
        consValue = consum * LowVoltageModel.agronomic_04;
        break;
      case 'دوائر رسمية':
        consValue = consum * LowVoltageModel.formalsections_04;
        break;
      case 'جمعيات خيرية':
        consValue = consum * LowVoltageModel.charity_04;
        break;
      case 'دور عبادة':
        //calcforHolyPlace();
        break;
      case 'إنارة عامة':
        consValue = consum * LowVoltageModel.publiclighting_04;
        break;
      case 'لوحات إعلانية':
        consValue = consum * LowVoltageModel.lightingadvirtising_04;
        break;
    }
    }
  void calcFeeValue() {
    int finanicalFee = (consValue*0.105%10)>0?  (consValue*0.105/10).floor()*10 + 10 :  (consValue*0.105/10).floor()*10;
    int anotherFee = (consValue*0.11%10)>0?  (consValue*0.11/10).floor()*10 + 10 :  (consValue*0.11/10).floor()*10;
    switch (getInvestigationType(lowVoltageModel.investigationType)) {
      case 'منزلي':
        feeValue = lowVoltageModel.cleaningRent + finanicalFee + anotherFee;
        break;
      case 'تجاري':
      case 'صناعي':
      case 'زراعي':
      case 'جمعيات خيرية':
      case 'لوحات إعلانية':
        feeValue = lowVoltageModel.martyrStamp + finanicalFee + anotherFee;
        break;
      case 'إنارة عامة':
      case 'دوائر رسمية':
        feeValue = lowVoltageModel.martyrStamp + finanicalFee;
        break;
      case 'دور عبادة':
        feeValue = 0;
        break;
    }
  }
  void calcCounterRent() {

    if(getInvestigationType(lowVoltageModel.investigationType) == 'دور عبادة') //commercial  دور عبادة
        {
      counterRent = 0;
    }
    else
    {
      if(getCounterType(lowVoltageModel.counterType) == 'أحادي')
      {
        counterRent = lowVoltageModel.COUNTERRENTMONO;
      }
      else {
        switch (getInvestigationType(lowVoltageModel.investigationType))
        {
          case 'منزلي':
            counterRent = lowVoltageModel.COUNTERRENTTRIDOMESTIC;
            break;
          case 'تجاري':
          case 'صناعي':
          case 'زراعي':
          case 'جمعيات خيرية':
          case 'لوحات إعلانية':
          case 'إنارة عامة':
          case 'دوائر رسمية':
          counterRent = lowVoltageModel.COUNTERRENTRIOTHER;
            break;
        }
      }
    }
  }
  void calcAllBillVale() {
    allvalprice =  consValue + feeValue + counterRent;
    if(allvalprice>3000 && getInvestigationType(lowVoltageModel.investigationType) != 'دور عبادة')//ليس دور عبادة
        {
      feeValue += lowVoltageModel.rebuild ;
      allvalprice += lowVoltageModel.rebuild;
    }
  }
  void showResultData() {
    setState(() {
      finalValue ='إجمالي الفاتورة: '+ allvalprice.toString() + ' ل.س';
    });
  }
  Widget showBillDetails() {
   return Container(color: Colors.grey);
  }

  int calcforhouse(int consum2, int countSlice2) {
    if(countSlice2 == 1)
    {
      return calcforhouse1(consum2);
    }
    else
    {
      int consum = (consum2/countSlice2).round() ;
      return (countSlice2-1)*calcforhouse1(consum)+calcforhouse1(consum2-(countSlice2-1)*consum);
    }
  }
  int calcforhouse1(int consum) {
    List<int> hoclyce = lowVoltageModel.hoclyce;
    List<int> accum =[0,0,0,0,0];
    if(consum<=hoclyce[0])
      accum[0] = consum;
    else
    {
    if(consum - hoclyce[0]<=hoclyce[1])
    {
    accum[0] = hoclyce[0];
    accum[1] = consum - hoclyce[0];
    }
    else
    {

    if(consum - hoclyce[0]-hoclyce[1]<=hoclyce[2])
    {
    accum[0] = hoclyce[0];
    accum[1] = hoclyce[1];
    accum[2] = consum - hoclyce[0]-hoclyce[1];
    }
    else
    {

    if(consum - hoclyce[0]-hoclyce[1]-hoclyce[2]<=hoclyce[3])
    {
    accum[0] = hoclyce[0];
    accum[1] = hoclyce[1];
    accum[2] = hoclyce[2];
    accum[3] = consum - hoclyce[0]-hoclyce[1]-hoclyce[2];
    }
    else
    {

    if(consum - hoclyce[0]-hoclyce[1]-hoclyce[2]-hoclyce[3]<=hoclyce[4])
    {
    accum[0] = hoclyce[0];
    accum[1] = hoclyce[1];
    accum[2] = hoclyce[2];
    accum[3] = hoclyce[3];
    accum[4] = consum - hoclyce[0]-hoclyce[1]-hoclyce[2]-hoclyce[3];
    }
    else
    {
    accum[0] = hoclyce[0];
    accum[1] = hoclyce[1];
    accum[2] = hoclyce[2];
    accum[3] = hoclyce[3];
    accum[4] = consum - hoclyce[0]-hoclyce[1]-hoclyce[2]-hoclyce[3];
    }
    }
    }
    }

    }
    int sum = 0;
    for(int i = 0 ; i<accum.length;i++)
    {
    sum += accum[i]*(LowVoltageModel.domestic[i]);
    }
    return sum;
  }
  }
