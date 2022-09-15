import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/db/all_songs.dart';
import 'package:music_player/db/functions/Boxes.dart';
import 'package:on_audio_query/on_audio_query.dart';

List<AllSongs> dbSongs = songBox.values.toList().cast<AllSongs>();

final songBox = Boxes.getSongs();

List<SongModel> fetchedSongs = [];
List<Audio> filterdSongs = [];

// List<AllSongs> dbSongs = listBox.get("mainSongListBox") as List<AllSongs>;
class GetAll {
  static List<Audio> getAllAudio() {
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
    return filterdSongs;
  }

  static List<Audio> getPlaylist({required String playlistName}) {
    List<Audio> playlist = [];
    var listBox = Boxes.getList();
    List<AllSongs> playlistSong = listBox.get(playlistName)!.cast<AllSongs>();

    for (var element in playlistSong) {
      playlist.add(
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
    return playlist;
  }

  static QueryArtworkWidget ArtImage({required songId}) {
    String? songId;
    final artwork = QueryArtworkWidget(
      id: int.parse(songId!),
      type: ArtworkType.AUDIO,
      artworkBorder: BorderRadius.circular(8),
      nullArtworkWidget: Image(
        image: AssetImage('assets/images/defult.jpg'),
      ),
      format: ArtworkFormat.PNG,
    );

    return artwork;
  }
}
