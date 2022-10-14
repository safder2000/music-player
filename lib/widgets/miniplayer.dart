import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/icons/radix_icons.dart';
import 'package:music_player/screens/screen_main_player.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'dart:developer';
import 'package:iconify_flutter/iconify_flutter.dart';

class MiniPlayer extends StatefulWidget {
  MiniPlayer({
    Key? key,
    required this.homeBuildList,
    // required this.songIndex,
    // required this.assetsAudioPlayer,
  }) : super(
          key: key,
        );
  List<Audio> homeBuildList = [];

  // AssetsAudioPlayer assetsAudioPlayer;
  final AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer.withId("0");

  // int songIndex;
  @override
  State<MiniPlayer> createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool isPlaying = false;
  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    toggleIcon();
    if (widget.assetsAudioPlayer.isPlaying == true) {
      log('playing......');
      controller.forward();
    } else {
      controller.reverse();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx1) => ScreenMainPlayer(
            // songIndex: widget.songIndex,

            homeBuildList: widget.homeBuildList,
          ),
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.0), topLeft: Radius.circular(15.0)),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.0,
              1,
            ],
            colors: [
              Color.fromARGB(255, 1, 64, 64),
              Color.fromARGB(255, 0, 0, 0),
            ],
          ),
        ),
        height: 90,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.93,
              child: widget.assetsAudioPlayer.builderRealtimePlayingInfos(
                builder: (ctx, infos) {
                  Duration currentPos = infos.currentPosition;
                  Duration total = infos.duration;
                  return ProgressBar(
                    progress: currentPos,
                    total: total,
                    progressBarColor: const Color.fromARGB(255, 219, 242, 39),
                    baseBarColor: Colors.white.withOpacity(0.24),
                    bufferedBarColor: Colors.white.withOpacity(0.24),
                    thumbColor: Color.fromARGB(0, 255, 255, 255),
                    barHeight: 3.0,
                    thumbRadius: 5.0,
                    timeLabelTextStyle: const TextStyle(
                      fontSize: 0,
                      color: Colors.grey,
                    ),
                    onSeek: (to) {
                      widget.assetsAudioPlayer.seek(to);
                    },
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.assetsAudioPlayer.builderCurrent(
                    builder: (context, Playing? playing) {
                  final myAudio =
                      find(widget.homeBuildList, playing!.audio.assetAudioPath);
                  return Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        // decoration: const BoxDecoration(
                        //   borderRadius: BorderRadius.all(Radius.circular(8)),
                        //   image: DecorationImage(
                        //     alignment: Alignment.topCenter,
                        //     image: AssetImage('assets/images/1.jpg'),
                        //     fit: BoxFit.fill,
                        //   ),
                        // ),
                        child: QueryArtworkWidget(
                          id: int.parse(myAudio.metas.id!),
                          type: ArtworkType.AUDIO,
                          artworkBorder: BorderRadius.circular(8),
                          nullArtworkWidget: Image(
                            image: AssetImage('assets/images/defult.jpg'),
                          ),
                        ),
                        height: 60,
                        width: 60,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Text(
                              '${myAudio.metas.title!.isEmpty ? widget.homeBuildList[0].metas.title : myAudio.metas.title}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Text(
                              ' ${myAudio.metas.title!.isEmpty ? widget.homeBuildList[0].metas.artist : myAudio.metas.artist}',
                              style: TextStyle(
                                  color: Color.fromARGB(157, 255, 255, 255),
                                  fontSize: 14),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                }),
                // Row(
                //   children: [

                //   ],
                // ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      widget.assetsAudioPlayer.previous();
                    }, //FaIcon(FontAwesomeIcons.gamepad),
                    icon: const Iconify(
                      RadixIcons.track_previous,
                      color: Colors.white,
                      size: 30,
                    )),
                IconButton(
                  onPressed: toggleIcon,
                  iconSize: 50,
                  icon: AnimatedIcon(
                    icon: AnimatedIcons.play_pause,
                    progress: controller,
                    color: const Color.fromARGB(255, 219, 242, 39),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      widget.assetsAudioPlayer.next();
                    }, //FaIcon(FontAwesomeIcons.gamepad),
                    icon: const Iconify(
                      RadixIcons.track_next,
                      color: Colors.white,
                      size: 30,
                    )),
                Spacer()
              ],
            ),
          ],
        ),
      ),
    );
  }

  void toggleIcon() => setState(() {
        isPlaying = !isPlaying;
        isPlaying ? controller.forward() : controller.reverse();
        isPlaying
            ? widget.assetsAudioPlayer.play()
            : widget.assetsAudioPlayer.pause();
      });
}
