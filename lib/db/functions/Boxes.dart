import 'package:hive/hive.dart';
import 'package:music_player/db/all_songs.dart';

class Boxes {
  static Box<List> getList() => Hive.box<List>('SongsList_db');
  static Box<AllSongs> getSongs() => Hive.box<AllSongs>('allSongs_db');
}

// class SngBoxes {
//   static Box<AllSongs> getAll() => Hive.box<AllSongs>('allSongs_db');
//   // static Box<AllSongs> getAll() => Hive.box<AllSongs>('allSongs_db');
// }



// class Boxdes {
//   static Box<List>? _box;

//   static Box<List> getInstance() {
//     return _box = Hive.box('allSongs_db');
//   }
// }