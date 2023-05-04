class Joke {
  int id;
  String content;
  String author;
  String status;
  DateTime modifiedAt;

  Joke(this.id, this.content, this.author, this.status, this.modifiedAt);

  @override
  String toString() {
    return '$author يقول, $content ($modifiedAt)';
  }
}
