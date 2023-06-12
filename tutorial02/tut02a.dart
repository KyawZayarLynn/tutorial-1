bool IsPalindrome(String text) {
  String reversedText = text.split('').reversed.join('');
  return text == reversedText;
}

void main() {
  String input = 'racecar';
  bool IsPalimedromeResult = IsPalindrome(input);

  if (IsPalimedromeResult) {
    print('$input is palindrome');
  } else {
    print('$input is not plindrome');
  }
}
