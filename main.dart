import 'dart:io';
import 'dart:math';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class Car {
  int id;
  String brand;
  String model;

  Car(this.id, this.brand, this.model);
}

class CarDatabase {
  late Database db;

  Future openDatabaes() async {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    db = await openDatabase(
        'D:/BIB Training Center Backend/main/CarCRUD_DB/Car.db');
  }

  Future closeDatabase() async {
    await db.close();
  }

  Future createTable() async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS Car(
        id INTEGER PRIMARY KEY,
        brand CHAR(20),
        model CHAR(20)
      )
    ''');
  }

  Future insertCar(Car car) async {
    await db
        .insert('Car', {'id': car.id, 'brand': car.brand, 'model': car.model});
  }

  Future getAllCars() async {
    var result = await db.query('Car');
    return result
        .map((car) => Car(
            car['id'] as int, car['brand'] as String, car['model'] as String))
        .toList();
  }

  Future updateCar(Car car) async {
    await db.update('Car', {'brand': car.brand, 'model': car.model},
        where: 'id=?', whereArgs: [car.id]);
  }

  Future deleteCar(int id) async {
    await db.delete('Car', where: 'id=?', whereArgs: [id]);
  }
}

List<Car> cars = [];
CarDatabase carDatabase = CarDatabase();

void listCars() {
  if (cars.isEmpty) {
    print('There is no car to show.');
    print('');
  } else {
    cars.forEach((car) {
      print('CarID : ${car.id}');
      print('CarBrand : ${car.brand}');
      print('CarModel : ${car.model}');
      print('');
    });
  }
}

void createCars(String brand, String model) {
  var randomID = Random();
  var car = Car(randomID.nextInt(1000), brand, model);
  carDatabase.insertCar(car);
  print('You created a new car successfully');
  print('');
}

void updateCars(int id, String brand, String model) {
  var carIndex = cars.indexWhere((car) => car.id == id);
  if (carIndex >= 0) {
    cars[carIndex].brand = brand;
    cars[carIndex].model = model;
    var car = Car(id, brand, model);
    carDatabase.updateCar(car);
    print('You updated $brand and $model to ID: $id successfully');
    print('');
  } else {
    print('Your ID is invalid');
    print('');
  }
}

void deleteCars(int id) {
  var carIndex = cars.indexWhere((car) => car.id == id);
  if (carIndex >= 0) {
    cars.removeAt(carIndex);
    carDatabase.deleteCar(id);
    print('You deleted the ID: $id successfully');
    print('');
  } else {
    print('Your ID is invalid');
    print('');
  }
}

bool isCarIdExists(int id) {
  return cars.any((car) => car.id == id);
}

void main() async {
  print('CRUD operations on cars');

  await carDatabase.openDatabaes();

  await carDatabase.createTable();

  cars = await carDatabase.getAllCars();

    while (true) {
    print('You can run this program by typing these commands:');
    print('1 : list');
    print('2 : create');
    print('3 : update');
    print('4 : delete');
    print('5 : exit');
    print('');

    stdout.write('Enter a command above you want: ');
    var command = stdin.readLineSync()!;
    print('');

    if (command == 'list') {
      listCars();
      print('');
    } else if (command == 'create') {
      stdout.write('Enter a new car brand: ');
      var brand = stdin.readLineSync()!;
      stdout.write('Enter a new car model: ');
      var model = stdin.readLineSync()!;
      createCars(brand, model);
      print('');
      cars = await carDatabase.getAllCars();
      listCars();
      print('');
    } else if (command == 'update') {
      stdout.write('Enter the car ID you want to update: ');
      var idStr = stdin.readLineSync()!;
      print('');
      var id = int.parse(idStr);
      if (!isCarIdExists(id)) {
        print('Car with ID: $id does not exist');
        print('');
      } else {
        stdout.write('Enter the new car brand: ');
        var brand = stdin.readLineSync()!;
        stdout.write('Enter the new car model: ');
        var model = stdin.readLineSync()!;
        updateCars(id, brand, model);
        print('');
        cars = await carDatabase.getAllCars();
        listCars();
        print('');
      }
    } else if (command == 'delete') {
      stdout.write('Enter the car ID you want to delete: ');
      var idStr = stdin.readLineSync()!;

      var id = int.parse(idStr);

      if (!isCarIdExists(id)) {
        print('Car with ID: $id does not exist');
        print('');
      } else {
        deleteCars(id);
        print('');
        cars = await carDatabase.getAllCars();
        listCars();
        print('');
      }
    } else if (command == 'exit') {
      await carDatabase.closeDatabase();
      break;
    } else {
      print('Your command is invalid! Please try again.');
      print('');
    }
  }
}
