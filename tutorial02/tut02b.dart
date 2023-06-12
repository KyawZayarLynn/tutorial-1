import 'dart:io';

void main() {
  stdout.write('Enter a year: ');
  int year = int.parse(stdin.readLineSync()!);

  bool IsLeapYear(int year) {
    if (year % 4 != 0) {
      return false;
    }
    else if (year % 100 == 0 && year % 400 != 0) {
      return false;
    }
    return true;
  }

  if (IsLeapYear(year)) {
    print('$year is a leap year.');
  } else {
    print('$year is not a leap year');
  }
}
