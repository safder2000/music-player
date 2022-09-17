import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:music_player/db/all_songs.dart';
import 'package:music_player/db/functions/Boxes.dart';
import 'package:music_player/db/functions/getAllSongs.dart';
import 'package:music_player/db/functions/player.dart';
import 'package:music_player/main.dart';
import 'package:music_player/screens/playlist/widgets/playlist_song_tile.dart';
import 'package:music_player/screens/screen_main_player.dart';
import 'package:music_player/screens/screen_splash.dart';
import 'package:music_player/widgets/home_song_list_tile.dart';
import 'package:music_player/widgets/miniplayer.dart';

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
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  final _audioQuery = OnAudioQuery();
  @override
  Widget build(BuildContext context) {
    List<Audio> newList =
        GetAll.getPlaylist(playlistName: widget.playlistName!);
    return ValueListenableBuilder<Box<List>>(
      valueListenable: Boxes.getList().listenable(),
      builder: (BuildContext ctx, box, _) {
        return ListView.builder(
          itemBuilder: (context, index) => Container(
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

                          Player.openPlayer(
                              widget.homeBuildList, index, context);
                        },
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                // image: DecorationImage(
                                //   alignment: Alignment.topCenter,
                                //   image: widget.songImg,
                                //   fit: BoxFit.fill,
                                // ),
                              ),
                              height: 50,
                              width: 50,
                              child: SizedBox(
                                child: QueryArtworkWidget(
                                  id: int.parse(
                                      widget.homeBuildList[index].metas.id!),
                                  type: ArtworkType.AUDIO,
                                  artworkBorder: BorderRadius.circular(8),
                                  nullArtworkWidget: Image(
                                    image:
                                        AssetImage('assets/images/defult.jpg'),
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
                                    widget.homeBuildList[index].metas.title!,
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
                                    '${widget.homeBuildList[index].metas.artist}',
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(150, 255, 255, 255),
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
                          removeFromPlaylist(index);
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
                            '${durationCovert(index)}',
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
          ),
          itemCount: newList.length,
        );
      },
    );
  }

  removeFromPlaylist(index) async {
    final songBox = Boxes.getSongs();
    final Listbox = Boxes.getList();
    // final box = Boxes.getList();

    List<AllSongs> dbSongs = songBox.values.toList().cast<AllSongs>();
    List? thisList = Listbox.get(widget.playlistName);

    final temp = databaseSongs(dbSongs, widget.homeBuildList[index].metas.id!);
    thisList!
        .removeWhere((element) => element.id.toString() == temp.id.toString());
    await Listbox.put(widget.playlistName!, thisList);
    // final playList = box.values.toList().cast<List>();
    // List playListName = box.keys.toList();
    setState(() {
      widget.homeBuildList =
          GetAll.getPlaylist(playlistName: widget.playlistName!);
    });
  }

  AllSongs databaseSongs(List<AllSongs> songs, String id) {
    return songs.firstWhere(
      (element) => element.id.toString().contains(id),
    );
  }

  durationCovert(index) {
    List<String> temp =
        double.parse('${widget.homeBuildList[index].metas.album}')
            .toStringAsFixed(1)
            .split('')
            .sublist(0, 3);
    String durationText = '${temp[0]}:${temp[1]}${temp[2]}';
    return durationText;
  }
  // );
}
// }
