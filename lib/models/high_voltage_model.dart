
class HighVoltageModel{
  int investigationType;
  int counterPosition;
  HighVoltageModel(this.investigationType,this.counterPosition);


  final int martyrStamp = 25 ;//طابع شهيد
  final int rebuild = 70;//إعادة الإعمار
  static List<int> other20 = [115,155,95];
  static List<int> metalmelting_20 = [300,400,250];

  final int COUNTERRENTRIOTHER = 3000;
  final double MIN_capacityFactor = 0.405;
  final double MAX_capacityFactor = 0.98;
  static List<String> investigationTypeList = ['صهر معادن','باقي الصفات'];
  static List<String> counterPositionList = ['محطة التحويل','مركز التحويل طرف ال 20','طرف ال 0.4'];
}