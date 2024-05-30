import 'dart:math';
import 'package:english_words/english_words.dart';

String randomString(int length) {
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  final random = Random.secure();
  return List.generate(length, (index) => chars[random.nextInt(chars.length)])
      .join();
}

String randomWords(int num) {
  // use `english_words` package to generate random words
  return nouns.take(num).join(' ');
}
