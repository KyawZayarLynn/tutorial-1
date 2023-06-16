import '../main.dart';
import '../models/car.dart';

///#CarService
///The sevice to perform the car CRUD operations
///
///@author KyawZayarLynn
class CarService {
  ///getAllCars
  ///
  ///Get all cars from database
  ///
  ///@return [List<Car>]
  Future<List<Car>> getAllCars() async {
    final data = await entitymanager.database.query('car');
    return data.map((car) => Car.fromJson(car)).toList();
  }

  ///getCarById
  ///
  ///Get car by id
  ///
  ///Parameter[int id]
  ///
  ///@return [Car?]
  Future<Car?> getCarById(int id) async {
    final data = await entitymanager.database
        .query('car', where: 'id=?', whereArgs: [id]);
    if (data.length == 0) return null;
    return Car.fromJson(data.single);
  }

  ///createCar
  ///
  ///To create car
  ///
  ///Parameter[Car car]
  Future<void> createCar(Car car) async {
    await entitymanager.database.insert(car.getClassName(), car.toJson());
  }


///updateCar
///
///To update Car 
///
///Parameter[Car car]
  Future<void> updateCar(Car car) async {
    await entitymanager.database.update(car.getClassName(), car.toJson(),
        where: 'id=?', whereArgs: [car.id]);
  }


///deleteCar
///
///To delete car from database
///
///Parameter[int id]
  Future<void> deleteCar(int id) async {
    await entitymanager.database.delete('car', where: 'id=?', whereArgs: [id]);
  }
}
