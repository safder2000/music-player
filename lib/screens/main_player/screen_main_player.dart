import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart'; // For Iconify Widget

import 'package:iconify_flutter/icons/radix_icons.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:iconify_flutter/icons/mdi_light.dart';
import 'package:music_player/db/all_songs.dart';
import 'package:music_player/db/functions/Boxes.dart';

import 'package:music_player/screens/menu/screen_main.dart';
import 'package:music_player/screens/playlist/screen_playlist.dart';
import 'package:music_player/screens/screen_splash.dart';
import 'package:music_player/widgets/song_list.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class ScreenMainPlayer extends StatefulWidget {
  ScreenMainPlayer({
    Key? key,
    required this.homeBuildList,

    // this.songDuration,
    required this.songIndex,
    // required this.assetsAudioPlayer,
    this.songImg = const AssetImage('assets/images/defult.jpg'),
  }) : super(key: key);
  List<Audio> homeBuildList = [];

  AssetImage songImg;

  // final songDuration;
  int songIndex;
  // AssetsAudioPlayer assetsAudioPlayer;
  // final AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer.withId("0");

  // AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  // final _audioQuery = OnAudioQuery();

  @override
  State<ScreenMainPlayer> createState() => ScreenMainPlayerState();
}

class ScreenMainPlayerState extends State<ScreenMainPlayer> {
  bool isFavorate = true;

  bool isRepeat = true;
  bool isPause = true;
  int _selectedIndex = 0;
  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }

  final box = Boxes.getAll();
  List<AllSongs> dbSongs = [];
  // Duration duration = Duration.zero;
  // Duration position = Duration.zero;
  void _onPrevSong(int _currentIndex) {
    _selectedIndex = _currentIndex;
    setState(
      () {
        if (_selectedIndex <= 0) {
          _selectedIndex = (widget.homeBuildList.length) - 1;
          // widget.assetsAudioPlayer
          //     .open(songList[_selectedIndex], showNotification: true);
        } else {
          _selectedIndex = _selectedIndex - 1;
          // widget.assetsAudioPlayer
          //     .open(songList[_selectedIndex], showNotification: true);
        }
        assetsAudioPlayer.previous();
        assetsAudioPlayer.play();
        isPause = true;
      },
    );
  }

  void _onNextSong(int _currentIndex) {
    _selectedIndex = _currentIndex;
    setState(
      () {
        if (_selectedIndex >= widget.homeBuildList.length - 1) {
          _selectedIndex = 0;
          // widget.assetsAudioPlayer
          //     .open(songList[_selectedIndex], showNotification: true);
        } else {
          // widget.assetsAudioPlayer
          //     .open(songList[_selectedIndex + 1], showNotification: true);
          _selectedIndex = _selectedIndex + 1;
        }
        assetsAudioPlayer.next();
        assetsAudioPlayer.play();
        isPause = true;
      },
    );
  }

  @override
  void initState() {
    _selectedIndex = widget.songIndex;
    // TODO: implement initState

    super.initState();
    dbSongs = box.get('mainSongBox') as List<AllSongs>;
    // openPlayer();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void openPlayer() async {
    try {
      await assetsAudioPlayer.open(
        Playlist(audios: widget.homeBuildList, startIndex: _selectedIndex),
        showNotification: true,
        autoStart: true,
      );
    } on Exception {
      log('fetching error......................<<<<<');
    }
  }

  // playSong() async {
  //   await widget.assetsAudioPlayer.open(
  //       Audio.file(widget.homeBuildList[widget.songIndex].uri!),
  //       autoStart: false,
  //       showNotification: true);
  //   // await widget.assetsAudioPlayer.open(songList[widget.songIndex + 1],
  //   //     autoStart: false, showNotification: true);
  //   widget.assetsAudioPlayer.play();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 0, 0, 0),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Color.fromARGB(182, 255, 255, 255),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx1) => const ScreenPlaylist(),
                            ),
                          );
                        },
                        icon: const Icon(
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
                  child: assetsAudioPlayer.builderCurrent(
                      builder: (context, Playing? playing) {
                    final myAudio = find(
                        widget.homeBuildList, playing!.audio.assetAudioPath);

                    final currentSong = dbSongs.firstWhere((element) =>
                        element.id.toString() == myAudio.metas.id.toString());
                    return Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 250,
                                child: Text(
                                  // widget.homeBuildList[_selectedIndex].metas
                                  //     .title!,
                                  myAudio.metas.title!,
                                  style: const TextStyle(
                                    color: Color.fromARGB(196, 244, 244, 244),
                                    fontSize: 30,
                                    fontWeight: FontWeight.w800,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(
                                height: 9,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 200,
                                    child: Text(
                                      // '${widget.homeBuildList[_selectedIndex].metas.album}',
                                      myAudio.metas.album!,
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              125, 167, 167, 167),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w100),
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (isRepeat) {
                                        assetsAudioPlayer
                                            .setLoopMode(LoopMode.single);
                                        // widget.homeBuildList[_selectedIndex] =
                                        //     find(widget.homeBuildList,
                                        //         playing.audio.assetAudioPath);
                                      } else {
                                        assetsAudioPlayer
                                            .setLoopMode(LoopMode.playlist);
                                        // widget.homeBuildList[_selectedIndex] =
                                        //     find(widget.homeBuildList,
                                        //         playing.audio.assetAudioPath);
                                      }
                                      isRepeat = !isRepeat;
                                    });
                                  },
                                  icon: isRepeat == true
                                      ? const Iconify(
                                          MdiLight.repeat,
                                          color: Color.fromARGB(
                                              255, 255, 234, 234),
                                          size: 30,
                                        )
                                      : const Iconify(
                                          MdiLight.repeat_once,
                                          color: Color.fromARGB(
                                              255, 255, 234, 234),
                                          size: 30,
                                        )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isFavorate = !isFavorate;
                                    });
                                  },
                                  icon: isFavorate == true
                                      ? const Icon(
                                          Icons.favorite,
                                          color: Color.fromARGB(
                                              255, 255, 234, 234),
                                          size: 30,
                                        )
                                      : const Icon(
                                          Icons.favorite,
                                          color:
                                              Color.fromARGB(255, 219, 242, 39),
                                          size: 30,
                                        )),
                            ),
                          ],
                        ),
                        //============================ Seekbar =======================================================
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: assetsAudioPlayer.builderRealtimePlayingInfos(
                            builder: (ctx, infos) {
                              Duration currentPos = infos.currentPosition;
                              Duration total = infos.duration;
                              return ProgressBar(
                                progress: currentPos,
                                total: total,
                                progressBarColor:
                                    const Color.fromARGB(255, 219, 242, 39),
                                baseBarColor: Colors.white.withOpacity(0.24),
                                bufferedBarColor:
                                    Colors.white.withOpacity(0.24),
                                thumbColor: Colors.white,
                                barHeight: 3.0,
                                thumbRadius: 5.0,
                                timeLabelTextStyle: const TextStyle(
                                  color: Colors.grey,
                                ),
                                onSeek: (to) {
                                  assetsAudioPlayer.seek(to);
                                },
                              );
                            },
                          ),
                        ),
                        //========================= Seekbar End ================================================================
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 30,
                              ),
                              IconButton(
                                  onPressed: () {
                                    _onPrevSong(_selectedIndex);
                                  }, //FaIcon(FontAwesomeIcons.gamepad),
                                  icon: const Iconify(
                                    RadixIcons.track_previous,
                                    color: Colors.white,
                                    size: 60,
                                  )),
                              const SizedBox(
                                width: 5,
                              ),
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (isPause) {
                                          assetsAudioPlayer.pause();
                                        } else {
                                          assetsAudioPlayer.play();
                                        }

                                        isPause = !isPause;
                                      });
                                    }, //FaIcon(FontAwesomeIcons.gamepad),
                                    icon: isPause == true
                                        ? const Iconify(
                                            MdiLight.pause,
                                            color: Color.fromARGB(
                                                255, 219, 242, 39),
                                            size: 190,
                                          )
                                        : const Iconify(
                                            MdiLight.play,
                                            color: Color.fromARGB(
                                                255, 219, 242, 39),
                                            size: 190,
                                          )),
                              ),
                              IconButton(
                                  onPressed: () {
                                    _onNextSong(_selectedIndex);
                                  }, //FaIcon(FontAwesomeIcons.gamepad),
                                  icon: const Iconify(
                                    RadixIcons.track_next,
                                    color: Colors.white,
                                    size: 60,
                                  )),
                              const SizedBox(
                                width: 15,
                              )
                              // SizedBox(
                              //   width: 35,
                              // ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        )
                      ],
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
