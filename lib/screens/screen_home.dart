import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'package:iconify_flutter/iconify_flutter.dart'; // For Iconify Widget
import 'package:iconify_flutter/icons/zondicons.dart'; // for Non Colorful Icons

import 'package:iconify_flutter/icons/carbon.dart';

import 'package:music_player/application/home_page/home_page_bloc.dart';
import 'package:music_player/colors/colors.dart';

import 'package:music_player/screens/menu/screen_menu.dart';
import 'package:music_player/screens/playlist/screen_playlist.dart';
import 'package:music_player/screens/screen_search.dart';

import 'package:music_player/widgets/home_song_list_builder.dart';

import 'package:iconify_flutter/icons/ph.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ScreenHome extends StatelessWidget {
  ScreenHome({
    Key? key,
  }) : super(key: key);
  List<Audio> homeBuildList = [];

  //============================= Asset Audio ===================================================================

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 1, 64, 64),
          // leading: IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
          leading: IconButton(
            onPressed: () =>
                ZoomDrawer(menuScreen: ScreenMenu(), mainScreen: ScreenHome()),
            icon: const Iconify(Ph.list, color: kYellow),
          ),
          title: Text(
            'All Songs',
            style: TextStyle(
                color: Color.fromARGB(255, 202, 212, 128), fontSize: 25),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8),
              child: Container(
                decoration: const BoxDecoration(
                    color: kYellow,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      bottomLeft: Radius.circular(40),
                    )),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx1) => ScreenSearch(),
                            ),
                          );
                        },
                        icon: const Iconify(
                          Carbon.search,
                          color: Color.fromARGB(255, 27, 82, 72),
                          size: 25,
                        )),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx1) => ScreenPlaylist(
                                homeBuildList: homeBuildList,
                              ),
                            ),
                          );
                        },
                        icon: const Iconify(
                          Zondicons.playlist,
                          color: Color.fromARGB(255, 28, 88, 77),
                          size: 20,
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
        body: ListView(
          children: [
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
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
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.88,
                          child: BlocBuilder<HomePageBloc, HomePageState>(
                            builder: (context, state) {
                              if (state.songs.isEmpty) {
                                Center(
                                  child:
                                      CircularProgressIndicator(color: kYellow),
                                );
                              }
                              return LocalSongListBuilder(
                                  homeBuildList: state.songs);
                            },
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
