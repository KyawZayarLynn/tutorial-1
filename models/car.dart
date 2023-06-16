import 'config/table.dart';


///#Car
///the Car class
///@author KyawZayarLynn
class Car extends Table {
  ///Car Id
  int? id;

  ///Car brand
  String? brand;

  ///Car year
  int? year;

  ///Car model
  String? model;

  /// ## Constructor
  /// The car constructor with all arguments
  /// 
  /// [Parameters]:
  /// id  [int]
  /// brand [String]
  /// year  [int]
  /// model [String]
  Car(this.id, this.brand, this.year, this.model);

  /// ## Constructor
  /// The named constructor for car
  Car.empty();

  ///fromJson
  ///
  ///the class factory method to convert json object to class member object
  ///
  ///Parameters : [Map<String, dynamic> json]
  ///
  ///@return Car
  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(json['id'], json['brand'], json['year'], json['model']);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'brand': this.brand,
      'year': this.year,
      'model': this.model
    };
  }

  @override
  String getClassName() {
    return "car";
  }

  @override
  String createQuery() {
    return '''
      CREATE TABLE car (
      id INTEGER PRIMARY KEY,
      brand VARCHAR(100),
      year INT(10),
      model VARCHAR(100)
    )
    ''';
  }

  @override
  String toString() {
    return '${this.toJson()}';
  }
}
