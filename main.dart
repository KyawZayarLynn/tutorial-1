import 'dart:io';

import 'models/config/entity_manager.dart';
import 'models/car.dart';
import 'services/car_service.dart';

///current project path
final projectPath = Directory.current.path;

///entity manager
final entitymanager = EntityManager();

///Car Services
final carService = CarService();

///main function
Future<void> main() async {
  await entitymanager.initDatabase([Car.empty()]);
  await command();
}

///Command
///
///To run the Functions
Future<void> command() async {
  print('Car CRUD operations');
  print('------------------');
  print('There are 4 options to control:');
  print(' list - display the list of cars.');
  print(' create - create a new car.');
  print(' update - update an existing car.');
  print(' delete - delete an existing car.');

  while (true) {
    print('\n Enter the options: ');
    final option = stdin.readLineSync();
    if (option == 'exit') {
      print('Leaving the command');
    }
    await execute(option);
  }
}

///Execute
///
///To execute command options
///
///parameters
///[String] option
Future<void> execute(String? option) async {
  switch (option) {
    case 'list':
      final cars = await carService.getAllCars();
      print(cars);
      break;
    case 'create':
      await createCar();
      break;
    case 'update':
      await updateCar();
      break;
    case 'delete':
      await deleteCar();
      break;
    default:
      print('Invalid option');
      break;
  }
}

///CreateCar
///
///Car creation Function
Future<void> createCar() async {
  print('Creating a new car');
  print('-------------------');

  final car = Car.empty();

  print('Enter the brand of the new car: ');
  car.brand = stdin.readLineSync();

  print('Enter the year of the new car: ');
  final yearInput = stdin.readLineSync();
  car.year = int.tryParse(yearInput ?? '') ?? 0;

  print('Enter the model of the new car: ');
  car.model = stdin.readLineSync();

  await carService.createCar(car);
  print('Successfully created the car');
}

///update Car
///
///Car updating function
Future<void> updateCar() async {
  print('Updating a car');
  print('----------------');

  print('Enter the car ID');
  final idInput = stdin.readLineSync();
  final id = int.tryParse(idInput ?? '') ?? 0;

  final car = await carService.getCarById(id);
  if (car == null) {
    print('Your ID is invalid');
    return;
  }

  print('Enter the car brand: ');
  final brandInput = stdin.readLineSync();
  if (brandInput?.isNotEmpty == true) {
    car.brand = brandInput;
  }

  print('Enter the car year: ');
  final yearInput = stdin.readLineSync();
  if (yearInput?.isNotEmpty == true) {
    final year = int.tryParse(yearInput!);
    if (year != null) {
      car.year = year;
    }
  }

  print('Enter the model: ');
  final modelInput = stdin.readLineSync();
  if (modelInput?.isNotEmpty == true) {
    car.model = modelInput;
  }

  await carService.updateCar(car);
  print('Updated the car');
}

///Delete car
///
///Car deleting function
Future<void> deleteCar() async {
  print('Deleting a car');
  print('----------------');

  print('Enter the car ID: ');
  final idInput = stdin.readLineSync();
  final id = int.tryParse(idInput ?? '') ?? 0;

  final car = await carService.getCarById(id);
  if (car == null) {
    print('Your ID is invalid');
    return;
  }

  await carService.deleteCar(id);
  print('Deleted the car successfully');
}
