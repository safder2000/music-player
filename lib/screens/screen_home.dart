import 'package:flutter/material.dart';

import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'package:iconify_flutter/iconify_flutter.dart'; // For Iconify Widget
import 'package:iconify_flutter/icons/zondicons.dart'; // for Non Colorful Icons

import 'package:iconify_flutter/icons/carbon.dart';

import 'package:music_player/screens/menu/screen_menu.dart';
import 'package:music_player/screens/playlist/screen_playlist.dart';

import 'package:music_player/widgets/home_song_list_builder.dart';
import 'package:music_player/widgets/miniplayer.dart';
import 'package:iconify_flutter/icons/ph.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => ScreenHomestate();
}

class ScreenHomestate extends State<ScreenHome> {
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
              onPressed: () => const ZoomDrawer(
                  menuScreen: ScreenMenu(), mainScreen: ScreenHome()),
              icon: const Iconify(
                Ph.arrow_bend_down_right_light,
                color: Color.fromARGB(255, 219, 242, 39),
              )),
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
                          // Navigator.of(context).pushReplacement(
                          //   MaterialPageRoute(
                          //     builder: (ctx1) => const ScreenSearch(),
                          //   ),
                          // );
                        },
                        icon: const Iconify(
                          Carbon.search,
                          color: Color.fromARGB(255, 27, 82, 72),
                          size: 25,
                        )),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (ctx1) => const ScreenPlaylist(),
                            ),
                          );
                        },
                        icon: const Iconify(
                          Zondicons.indent_increase,
                          color: Color.fromARGB(255, 28, 88, 77),
                          size: 22,
                        ))
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
                      const SizedBox(
                          height: 568, child: LocalSongListBuilder()),
                      const MiniPlayer(),
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
