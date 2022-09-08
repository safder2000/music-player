import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/db/functions/Boxes.dart';
import 'package:music_player/main.dart';
import 'package:music_player/screens/playlist/widgets/playlist_song_tile.dart';
import 'package:music_player/screens/screen_main_player.dart';
import 'package:music_player/screens/screen_splash.dart';
import 'package:music_player/widgets/home_song_list_tile.dart';

import 'package:music_player/widgets/song_list.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PlaylistSongListBuilder extends StatefulWidget {
  List<Audio> homeBuildList = [];
  String? playlistName;
  PlaylistSongListBuilder({
    Key? key,
    required this.homeBuildList,
    required this.playlistName,
  }) : super(key: key);

  @override
  State<PlaylistSongListBuilder> createState() => _PlaylistSongListState();
}

class _PlaylistSongListState extends State<PlaylistSongListBuilder> {
  final _audioQuery = OnAudioQuery();
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<List>>(
      valueListenable: Boxes.getList().listenable(),
      builder: (BuildContext ctx, box, _) {
        return ListView.builder(
          itemBuilder: (context, index) => PlaylistSongTile(
            playlistName: widget.playlistName,
            homeBuildList: widget.homeBuildList,
            index: index,
            // assetsAudioPlayer: assetsAudioPlayer,
          ),
          itemCount: widget.homeBuildList.length,
        );
      },
    );
  }
  // );
}
// }
