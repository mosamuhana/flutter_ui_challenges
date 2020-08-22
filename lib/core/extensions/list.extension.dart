extension ListExtension<T> on List<T> {
  List<R> indexedMap<R>(R Function(T, int) fn) {
    var list = <R>[];
    for (var i = 0; i < this.length; i++) list.add(fn(this[i], i));
    return list;
  }

  void indexedForEach<R>(void Function(T, int) fn) {
    for (var i = 0; i < this.length; i++) fn(this[i], i);
  }
}
