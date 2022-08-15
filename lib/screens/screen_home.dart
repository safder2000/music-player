import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
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
import 'package:music_player/screens/screen_all.dart';
import 'package:music_player/screens/screen_main.dart';
import 'package:music_player/screens/screen_playlist.dart';

class ScreenHome extends StatefulWidget {
  ScreenHome({
    Key? key,
    required this.songTitle,
    required this.songSub,
    this.songImg = const AssetImage('assets/images/defult.jpg'),
  }) : super(key: key);
  String songTitle;
  String songSub;
  AssetImage songImg;

  @override
  State<ScreenHome> createState() => ScreenHomeState();
}

class ScreenHomeState extends State<ScreenHome> {
  bool isFavorate = true;
  bool isPause = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: Color.fromARGB(255, 0, 0, 0),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (ctx1) => ScreenMain(),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Color.fromARGB(182, 255, 255, 255),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx1) => ScreenPlaylist(),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.queue_music,
                          size: 29,
                          color: Color.fromARGB(206, 255, 255, 255),
                        ))
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.topCenter,
                    image: widget.songImg,
                    fit: BoxFit.none,
                  ),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [
                        0.00,
                        0.3,
                        0.7,
                      ],
                      colors: [
                        Color.fromARGB(255, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0),
                        Color.fromARGB(255, 0, 0, 0),
                      ],
                    ),
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            Container(
                              width: 250,
                              child: Text(
                                widget.songTitle,
                                style: TextStyle(
                                  color: Color.fromARGB(196, 244, 244, 244),
                                  fontSize: 30,
                                  fontWeight: FontWeight.w800,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Text(
                              widget.songSub,
                              style: TextStyle(
                                  color: Color.fromARGB(125, 167, 167, 167),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w100),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Iconify(
                                MdiLight.repeat,
                                color: Color.fromARGB(255, 255, 234, 234),
                                size: 30,
                              )),
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isFavorate = !isFavorate;
                                  });
                                },
                                icon: isFavorate == true
                                    ? Icon(
                                        Icons.favorite,
                                        color:
                                            Color.fromARGB(255, 255, 234, 234),
                                        size: 30,
                                      )
                                    : Icon(
                                        Icons.favorite,
                                        color:
                                            Color.fromARGB(255, 219, 242, 39),
                                        size: 30,
                                      )),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 320,
                        child: ProgressBar(
                          progress: Duration(milliseconds: 1000),
                          buffered: Duration(milliseconds: 2000),
                          total: Duration(milliseconds: 5000),
                          progressBarColor: Color.fromARGB(255, 219, 242, 39),
                          baseBarColor: Colors.white.withOpacity(0.24),
                          bufferedBarColor: Colors.white.withOpacity(0.24),
                          thumbColor: Colors.white,
                          barHeight: 3.0,
                          thumbRadius: 5.0,
                          timeLabelTextStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            IconButton(
                                onPressed:
                                    () {}, //FaIcon(FontAwesomeIcons.gamepad),
                                icon: Iconify(
                                  RadixIcons.track_previous,
                                  color: Colors.white,
                                  size: 60,
                                )),
                            SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isPause = !isPause;
                                    });
                                  }, //FaIcon(FontAwesomeIcons.gamepad),
                                  icon: isPause == true
                                      ? Iconify(
                                          MdiLight.pause,
                                          color:
                                              Color.fromARGB(255, 219, 242, 39),
                                          size: 190,
                                        )
                                      : Iconify(
                                          MdiLight.play,
                                          color:
                                              Color.fromARGB(255, 219, 242, 39),
                                          size: 190,
                                        )),
                            ),
                            IconButton(
                                onPressed:
                                    () {}, //FaIcon(FontAwesomeIcons.gamepad),
                                icon: Iconify(
                                  RadixIcons.track_next,
                                  color: Colors.white,
                                  size: 60,
                                )),
                            SizedBox(
                              width: 15,
                            )
                            // SizedBox(
                            //   width: 35,
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      )
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
