
class LowVoltageModel{
  int counterType;
  int investigationType;

  LowVoltageModel(this.counterType,this.investigationType);

  static List<int> domestic = [2,6,20,90,150];
  final List<int> hoclyce = [600,400,500,1000,2500];
  final int martyrStamp = 25 ;//طابع شهيد
  final int rebuild = 70;//إعادة الإعمار
  final int cleaningRent = 100;
  final int Area = 0;
  final double offerconsum = 0;
  static int commercial_04=100;
  static int industrial_04=100;
  static int formalsections_04=100;
  static int charity_04=50;
  static int agronomic_04=40;
  static int lightingadvirtising_04=200;
  static int publiclighting_04=100;
  static int holyplace_04=100;
  final int COUNTERRENTMONO=300;
  final int COUNTERRENTTRIDOMESTIC=600;
  final int COUNTERRENTRIOTHER=1000;

  static List<String> counterTypeList = ["أحادي","ثلاثي"];
  static List<String> investigationTypeList = ['منزلي','تجاري','صناعي','زراعي','دوائر رسمية','جمعيات خيرية','دور عبادة','إنارة عامة','لوحات إعلانية'];
}