class User {
  final int id, upVote;
  final String name;
  final String email;
  final String password, username;
  User({
    required this.id,
    required this.username,
    this.upVote = 0,
    required this.name,
    required this.email,
    required this.password,
  });
}
