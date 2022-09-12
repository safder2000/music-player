import 'package:assets_audio_player/assets_audio_player.dart';

import 'package:flutter/material.dart';

import 'package:music_player/widgets/home_song_list_tile.dart';

import 'package:on_audio_query/on_audio_query.dart';

class LocalSongListBuilder extends StatefulWidget {
  List<Audio> homeBuildList = [];
  LocalSongListBuilder({Key? key, required this.homeBuildList})
      : super(key: key);

  @override
  State<LocalSongListBuilder> createState() => _LocalSongListBuilderState();
}

class _LocalSongListBuilderState extends State<LocalSongListBuilder> {
  final _audioQuery = OnAudioQuery();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => HomeSongListTile(
        homeBuildList: widget.homeBuildList,
        songIndex: index,
      ),
      itemCount: widget.homeBuildList.length,
    );
  }
}
