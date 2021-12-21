import 'package:dictionary/models/word.dart';

class WordDetails extends Word {
  String? _audioUK;
  String? _audioUS;

  late Map<String, dynamic> _value;
  List? _definitions;
  List? _synonyms;
  List? _antonyms;
  List? _examples;
  String? _phonetic;
  String? _formality;

  void setValue(Map<String, dynamic> value) {
    _value = value;
    setDefinition();
    try {
      _phonetic =
          _value['results'][0]['lexicalEntries'][0]['entries'][0]['pronunciations'][0]['phoneticSpelling'];
    } on NoSuchMethodError {
      _phonetic = null;
    }
    try {
      _audioUK = _value['results'][0]['lexicalEntries'][0]['entries'][0]['pronunciations'][0]['audioFile']
          .toString();
    } on NoSuchMethodError {
      _audioUK = null;
    }
    _examples = _value['results'][0]['lexicalEntries'][0]['entries'][0]['senses'][0]['examples'];

    _synonyms = _value['results'][0]['lexicalEntries'][0]['entries'][0]['senses'][0]['synonyms'];
    _antonyms = _value['results'][0]['lexicalEntries'][0]['entries'][0]['senses'][0]['antonyms'];
  }

  //methods
  void setDefinition() {
    _definitions = [];
    for (int i = 0; i < _value['results'][0]['lexicalEntries'].length; i++) {
      _definitions!.addAll(
        _value['results'][0]['lexicalEntries'][i]['entries'][0]['senses'][0]['definitions'],
      );
    }
  }

  // void setSynonym(List? synonyms) {
  //   _synonyms = synonyms;
  //   print(_synonyms);
  // }
  //
  // void setAntonym(List? antonyms) {
  //   _antonyms = antonyms;
  //   print(_antonyms);
  // }
  //
  // void setAudioUK(String? audioUK) {
  //   _audioUK = audioUK;
  //   print(_audioUK);
  // }
  //
  // void setAudioUS(String? audioUS) {
  //   _audioUS = audioUS;
  //   print(_audioUS);
  // }
  //
  // void setExample(List? examples) {
  //   _examples = examples;
  //   print(_examples);
  // }
  //
  // void setPhonetic(String? phonetic) {
  //   _phonetic = phonetic;
  //   print(_phonetic);
  // }

  //gets
  List? get definitions => _definitions;
  List? get synonyms => _synonyms;
  List? get antonyms => _antonyms;
  String? get audioUK => _audioUK;
  String? get audioUS => _audioUS;
  List? get examples => _examples;
  String? get phonetic => _phonetic;
  String? get formality => _formality;
  Map<String, dynamic> get value => _value;
}
