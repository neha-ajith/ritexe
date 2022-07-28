class Answer {
  final int ansId, upVote, downVote, qsId, userId;
  final String ans;
  Answer(
      {required this.ans,
      this.ansId = 0,
      this.downVote = 0,
      required this.qsId,
      this.upVote = 0,
      required this.userId});
}
