import 'package:flutter/cupertino.dart';
import 'package:sebat/data/entity/note.dart';
import 'package:sebat/data/entity/topic.dart';

class NoteRepo with ChangeNotifier {
  NoteRepo._internal();
  static final NoteRepo instance = NoteRepo._internal();
  factory NoteRepo() => instance;

  Topic _currentTopic = Topic(
    "Türkiye'de Geri Kalmışlığın Tarihi",
    "Mürtezika kelimesi Osmanlı’da bakıma muhtaç, ekonomiye katkısı olmayan ve devletin ilgilendiği kişiler için kullanılır.",
    "22 saat",
    "12 Mart",
    26,
  );

  Topic get currentTopic => _currentTopic;

  void updateTopic(Topic topic) {
    _currentTopic = topic;
  }

  Stream<List<Topic>> getTopicList() async* {
    Future.delayed(Duration(seconds: 1));
    yield [];
  }

  Stream<List<Note>> getNotes(Topic topic) async* {
    Future.delayed(Duration(seconds: 1));
    yield [
      Note(
        0,
        "Mürtezika kelimesi Osmanlı’da bakıma muhtaç, ekonomiye katkısı olmayan ve devletin ilgilendiği kişiler için kullanılır.",
        "2 Mart 2026",
      ),
      Note(
        0,
        "Batılılaşma hareketlerinin Türk iktidarındaki tezahürü ve halka olan etkisi halkın Batı kültürüne benzeyeni kötü olarak görmesine sebep olmuştur. ",
        "1 Mart 2026",
      ),
      Note(
        0,
        "Tarımdaki makineleşme ancak var olan işgücü yetmediğinde, sağlanan fazla işgücüne ihtiyacı bulunan bir sanayinin varlığında önem kazanmaktadır. ",
        "28 Nisan 2026",
      ),
      Note(
        0,
        "Tarımdaki makineleşme ancak var olan işgücü yetmediğinde, sağlanan fazla işgücüne ihtiyacı bulunan bir sanayinin varlığında önem kazanmaktadır. ",
        "28 Nisan 2026",
      ),
      Note(
        0,
        "Tarımdaki makineleşme ancak var olan işgücü yetmediğinde, sağlanan fazla işgücüne ihtiyacı bulunan bir sanayinin varlığında önem kazanmaktadır. ",
        "28 Nisan 2026",
      ),
    ];
  }

  final String _filter = "";
}
