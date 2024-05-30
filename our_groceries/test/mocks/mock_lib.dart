import 'dart:math';
import 'package:english_words/english_words.dart';

String randomString(int length) {
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  final random = Random.secure();
  return List.generate(length, (index) => chars[random.nextInt(chars.length)])
      .join();
}

String randomWordPair() {
  // use `english_words` package to generate random words
  var random = Random.secure();
  var adj = adjectives[random.nextInt(adjectives.length - 1)];
  var noun = nouns[random.nextInt(adjectives.length - 1)];
  return '${adj.toUpperCase()} ${noun.toUpperCase()}';
}
