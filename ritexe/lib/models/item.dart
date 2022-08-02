class Item {
  final String title, username, email;
  final DateTime date;
  final int quantity;
  Item(
      {required this.title,
      required this.email,
      this.username = "unknown",
      required this.date,
      required this.quantity});
}
