class Answer {
  final int ansId, upVote, downVote, qsId, userId;
  final String ans;
  final bool isUpvoted, isDownvoted;
  Answer(
      {required this.ans,
      this.isUpvoted = false,
      this.isDownvoted = false,
      this.ansId = 0,
      this.downVote = 0,
      required this.qsId,
      this.upVote = 0,
      required this.userId});
}
