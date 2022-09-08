import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iconify_flutter/iconify_flutter.dart'; // For Iconify Widget
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:music_player/db/all_songs.dart';
import 'package:music_player/db/functions/Boxes.dart';
import 'package:music_player/db/functions/getAllSongs.dart';
import 'package:music_player/db/functions/player.dart';
import 'package:music_player/widgets/home_song_list_builder.dart';

import 'package:music_player/widgets/miniplayer.dart';

import 'package:music_player/screens/playlist/widgets/playlist_song_tile_builder.dart';

class ScreenMainPlaylist extends StatefulWidget {
  ScreenMainPlaylist(
      {Key? key, required this.playlist, required this.playlistName})
      : super(key: key);
  List<AllSongs> playlist;
  String? playlistName;

  @override
  State<ScreenMainPlaylist> createState() => ScreenMainPlayliststate();
}

class ScreenMainPlayliststate extends State<ScreenMainPlaylist> {
  @override
  void initState() {
    // TODO: implement initState
    loadPlaylist();
    super.initState();
  }

  List<Audio> playlistSongs = [];

  loadPlaylist() {
    for (var element in widget.playlist) {
      playlistSongs.add(
        Audio.file(
          element.uri.toString(),
          metas: Metas(
              title: element.title,
              id: element.id.toString(),
              artist: element.artist,
              album: element.duration!.toStringAsFixed(2)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 1, 64, 64),
        title: Text(
          widget.playlistName!,
          style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        // leading: IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
        // leading: IconButton(
        //     onPressed: () {},
        //     icon: Iconify(
        //       Ph.arrow_line_left,
        //       color: Color.fromARGB(255, 219, 242, 39),
        //     )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 219, 242, 39),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                  )),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        ShowAllSongs();
                      },
                      icon: const Iconify(
                        Carbon.add,
                        color: Color.fromARGB(255, 27, 82, 72),
                        size: 35,
                      )),
                  // IconButton(
                  //     onPressed: () {},
                  //     icon: const Iconify(
                  //       Carbon.delete,
                  //       color: Color.fromARGB(255, 28, 88, 77),
                  //       size: 22,
                  //     ))
                ],
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  // image: DecorationImage(
                  //   alignment: Alignment.topCenter,
                  //   image: AssetImage('assets/images/background2.jpg'),
                  //   fit: BoxFit.fill,
                  // ),
                  color: Color.fromARGB(255, 1, 64, 64)),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [
                      0.00,
                      0.00,
                      0.7,
                    ],
                    colors: [
                      Color.fromARGB(255, 1, 64, 64),
                      Color.fromARGB(255, 1, 64, 64),
                      Color.fromARGB(182, 0, 0, 0),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.794,
                      child: GlowingOverscrollIndicator(
                        axisDirection: AxisDirection.down,
                        color: const Color.fromARGB(255, 154, 109, 109),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 8),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 219, 242, 39),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(40),
                                          bottomRight: Radius.circular(40),
                                        )),
                                    child: InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                          backgroundColor:
                                              Color.fromARGB(0, 1, 64, 64),
                                          context: context,
                                          builder: (context) => MiniPlayer(
                                            // songIndex: widget.songIndex,
                                            // assetsAudioPlayer: assetsAudioPlayer,
                                            homeBuildList: playlistSongs,
                                          ),
                                        );

                                        openPlayer(playlistSongs, 0, context);
                                      },
                                      child: Row(
                                        children: [
                                          IconButton(
                                            icon: const Iconify(
                                              Carbon.play,
                                              color: Color.fromARGB(
                                                  255, 27, 82, 72),
                                              size: 35,
                                            ),
                                            onPressed: () {},
                                          ),
                                          const Text(
                                            'Play All',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 27, 82, 72),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 8),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Color.fromARGB(0, 218, 242, 39),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(40),
                                          bottomLeft: Radius.circular(40),
                                        )),
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Iconify(
                                              Carbon.repeat,
                                              color: Color.fromARGB(
                                                  255, 218, 242, 39),
                                              size: 22,
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Expanded(
                                child: SizedBox(
                              // height: MediaQuery.of(context).size.height *
                              //     0.9,
                              child: ValueListenableBuilder<Box<AllSongs>>(
                                  valueListenable:
                                      Boxes.getSongs().listenable(),
                                  builder: (BuildContext ctx, box, _) {
                                    return PlaylistSongListBuilder(
                                      homeBuildList: playlistSongs,
                                      playlistName: widget.playlistName,
                                    );
                                  }

                                  // child: playlistSongs.isEmpty
                                  //     ? LocalSongListBuilder(
                                  //         homeBuildList: playlistSongs)
                                  //     : const Center(
                                  //         child: Text(
                                  //           'Add some songs',
                                  //           style: TextStyle(
                                  //             color: Color.fromARGB(
                                  //                 255, 219, 242, 39),
                                  //           ),
                                  //         ),
                                  //       ),
                                  ),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ShowAllSongs() {
    List<Audio> allSongs = GetAll.getAllAudio();
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
            child: LocalSongListBuilder(
              homeBuildList: allSongs,
            ),
          ),
        ],
      ),
    );
  }
}
