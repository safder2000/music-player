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
import 'package:music_player/screens/screen_search.dart';
import 'package:music_player/widgets/all_song__list_tile.dart';
import 'package:music_player/widgets/menu.dart';
import 'package:music_player/widgets/miniplayer.dart';
import 'package:iconify_flutter/icons/ph.dart';

class ScreenAll extends StatefulWidget {
  const ScreenAll({Key? key}) : super(key: key);

  @override
  State<ScreenAll> createState() => ScreenAlltate();
}

class ScreenAlltate extends State<ScreenAll> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 1, 64, 64),
          // leading: IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
          leading: IconButton(
              onPressed: () =>
                  ZoomDrawer(menuScreen: ScreenMenu(), mainScreen: ScreenAll()),
              icon: Iconify(
                Ph.arrow_bend_down_right_light,
                color: Color.fromARGB(255, 219, 242, 39),
              )),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8),
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
                          color: Color.fromARGB(255, 27, 82, 72),
                          size: 25,
                        )),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (ctx1) => ScreenPlaylist(),
                            ),
                          );
                        },
                        icon: Iconify(
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
                      SizedBox(
                        height: 568,
                        child: GlowingOverscrollIndicator(
                          axisDirection: AxisDirection.down,
                          color: Color.fromARGB(255, 154, 109, 109),
                          child: ListView(
                            children: [
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

                              SongListTile(
                                songTitle:
                                    'I Took A Pill In Ibiza (Seeb Remix) (Explicit)',
                                songSub:
                                    'Mike Posner - I Took A Pill In Ibiza (Explicit)  ',
                                songImg:
                                    AssetImage('assets/covers/MikePosner.jpg'),
                              ),

                              SongListTile(
                                songTitle: 'Promise (Reprise)',
                                songSub:
                                    'Akira Yamaoka-Silent Hill 2 Original Soundtracks',
                                songImg:
                                    AssetImage('assets/covers/Promise.jpg'),
                              ),

                              SongListTile(
                                songTitle: 'Ride-Twenty One Pilots ',
                                songSub:
                                    'Twenty One Pilots - Billboard Hot 100  ',
                                songImg: AssetImage('assets/covers/Ride.jpg'),
                              ),

                              SongListTile(
                                songTitle: 'Ohayo',
                                songSub:
                                    'ZODIVK, MEDIOQRITY, Afanasyev Pavel Yurievich',
                                songImg: AssetImage('assets/covers/Ohayo2.jpg'),
                              ),
                              SongListTile(
                                songTitle: 'Devil Eyes ',
                                songSub: 'ZODIVK, Afanasyev Pavel Yurievich',
                                songImg:
                                    AssetImage('assets/covers/DevilEyes.jpg'),
                              ),
                              SongListTile(
                                songTitle: 'Devil Eyes ',
                                songSub: 'ZODIVK, Afanasyev Pavel Yurievich',
                              ),
                              SongListTile(
                                songTitle: 'Devil Eyes ',
                                songSub: 'ZODIVK, Afanasyev Pavel Yurievich',
                              ),

                              //=========================================================================

                              Expanded(flex: 3, child: Container()),
                            ],
                          ),
                        ),
                      ),
                      MiniPlayer()
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
