import 'dart:developer';
import 'package:music_player/db/all_songs.dart';
import 'package:music_player/db/functions/Boxes.dart';


class Recent {
  Recent();

  static final box = Boxes.getList();

  static AddToRecent({required String songId}) {
    List? recent = box.get("recent");
    final songBox = Boxes.getSongs();

    List<AllSongs> dbSongs = songBox.values.toList().cast<AllSongs>();
    final temp = findSong(dbSongs, songId);
    if (recent!.length >= 10) {
      recent.removeLast();
    }
    recent
            .where((element) => element.id.toString() == temp.id.toString())
            .isEmpty
        ? addToRecent(temp, recent)
        : ReplaceDupe(temp, recent);
  }

  static ReplaceDupe(AllSongs song, List? playlist) async {
    playlist!
        .removeWhere((element) => element.id.toString() == song.id.toString());
    await box.put("recent", playlist);

    log('removed from rencet');
    addToRecent(
      song,
      playlist,
    );
  }

  static addToRecent(
    AllSongs song,
    List? playlist,
  ) async {
    playlist?.add(song);
    List? reversed = playlist?.reversed.toList();
    await box.put("recent", reversed!);

    log('added ${song.title} to recent');
  }

  static AllSongs findSong(List<AllSongs> songs, String id) {
    return songs.firstWhere(
      (element) => element.id.toString().contains(id),
    );
  }
}
