import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:music_player/db/functions/Boxes.dart';

final box = Boxes.getList();
final playList = box.values.toList().cast<List>();

newPlayList(
  List<Audio> _newPlayList,
) {
  playList.add(_newPlayList);
  log('new playlist created');
}
