import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/db/all_songs.dart';
import 'package:music_player/db/functions/Boxes.dart';
import 'package:music_player/db/functions/getAllSongs.dart';
import 'package:music_player/widgets/home_song_list_builder.dart';

class Favorite {
  Favorite();

  static final box = Boxes.getList();

  static AddToFavorite({required String songId, required final context}) {
    List? favourites = box.get("favorite");
    final songBox = Boxes.getSongs();

    List<AllSongs> dbSongs = songBox.values.toList().cast<AllSongs>();
    final temp = findSong(dbSongs, songId);
    favourites!
            .where((element) => element.id.toString() == temp.id.toString())
            .isEmpty
        ? addToFavorite(temp, favourites, context)
        : removeFromFavorite(temp, favourites, context);
  }

  static AddSongToPlaylist(
      {required String name, required String songId, required final context}) {
    List? playlist = box.get(name);
    final songBox = Boxes.getSongs();
    List<AllSongs> dbSongs = songBox.values.toList().cast<AllSongs>();
    final temp = findSong(dbSongs, songId!);
    playlist!
            .where((element) => element.id.toString() == temp.id.toString())
            .isEmpty
        ? addToPlaylist(temp, playlist, name, context)
        : alreadyExist(temp, context);
  }

  static addToPlaylist(
      AllSongs song, List? playlist, String name, final context) async {
    playlist?.add(song);
    await box.put(name, playlist!);
    Navigator.pop(context);

    showSnackbar(song, 'added to the playlist',
        Color.fromARGB(255, 219, 242, 39), context);

    log('added ${song.title}');
  }

  static alreadyExist(temp, context) {
    showSnackbar(temp, 'already in the playlist',
        Color.fromARGB(255, 219, 242, 39), context);
    Navigator.pop(context);
  }

  static removeFromFavorite(AllSongs song, List? playlist, context) async {
    playlist!
        .removeWhere((element) => element.id.toString() == song.id.toString());
    await box.put("favorite", playlist);
    showSnackbar(song, ' removed from favorite',
        Color.fromARGB(255, 242, 130, 39), context);

    log('removed');
  }

  static addToFavorite(AllSongs song, List? playlist, context) async {
    playlist?.add(song);
    await box.put("favorite", playlist!);
    showSnackbar(
        song, ' added to favorite', Color.fromARGB(255, 219, 242, 39), context);

    log('added ${song.title}');
  }

  static AllSongs findSong(List<AllSongs> songs, String id) {
    return songs.firstWhere(
      (element) => element.id.toString().contains(id),
    );
  }

  static showSnackbar(AllSongs temp, String string, Color color, context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        duration: Duration(seconds: 2),
        backgroundColor: color,
        content: Text(temp.title! + string,
            style: TextStyle(
              color: Color.fromARGB(255, 1, 71, 58),
            )),
      ),
    );
  }
}
