import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';

import 'package:music_player/widgets/addToFavorite.dart';
import 'package:music_player/widgets/addToPlaylistTile.dart';
import 'package:music_player/widgets/addToRecent.dart';

import 'package:music_player/widgets/miniplayer.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:music_player/db/functions/player.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class HomeSongListTile extends StatelessWidget {
  HomeSongListTile({
    Key? key,
    required this.homeBuildList,
    this.songIndex,
    this.songImg = const AssetImage('assets/images/defult.jpg'),
  }) : super(key: key);
  List<Audio> homeBuildList = [];
  AssetImage songImg;
  final songIndex;

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
                        songIndex: songIndex,
                        // assetsAudioPlayer: assetsAudioPlayer,
                        homeBuildList: homeBuildList,
                      ),
                    );
                    Recent.AddToRecent(
                        songId: homeBuildList[songIndex].metas.id!);

                    Player.openPlayer(homeBuildList, songIndex, context);
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
                            image: songImg,
                            fit: BoxFit.fill,
                          ),
                        ),
                        height: 50,
                        width: 50,
                        child: SizedBox(
                          child: QueryArtworkWidget(
                            id: int.parse(homeBuildList[songIndex].metas.id!),
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
                              homeBuildList[songIndex].metas.title!,
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
                              '${homeBuildList[songIndex].metas.artist}',
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
                    addToPlayList(context: context);
                  }
                  if (result == 2) {
                    Favorite.AddToFavorite(
                        context: context,
                        songId: homeBuildList[songIndex].metas.id!,
                        key: _scaffoldKey);
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 1,
                    // row has two child icon and text
                    child: Row(
                      children: [
                        Icon(
                          Icons.playlist_add,
                          color: Color.fromARGB(255, 219, 242, 39),
                        ),
                        SizedBox(
                          // sized box with width 10
                          width: 10,
                        ),
                        Text(
                          "Add to Playlist",
                          style: TextStyle(
                            color: Color.fromARGB(255, 219, 242, 39),
                          ),
                        )
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 2,
                    // row has two child icon and text
                    child: Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Color.fromARGB(255, 219, 242, 39),
                        ),
                        SizedBox(
                          // sized box with width 10
                          width: 10,
                        ),
                        Text(
                          "Favorite",
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
    List<String> temp = double.parse('${homeBuildList[songIndex].metas.album}')
        .toStringAsFixed(1)
        .split('')
        .sublist(0, 3);
    String durationText = '${temp[0]}:${temp[1]}${temp[2]}';
    return durationText;
  }

  addToPlayList({required context}) {
    final playList = box.values.toList().cast<List>();
    List playListName = box.keys.toList();
    showModalBottomSheet(
      backgroundColor: Color.fromARGB(0, 1, 64, 64),
      context: context,
      builder: (context) => Column(
        children: [
          Text(
            'Add To Playlist',
            style: TextStyle(
              fontSize: 22,
              color: Color.fromARGB(255, 219, 242, 39),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.515,
            child: ListView.builder(
              itemCount: playList.length,
              itemBuilder: (BuildContext context, int index) => AddToPlayList(
                name: playListName[index].toString(),
                songId: homeBuildList[songIndex].metas.id,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
