import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/application/main_player/main_player_bloc.dart';
import 'package:music_player/db/all_songs.dart';
import 'package:music_player/infrastructure/playlist_functions.dart';

import 'Boxes.dart';

final AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer.withId("0");

class Player {
  static bool temp = true;

// Player({required this.SongList, required this.index, this.context});
// List<Audio> SongList;
// dynamic context;
// int index;
  static Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }

  static bool toggleNotification({required bool isNotificationOn}) {
    isNotificationOn
        ? assetsAudioPlayer.showNotification = true
        : assetsAudioPlayer.showNotification = false;
    assetsAudioPlayer.showNotification ? temp = true : temp = false;

    return temp;
  }

  static void openPlayer(
    List<Audio> playingList,
    songIndex,
    BuildContext context,
  ) async {
    // int _selectedIndex;
    // List<Audio> playingList=[];
    try {
      await assetsAudioPlayer.open(
          Playlist(audios: playingList, startIndex: songIndex),
          autoStart: true,
          showNotification: temp);
      context.read<MainPlayerBloc>().add(PlayPause(isPlaying: true));
    } on Exception {
      log('fetching error......................<<<<<');
    }
  }

  // miniPlayer(context, SongList) {
  //   showBottomSheet(
  //     backgroundColor: Color.fromARGB(0, 1, 64, 64),
  //     context: context,
  //     builder: (context) => MiniPlayer(
  //       songIndex: widget.songIndex,
  //       assetsAudioPlayer: assetsAudioPlayer,
  //       homeBuildList: SongList,
  //     ),
  //   );
  // }
  static Future<bool> isFavorate(String? songId) async {
    if (songId == null) {
      return false;
    }
    final listBox = await Boxes.getList();
    final songBox = await Boxes.getSongs();
    final dbSongs = songBox.values.toList().cast<AllSongs>();

    bool isFav;
    List? favourites = listBox.get("favorite");
    final temp = PlaylistFunctions.findSong(dbSongs, songId);
    favourites!
            .where((element) => element.id.toString() == temp.id.toString())
            .isEmpty
        ? isFav = false
        : isFav = true;
    return isFav;
  }

  static pauseSong() {
    assetsAudioPlayer.pause();
  }

  static playSong() {
    assetsAudioPlayer.play();
  }

  static playNextSong() async {
    try {
      await assetsAudioPlayer.next();
      await assetsAudioPlayer.play();
    } on Exception {
      log('Unsupported format');
    }
  }

  static playPreviusSong() async {
    try {
      await assetsAudioPlayer.previous();
      await assetsAudioPlayer.play();
    } on Exception {
      log('Unsupported format');
    }
  }
}
