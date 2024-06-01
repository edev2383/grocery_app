class Couple<T, R> {
  final T first;
  final R second;

  Couple(this.first, this.second);

  @override
  String toString() {
    return 'Couple{first: $first, second: $second}';
  }
}
