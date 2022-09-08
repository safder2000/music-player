import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:music_player/db/all_songs.dart';
import 'package:music_player/db/functions/Boxes.dart';
import 'package:music_player/widgets/addToPlaylistTile.dart';

import 'package:music_player/widgets/miniplayer.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:music_player/db/functions/player.dart';

class PlaylistSongTile extends StatefulWidget {
  PlaylistSongTile({
    Key? key,
    required this.homeBuildList,
    required this.playlistName,
    this.index,
    // required this.assetsAudioPlayer,
    this.songImg = const AssetImage('assets/images/defult.jpg'),
  }) : super(key: key);
  List<Audio> homeBuildList = [];
  AssetImage songImg;
  String? playlistName;

  final index;

  // AssetsAudioPlayer assetsAudioPlayer;
  // final AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer.withId("0");

  @override
  State<PlaylistSongTile> createState() => _PlaylistSongTileState();
}

class _PlaylistSongTileState extends State<PlaylistSongTile> {
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
                    showBottomSheet(
                      backgroundColor: Color.fromARGB(0, 1, 64, 64),
                      context: context,
                      builder: (context) => MiniPlayer(
                        // songIndex: widget.songIndex,
                        // assetsAudioPlayer: assetsAudioPlayer,
                        homeBuildList: widget.homeBuildList,
                      ),
                    );

                    openPlayer(widget.homeBuildList, widget.index, context);
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
                            id: int.parse(
                                widget.homeBuildList[widget.index].metas.id!),
                            type: ArtworkType.AUDIO,
                            artworkBorder: BorderRadius.circular(8),
                            nullArtworkWidget: Image(
                              image: AssetImage('assets/images/defult.jpg'),
                            ),
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
                              widget.homeBuildList[widget.index].metas.title!,
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
                              '${widget.homeBuildList[widget.index].metas.artist}',
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
              PopupMenuButton<int>(
                color: Color.fromARGB(255, 1, 64, 64),
                onSelected: (result) {
                  if (result == 1) {
                    removeFromPlaylist();
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 1,
                    // row has two child icon and text
                    child: Row(
                      children: [
                        // Icon(
                        //   Icons.remove,
                        //   color: Color.fromARGB(255, 219, 242, 39),
                        // ),
                        // SizedBox(
                        //   // sized box with width 10
                        //   width: 10,
                        // ),
                        Text(
                          "remove from Playlist",
                          style: TextStyle(
                            color: Color.fromARGB(255, 219, 242, 39),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
                child: Row(
                  children: [
                    Text(
                      '${durationCovert()}',
                      style: const TextStyle(
                          color: Color.fromARGB(150, 255, 255, 255),
                          fontSize: 13),
                    ),
                    const Iconify(
                      Carbon.overflow_menu_vertical,
                      color: Color.fromARGB(150, 255, 255, 255),
                      size: 26,
                    ),
                  ],
                ),
              )
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
        double.parse('${widget.homeBuildList[widget.index].metas.album}')
            .toStringAsFixed(1)
            .split('')
            .sublist(0, 3);
    String durationText = '${temp[0]}:${temp[1]}${temp[2]}';
    return durationText;
  }

  removeFromPlaylist() async {
    final songBox = Boxes.getSongs();
    final Listbox = Boxes.getList();

    List<AllSongs> dbSongs = songBox.values.toList().cast<AllSongs>();
    List? thisList = Listbox.get(widget.playlistName);

    final tempSong =
        databaseSongs(dbSongs, widget.homeBuildList[widget.index].metas.id!);
    thisList!.removeWhere(
        (element) => element.id.toString() == tempSong.id.toString());
    await box.put(widget.playlistName!, thisList);
    // final playList = box.values.toList().cast<List>();
    // List playListName = box.keys.toList();
    setState(() {});
  }

  AllSongs databaseSongs(List<AllSongs> songs, String id) {
    return songs.firstWhere(
      (element) => element.id.toString().contains(id),
    );
  }
}
