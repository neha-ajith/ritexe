class QuestionThumbNail {
  final int id;
  final String title;
  int noOfAnswers;
  QuestionThumbNail(
      {required this.id, required this.title, this.noOfAnswers = 0});
}
