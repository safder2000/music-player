import 'dart:developer';
import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../widgets/miniplayer.dart';

// class Player {
final AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer.withId("0");
// Player({required this.SongList, required this.index, this.context});
// List<Audio> SongList;
// dynamic context;
// int index;
Audio find(List<Audio> source, String fromPath) {
  return source.firstWhere((element) => element.path == fromPath);
}

void openPlayer(
  List<Audio> playingList,
  songIndex,
  BuildContext context,
) async {
  // int _selectedIndex;
  // List<Audio> playingList=[];
  try {
    await assetsAudioPlayer.open(
      Playlist(audios: playingList, startIndex: songIndex),
      showNotification: true,
      autoStart: true,
    );
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
