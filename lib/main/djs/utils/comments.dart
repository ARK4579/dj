List<String> getSingleLineCommentOnMultipleLines(String? line) {
  var comments = <String>[];

  if (line != null) {
    comments.add('// $line');
  }

  return comments;
}
