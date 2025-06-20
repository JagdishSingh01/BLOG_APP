int calculateReadingTime(String content) {
  final wordCount = content.split(RegExp(r'\s+')).length;
  final readingTime = wordCount / 225; //225 is : 225 words per second , it's average reading time
  return readingTime.ceil();
}
