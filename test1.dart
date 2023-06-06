//Importing Libraries
import 'dart:math' as lib1;

// Null Safety
String name = 'kyaw';
String? nickname;

// Late Variables
late String job;

// Final and Const
final String car = 'car';
final bar = [1, 2, 3];
const baz = [3, 4, 5];

//Arithmetic Operators
int a = 11;
int b = 12;

//Equality and relational operators
int c = 22;
int d = 33;
int e = 33;

//type test operators
class Person {
  ///Person is main class
  ///Person is for testing type test operators
  void run() {
    print('he is running');
  }
}

class Kyaw extends Person {
  void walk() {
    print('kyaw is walking');
  }
}

abstract class Vehicle {
  void move() {
    print('moving');
  }
}

class Car extends Vehicle {
  int wheel = 4;
}

class Cycle implements Vehicle {
  @override
  void move() {
    print('Cycle is moving');
  }
}

void main() {
  // Null Safety
  print(name);
  print(nickname);

  // Late Variables
  job = 'developer';
  print(job);

  //final and const
  bar[1] = 5;
  print(car);
  print(bar);
  print(baz);

  //Arithmetic Operators
  print(a + b);
  print(b - a);
  print(a * b);
  print(a / b);
  print(a ~/ b);
  print(b % a);

  //Equality and relational operators
  if (c == 22) {
    print('the value of c is 22');
  }
  if (c != 33) {
    print('the value of c is not 33');
  }
  if (d > c) {
    print('d is greater than c');
  }
  if (c < d) {
    print('c is less than d');
  }
  if (d >= e) {
    print('d is greater than or equal e');
  }
  if (d <= e) {
    print('d is less than or equal e');
  }

  // Type test operator
  Person kyaw = Kyaw();
  // kyaw.run();
  // kyaw.walk();
  if (kyaw is Person) {
    (kyaw as Kyaw).walk();
    (kyaw).run();
  }

  if (a is int) {
    print('a is integer');
  } 
  else {
    print('a is not int');
  }
  if (a is! String) {
    print('a is not string');
  }

  // Logical Operator
  if (a is int || a is String) {
    print('a is int or string');
  }
  if (a is int && b is int) {
    print('a and b are integers');
  }

  // Conditional expressions
  var age = 21;
  var mesg = (age >= 18) ?? 'You are above 18';
  var note = (age >= 18) ? 'You are an adult' : 'You age above 18';
  var test;

  print(mesg);
  print(note);
  var showtest = test ?? "test1";
  print(showtest);

  //using library
  int x = 4;
  print(lib1.sqrt(x));

  //break
  for (var i = 1; i <= 5; i++) {
    print('number->$i');
    if (i == 3) {
      print('It reached 3');
      break;
    }
  }

  //continue
  for (var i = 1; i <= 5; i++) {
    print('number->$i');
    if (i == 2) {
      print('It reached 2');
      continue;
    }
  }

  //switch and case
  String fruit = 'stawberry';
  switch (fruit) {
    case 'stawberry':
      print('it is stawberry');
      break;
    case 'orange':
      print('it is orange');
      break;
    default:
      print('it is not choiced');
  }
}
