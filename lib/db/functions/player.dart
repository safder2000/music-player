import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import '../../widgets/miniplayer.dart';

class Player {
  static bool temp = true;
  static final AssetsAudioPlayer assetsAudioPlayer =
      AssetsAudioPlayer.withId("0");
// Player({required this.SongList, required this.index, this.context});
// List<Audio> SongList;
// dynamic context;
// int index;
  Audio find(List<Audio> source, String fromPath) {
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
    } on Exception {
      log('fetching error......................<<<<<');
    }
  }

  miniPlayer(context, SongList) {
    showBottomSheet(
      backgroundColor: Color.fromARGB(0, 1, 64, 64),
      context: context,
      builder: (context) => MiniPlayer(
        // songIndex: widget.songIndex,
        // assetsAudioPlayer: assetsAudioPlayer,
        homeBuildList: SongList,
      ),
    );
  }
}
