import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';

import 'package:music_player/application/playlist/playlist_bloc.dart';

import 'package:music_player/db/functions/player.dart';

import 'package:music_player/widgets/miniplayer.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PlaylistSongListBuilder extends StatelessWidget {
  String playlistName;
  PlaylistSongListBuilder({
    Key? key,
    required this.playlistName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<PlaylistBloc>().add(PlaylistSongs(listKey: playlistName));
    return
        // ValueListenableBuilder<Box<List>>(
        //   valueListenable: Boxes.getList().listenable(),
        //   builder: (BuildContext ctx, box, _) {
        //     return
        BlocBuilder<PlaylistBloc, PlaylistState>(
      builder: (context, state) {
        log('playlist rebuilded');

        if (state.songs.isEmpty) {
          return Center(
            child: Text(
              'Empty List',
              style: TextStyle(color: Colors.white70),
            ),
          );
        } else {
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
                                songIndex: index,
                                // assetsAudioPlayer: assetsAudioPlayer,
                                homeBuildList: state.songs,
                              ),
                            );

                            Player.openPlayer(state.songs, index, context);
                          },
                          child: Row(
                            children: [
                              const SizedBox(width: 10),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
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
                                    id: int.parse(state.songs[index].metas.id!),
                                    type: ArtworkType.AUDIO,
                                    artworkBorder: BorderRadius.circular(8),
                                    nullArtworkWidget: Image(
                                      image: AssetImage(
                                          'assets/images/defult.jpg'),
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
                                      state.songs[index].metas.title!,
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
                                      '${state.songs[index].metas.artist}',
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              150, 255, 255, 255),
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
                            context.read<PlaylistBloc>().add(RemoveFromPlaylist(
                                index: index, playlistName: playlistName));
                            // BlocProvider.of<PlaylistBloc>(context)
                            //     .add(PlaylistSongs(listKey: playlistName));
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
                              '${durationCovert(homeBuildList: state.songs, index: index)}',
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
            itemCount: state.songs.length,
          );
        }
      },
    );
    //   },
    // );
  }

  // removeFromPlaylist(index) async {
  //   final songBox = Boxes.getSongs();
  //   final Listbox = Boxes.getList();
  //   // final box = Boxes.getList();

  //   List<AllSongs> dbSongs = songBox.values.toList().cast<AllSongs>();
  //   List? thisList = Listbox.get(widget.playlistName);

  //   final temp = databaseSongs(dbSongs, widget.homeBuildList[index].metas.id!);
  //   thisList!
  //       .removeWhere((element) => element.id.toString() == temp.id.toString());
  //   await Listbox.put(widget.playlistName!, thisList);
  //   // final playList = box.values.toList().cast<List>();
  //   // List playListName = box.keys.toList();
  //   setState(() {
  //     widget.homeBuildList =
  //         GetAll.getPlaylist(playlistName: widget.playlistName!);
  //   });
  // }

  durationCovert({required int index, required List homeBuildList}) {
    List<String> temp = double.parse('${homeBuildList[index].metas.album}')
        .toStringAsFixed(1)
        .split('')
        .sublist(0, 3);
    String durationText = '${temp[0]}:${temp[1]}${temp[2]}';
    return durationText;
  }
  // );
}
// }
