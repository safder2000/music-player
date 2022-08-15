import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconify_flutter/iconify_flutter.dart'; // For Iconify Widget
import 'package:iconify_flutter/icons/zondicons.dart'; // for Non Colorful Icons
import 'package:colorful_iconify_flutter/icons/emojione.dart'; // for Colorful Icons// for Colorful Icons
import 'package:line_icons/line_icons.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:iconify_flutter/icons/radix_icons.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:iconify_flutter/icons/mdi_light.dart';
import 'package:music_player/screens/screen_main.dart';
import 'package:music_player/screens/screen_menu.dart';
import 'package:music_player/screens/screen_playlist.dart';
import 'package:music_player/widgets/all_song__list_tile.dart';
import 'package:music_player/widgets/menu.dart';
import 'package:music_player/widgets/miniplayer.dart';
import 'package:iconify_flutter/icons/ph.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({Key? key}) : super(key: key);

  @override
  State<ScreenSearch> createState() => ScreenSearchstate();
}

class ScreenSearchstate extends State<ScreenSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Scaffold(
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
                  child: SafeArea(
                    child: ListView(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Iconify(
                                Carbon.arrow_up_left,
                                color: Color.fromARGB(75, 255, 255, 255),
                                size: 25,
                              ),
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (ctx1) => ScreenMain(),
                                  ),
                                );
                              },
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 219, 242, 39),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      bottomLeft: Radius.circular(40),
                                    )),
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (ctx1) => ScreenSearch(),
                                            ),
                                          );
                                        },
                                        icon: Iconify(
                                          Carbon.search,
                                          color:
                                              Color.fromARGB(255, 27, 82, 72),
                                          size: 25,
                                        )),
                                    SizedBox(width: 264, child: TextField()),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            //===================================================================
                            SongListTile(
                              songTitle: 'LongNights',
                              songSub: 'appukuttan',
                              songImg:
                                  AssetImage('assets/covers/LongNights.jpg'),
                            ),

                            SongListTile(
                              songTitle:
                                  'There For You - Martin Garrix feat. Troye Sivan -',
                              songSub: 'MTV Top 100 Single Charts ',
                              songImg:
                                  AssetImage('assets/covers/ThereForYou.jpg'),
                            ),

                            //=========================================================================
                          ],
                        ),
                      ],
                    ),
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
