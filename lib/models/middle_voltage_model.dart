
class MiddleVoltageModel{
  int investigationType;

  MiddleVoltageModel(this.investigationType);

  final double MIN_capacityFactor = 0.405;
  final double MAX_capacityFactor = 0.98;
  final int martyrStamp = 25 ;//طابع شهيد
  final int rebuild = 70;//إعادة الإعمار
  final int Area = 0;
  final double offerconsum = 0;
  static List<int> commercial20_04 = [120,160,100];
  static List<int> industrial20_04 = [120,160,100];
  static List<int> agronomic_20_04 = [40,55,35];
  static List<int> formalsections_20_04 = [120,160,100];
  static List<int> charity_20_04 = [50,70,40];
  static List<int> holyplace_20_04 = [120,160,100];
  static List<int> publiclighting_20_04 = [120,160,100];
  static List<int> lightingadvirtising_20_04 = [120,160,100];
  static List<int> drinkWater_20_04 = [100,135,85];

  final int COUNTERRENTRIOTHER = 1500;

  static List<String> investigationTypeList = ['تجاري','صناعي','زراعي','دوائر رسمية','جمعيات خيرية',
                                                  'دور عبادة','إنارة عامة','لوحات إعلانية','ضخ مياه الشرب'];
}