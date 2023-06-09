import 'dart:io';

void main() {
  List<String> Letters = ['A', 'B', 'C', 'D', 'E'];
  print('$Letters this is original array');

  stdout.write('Enter the letter you want to remove:');
  String element = stdin.readLineSync()!;
  print(element);

  Letters.remove(element);
  print('$Letters this is removed array.');
}
