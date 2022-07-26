class Item {
  final String title, username;
  final DateTime date;
  final int quantity;
  Item(
      {required this.title,
      this.username = "unknown",
      required this.date,
      required this.quantity});
}
