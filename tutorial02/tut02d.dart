import 'dart:io';

void main() {
  List<String> Letters = ['A', 'B', 'C', 'D', 'E'];
  print('$Letters this is original array');

  stdout.write('Enter the first element you want to swap: ');
  String firstElement = stdin.readLineSync()!;
  stdout.write('Enter the second element you want to swap: ');
  String secondElement = stdin.readLineSync()!;

  int firstElementIndex = Letters.indexOf(firstElement);
  int secondElementIndex = Letters.indexOf(secondElement);

  if (firstElementIndex >= 0 && secondElementIndex >= 0) {
    String temp = Letters[firstElementIndex];
    Letters[firstElementIndex] = Letters[secondElementIndex];
    Letters[secondElementIndex] = temp;
    print('$Letters is your swaped array');
  } else {
    print('The elements you entered are not found in this array');
  }
}
