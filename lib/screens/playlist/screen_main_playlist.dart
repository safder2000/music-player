import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart'; // For Iconify Widget
import 'package:iconify_flutter/icons/carbon.dart';

import 'package:music_player/widgets/miniplayer.dart';

import 'package:music_player/screens/playlist/widgets/playlist_song_tile.dart';

class ScreenMainPlaylist extends StatefulWidget {
  const ScreenMainPlaylist({Key? key}) : super(key: key);

  @override
  State<ScreenMainPlaylist> createState() => ScreenMainPlayliststate();
}

class ScreenMainPlayliststate extends State<ScreenMainPlaylist> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 1, 64, 64),
          title: const Text(
            'favorate',
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
                        onPressed: () {},
                        icon: const Iconify(
                          Carbon.add,
                          color: Color.fromARGB(255, 27, 82, 72),
                          size: 35,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Iconify(
                          Carbon.delete,
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
                          color: const Color.fromARGB(255, 154, 109, 109),
                          child: ListView(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      child: Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Iconify(
                                                Carbon.play,
                                                color: Color.fromARGB(
                                                    255, 27, 82, 72),
                                                size: 35,
                                              )),
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
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, bottom: 8),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          color:
                                              Color.fromARGB(0, 218, 242, 39),
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
                              //===================================================================
                              PlaylistSongTile(
                                songTitle: 'LongNights',
                                songSub: 'appukuttan',
                                songImg: const AssetImage(
                                    'assets/covers/LongNights.jpg'),
                              ),

                              PlaylistSongTile(
                                songTitle:
                                    'There For You - Martin Garrix feat. Troye Sivan -',
                                songSub: 'MTV Top 100 Single Charts ',
                                songImg: const AssetImage(
                                    'assets/covers/ThereForYou.jpg'),
                              ),

                              PlaylistSongTile(
                                songTitle:
                                    'I Took A Pill In Ibiza (Seeb Remix) (Explicit)',
                                songSub:
                                    'Mike Posner - I Took A Pill In Ibiza (Explicit)  ',
                                songImg: const AssetImage(
                                    'assets/covers/MikePosner.jpg'),
                              ),

                              PlaylistSongTile(
                                songTitle: 'Promise (Reprise)',
                                songSub:
                                    'Akira Yamaoka-Silent Hill 2 Original Soundtracks',
                                songImg: const AssetImage(
                                    'assets/covers/Promise.jpg'),
                              ),

                              PlaylistSongTile(
                                songTitle: 'Ride-Twenty One Pilots ',
                                songSub:
                                    'Twenty One Pilots - Billboard Hot 100  ',
                                songImg:
                                    const AssetImage('assets/covers/Ride.jpg'),
                              ),

                              PlaylistSongTile(
                                songTitle: 'Ohayo',
                                songSub:
                                    'ZODIVK, MEDIOQRITY, Afanasyev Pavel Yurievich',
                                songImg: const AssetImage(
                                    'assets/covers/Ohayo2.jpg'),
                              ),
                              PlaylistSongTile(
                                songTitle: 'Devil Eyes ',
                                songSub: 'ZODIVK, Afanasyev Pavel Yurievich',
                                songImg: const AssetImage(
                                    'assets/covers/DevilEyes.jpg'),
                              ),
                              PlaylistSongTile(
                                songTitle: 'Devil Eyes ',
                                songSub: 'ZODIVK, Afanasyev Pavel Yurievich',
                              ),
                              PlaylistSongTile(
                                songTitle: 'Devil Eyes ',
                                songSub: 'ZODIVK, Afanasyev Pavel Yurievich',
                              ),

                              //=========================================================================

                              Expanded(flex: 3, child: Container()),
                            ],
                          ),
                        ),
                      ),
                      const MiniPlayer()
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
