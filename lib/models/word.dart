class Word {
  late String _word;
  late String _uri;

  void setWord(String word) {
    _word = word;
  }

  String getWord() => _word;

  String uri() {
    _uri = _word.trim().toLowerCase();
    _uri = Uri.encodeFull(_uri);
    return _uri;
  }
}
