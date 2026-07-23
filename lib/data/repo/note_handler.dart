import 'package:flutter/cupertino.dart';
import 'package:sebat/data/entity/note.dart';

class NoteHandler with ChangeNotifier {
  NoteHandler._internal();
  static final NoteHandler instance = NoteHandler._internal();
  factory NoteHandler() => instance;

  static final String _topic = "Türkiye'de Geri Kalmışlığın Tarihi";
  String get topic => _topic;

  static final List<Note> _notes = [
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

  final String _filter = "";

  List<Note> get notes =>
      _notes.where((note) => note.body.contains(_filter)).toList();
}
