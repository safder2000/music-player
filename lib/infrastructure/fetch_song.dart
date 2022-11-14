import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:music_player/db/all_songs.dart';
import 'package:music_player/db/functions/Boxes.dart';
import 'package:on_audio_query/on_audio_query.dart';

class FetchSong {
  static Future<List<Audio>> fetchAllSong() async {
    final _audioQuery = OnAudioQuery();
    final listBox = Boxes.getList();
    final songBox = Boxes.getSongs();
    List<SongModel> fetchedSongs = [];
    List<SongModel> allSongs = [];
    List<Audio> filterdSongs = [];
    fetchedSongs =
        await _audioQuery.querySongs(sortType: SongSortType.DISPLAY_NAME);

    for (var element in fetchedSongs) {
      if (element.fileExtension == "mp3") {
        allSongs.add(element);
      }
    }
    allSongs.sort((a, b) {
      return a.title.compareTo(b.title);
    });
//change
    for (var audio in allSongs) {
      final temp = AllSongs(
        uri: audio.uri,
        title: audio.title,
        artist: audio.artist,
        id: audio.id,
        duration: audio.duration,
        dateModified: audio.dateModified,
      );

      await songBox.put(audio.id, temp);
      List<dynamic> favKeys = listBox.keys.toList();
      if (!favKeys.contains("favorite")) {
        List<dynamic> likedSongs = [];
        await listBox.put("favorite", likedSongs);
      }
      if (!favKeys.contains("recent")) {
        List<dynamic> recentlyPlayed = [];
        await listBox.put("recent", recentlyPlayed);
      }
    }
    // await listBox.put("mainSongListBox", afterMapping);

    // changes
    List<AllSongs> dbSongs = songBox.values.toList().cast<AllSongs>();

    // List<AllSongs> dbSongs = listBox.get("mainSongListBox") as List<AllSongs>;
    // dbSongs.sort((a, b) {
    //   return a.dateModified!.compareTo(b.dateModified!);
    // });
    for (var element in dbSongs) {
      filterdSongs.add(
        Audio.file(
          element.uri.toString(),
          metas: Metas(
              title: element.title,
              id: element.id.toString(),
              artist: element.artist,
              album: element.duration!.toStringAsFixed(2)),
        ),
      );
    }
    filterdSongs.sort((a, b) {
      return a.metas.title!.compareTo(b.metas.title!);
    });
    List<Audio> audioFiltered = [];
    for (var a in filterdSongs) {
      List _temp = a.metas.title!.split('-');
      if (_temp[0] != 'AUD') {
        audioFiltered.add(a);
      }
    }
    return audioFiltered;
    // setState(() {});
  }
}
