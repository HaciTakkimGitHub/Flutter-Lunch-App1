const int itemsPerPage = 20;

class ItemPage<T> {
  final List<T> items;

  final int startingIndex;

  final bool hasNext;

  ItemPage({
    required this.items,
    required this.startingIndex,
    required this.hasNext,
  });
}
