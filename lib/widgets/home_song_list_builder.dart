import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:music_player/main.dart';
import 'package:music_player/screens/main_player/screen_main_player.dart';
import 'package:music_player/screens/screen_splash.dart';
import 'package:music_player/widgets/home_song_list_tile.dart';
import 'package:music_player/widgets/home_tile_asset.dart';
import 'package:music_player/widgets/song_list.dart';
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
    //===== re ====================
    // return ListView.builder(
    //   itemBuilder: (BuildContext context, int index) => HomeListTile(
    //     songIndex: index,
    //     assetsAudioPlayer: assetsAudioPlayer,
    //   ),
    //   itemCount: songList.length,
    // );
    // return FutureBuilder<List<SongModel>>(
    //   future: _audioQuery.querySongs(
    //     sortType: null,
    //     orderType: OrderType.ASC_OR_SMALLER,
    //     uriType: UriType.EXTERNAL,
    //     ignoreCase: true,
    //   ),
    //   builder: (context, item) {
    //     if (item.data == null) {
    //       return const Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     }
    //     if (item.data!.isEmpty) {
    //       return const Center(
    //           child: Text(
    //         'No songs found',
    //         style: TextStyle(
    //           color: Color.fromARGB(255, 219, 242, 39),
    //         ),
    //       ));
    //     }
    return ListView.builder(
      itemBuilder: (context, index) => HomeSongListTile(
        homeBuildList: widget.homeBuildList,
        songInfo: widget.homeBuildList[index],
        songIndex: index,
        // assetsAudioPlayer: assetsAudioPlayer,
      ),
      itemCount: widget.homeBuildList.length,
    );
  }
  // );
}
// }
