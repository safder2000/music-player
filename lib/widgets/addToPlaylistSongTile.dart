import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:music_player/db/all_songs.dart';
import 'package:music_player/db/functions/Boxes.dart';
import 'package:music_player/widgets/addToFavorite.dart';
import 'package:music_player/widgets/addToPlaylistTile.dart';

import 'package:music_player/widgets/miniplayer.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:music_player/db/functions/player.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

import 'package:flutter/material.dart';

import 'package:music_player/widgets/home_song_list_tile.dart';

import 'package:on_audio_query/on_audio_query.dart';

class AddToPlalistTileBuilder extends StatefulWidget {
  List<Audio> homeBuildList = [];
  String playlistName;
  AddToPlalistTileBuilder(
      {Key? key, required this.homeBuildList, required this.playlistName})
      : super(key: key);

  @override
  State<AddToPlalistTileBuilder> createState() =>
      _AddToPlalistTileBuilderState();
}

class _AddToPlalistTileBuilderState extends State<AddToPlalistTileBuilder> {
  final _audioQuery = OnAudioQuery();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => SongTile(
        homeBuildList: widget.homeBuildList,
        songIndex: index,
        playlistName: widget.playlistName,
      ),
      itemCount: widget.homeBuildList.length,
    );
  }
}

class SongTile extends StatefulWidget {
  SongTile({
    Key? key,
    required this.homeBuildList,
    required this.playlistName,
    this.songIndex,
    this.songImg = const AssetImage('assets/images/defult.jpg'),
  }) : super(key: key);
  List<Audio> homeBuildList = [];
  AssetImage songImg;
  final songIndex;
  String playlistName;

  @override
  State<SongTile> createState() => _SongTileState();
}

class _SongTileState extends State<SongTile> {
  Object? _value = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    addToPlayList();
                  },
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                            alignment: Alignment.topCenter,
                            image: widget.songImg,
                            fit: BoxFit.fill,
                          ),
                        ),
                        height: 50,
                        width: 50,
                        child: SizedBox(
                          child: QueryArtworkWidget(
                            id: int.parse(widget
                                .homeBuildList[widget.songIndex].metas.id!),
                            type: ArtworkType.AUDIO,
                            artworkBorder: BorderRadius.circular(8),
                            nullArtworkWidget: Image(
                              image: AssetImage('assets/images/defult.jpg'),
                            ),
                            format: ArtworkFormat.PNG,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 235,
                            child: Text(
                              widget
                                  .homeBuildList[widget.songIndex].metas.title!,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          SizedBox(
                            width: 235,
                            child: Text(
                              '${widget.homeBuildList[widget.songIndex].metas.artist}',
                              style: const TextStyle(
                                  color: Color.fromARGB(150, 255, 255, 255),
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.white30,
          ),
        ],
      ),
    );
  }

  durationCovert() {
    List<String> temp =
        double.parse('${widget.homeBuildList[widget.songIndex].metas.album}')
            .toStringAsFixed(1)
            .split('')
            .sublist(0, 3);
    String durationText = '${temp[0]}:${temp[1]}${temp[2]}';
    return durationText;
  }

  addToPlayList() {
    final playList = box.values.toList().cast<List>();

    if (widget.playlistName == "favorite") {
      Favorite.AddToFavorite(
        context: context,
        songId: widget.homeBuildList[widget.songIndex].metas.id!,
      );
      Navigator.pop(context);
    }
    if (widget.playlistName != "favorite") {
      Favorite.AddSongToPlaylist(
        name: widget.playlistName,
        songId: widget.homeBuildList[widget.songIndex].metas.id!,
        context: context,
      );
      setState(() {});
      Navigator.pop(context);
    }
  }
}
