class Notifications {
  final int notId, userId;
  final String username, prodName;
  Notifications(
      {this.notId = 0,
      this.username = "",
      required this.prodName,
      required this.userId});
}
