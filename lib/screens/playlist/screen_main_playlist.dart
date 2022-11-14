import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:iconify_flutter/iconify_flutter.dart'; // For Iconify Widget
import 'package:iconify_flutter/icons/carbon.dart';

import 'package:music_player/application/playlist/playlist_bloc.dart';

import 'package:music_player/db/functions/getAllSongs.dart';
import 'package:music_player/db/functions/player.dart';
import 'package:music_player/widgets/addToPlaylistSongTile.dart';

import 'package:music_player/widgets/miniplayer.dart';

import 'package:music_player/screens/playlist/widgets/playlist_song_tile_builder.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class ScreenMainPlaylist extends StatelessWidget {
  ScreenMainPlaylist({Key? key, required this.playlistName}) : super(key: key);

  String playlistName;

  @override
  Widget build(BuildContext context) {
    // context.read<Bloc>().add(*event*);
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 1, 64, 64),
        title: Text(
          playlistName,
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
                        ShowAllSongs(context: context);
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
      body: Container(
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
        child: GlowingOverscrollIndicator(
          axisDirection: AxisDirection.down,
          color: Color.fromARGB(0, 226, 255, 9),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 219, 242, 39),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          )),
                      child: BlocBuilder<PlaylistBloc, PlaylistState>(
                        builder: (context, state) {
                          return Row(
                            children: [
                              IconButton(
                                icon: const Iconify(
                                  Carbon.play,
                                  color: Color.fromARGB(255, 27, 82, 72),
                                  size: 35,
                                ),
                                onPressed: () {
                                  state.songs.isEmpty
                                      ? EmptyPlaylist(context: context)
                                      : PlayAll(
                                          context: context,
                                          audioFile: state.songs);
                                },
                              ),
                              const Text(
                                'Play All',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 27, 82, 72),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
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
                          // IconButton(
                          //     onPressed: () {},
                          //     icon: const Iconify(
                          //       Carbon.repeat,
                          //       color: Color.fromARGB(
                          //           255, 218, 242, 39),
                          //       size: 22,
                          //     ))
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
                child: PlaylistSongListBuilder(
                  playlistName: playlistName,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ShowAllSongs({required context}) {
    List<Audio> allSongs = GetAll.getAllAudio();
    showModalBottomSheet(
      backgroundColor: Color.fromARGB(255, 1, 64, 64),
      context: context,
      builder: (context) => ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'Add To Playlist',
              style: TextStyle(
                fontSize: 22,
                color: Color.fromARGB(255, 219, 242, 39),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.515,
            child: AddToPlalistTileBuilder(
              homeBuildList: allSongs,
              playlistName: playlistName,
            ),
          ),
        ],
      ),
    );
  }

  EmptyPlaylist({required context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        key: scaffoldKey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.red,
        content: Text('Add some songs to the playlist',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 92),
            )),
      ),
    );
  }

  PlayAll({required context, required List<Audio> audioFile}) {
    showModalBottomSheet(
      backgroundColor: Color.fromARGB(0, 1, 64, 64),
      context: context,
      builder: (context) => MiniPlayer(
        songIndex: 0,
        // assetsAudioPlayer: assetsAudioPlayer,
        homeBuildList: audioFile,
      ),
    );

    Player.openPlayer(audioFile, 0, context);
  }
}
