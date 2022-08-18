import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/main.dart';
import 'package:music_player/screens/main_player/screen_main_player.dart';
import 'package:music_player/widgets/home_song_list_tile.dart';
import 'package:on_audio_query/on_audio_query.dart';

class LocalSongListBuilder extends StatefulWidget {
  const LocalSongListBuilder({Key? key}) : super(key: key);

  @override
  State<LocalSongListBuilder> createState() => _LocalSongListBuilderState();
}

class _LocalSongListBuilderState extends State<LocalSongListBuilder> {
  final _audioQuery = OnAudioQuery();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SongModel>>(
      future: _audioQuery.querySongs(
        sortType: null,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
        ignoreCase: true,
      ),
      builder: (context, item) {
        if (item.data == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (item.data!.isEmpty) {
          return const Center(
              child: Text(
            'No songs found',
            style: TextStyle(
              color: Color.fromARGB(255, 219, 242, 39),
            ),
          ));
        }
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) => HomeSongListTile(
            songInfo: item.data![index],
            songDuration: item.data![index].duration! / 60000,
            songIndex: index,
            test: test,
          ),
          itemCount: item.data!.length,
        );
      },
    );
  }
}
