import 'package:assets_audio_player/assets_audio_player.dart';

import 'package:flutter/material.dart';

import 'package:music_player/widgets/home_song_list_tile.dart';

import 'package:on_audio_query/on_audio_query.dart';

class LocalSongListBuilder extends StatelessWidget {
  List<Audio> homeBuildList = [];
  LocalSongListBuilder({Key? key, required this.homeBuildList})
      : super(key: key);

  final _audioQuery = OnAudioQuery();

  @override
  Widget build(BuildContext context) {
    return homeBuildList.isEmpty
        ? Center(
            child: Text(
            'No Songs found',
            style: TextStyle(color: Colors.white60, fontSize: 17),
          ))
        : ListView.builder(
            itemBuilder: (context, index) => HomeSongListTile(
              homeBuildList: homeBuildList,
              songIndex: index,
            ),
            itemCount: homeBuildList.length,
          );
  }
}
