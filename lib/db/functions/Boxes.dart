import 'package:hive/hive.dart';
import 'package:music_player/db/all_songs.dart';

class Boxes {
  static Box<List> getAll() => Hive.box<List>('allSongs_db');
}
// class Boxdes {
//   static Box<List>? _box;

//   static Box<List> getInstance() {
//     return _box = Hive.box('allSongs_db');
//   }
// }