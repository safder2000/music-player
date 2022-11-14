import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart'; // For Iconify Widget
import 'package:music_player/application/main_player/main_player_bloc.dart';
import 'package:music_player/db/functions/player.dart';
import 'package:text_scroll/text_scroll.dart';
import 'package:iconify_flutter/icons/radix_icons.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:iconify_flutter/icons/mdi_light.dart';
import 'package:music_player/screens/playlist/screen_playlist.dart';

import 'package:on_audio_query/on_audio_query.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class ScreenMainPlayer extends StatelessWidget {
  ScreenMainPlayer({
    Key? key,
    required this.homeBuildList,
  }) : super(key: key);
  List<Audio> homeBuildList = [];

  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }

  @override
  Widget build(BuildContext context) {
    // context.read<MainPlayerBloc>().add(PlayPause(
    //     isPlaying: assetsAudioPlayer.isPlaying == true ? true : false));
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
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
                              builder: (ctx1) => ScreenPlaylist(

                                  // songIndex: widget.songIndex,
                                  ),
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
              child: assetsAudioPlayer.builderCurrent(
                  builder: (context, Playing? playing) {
                final myAudio =
                    find(homeBuildList, playing!.audio.assetAudioPath);
                context
                    .read<MainPlayerBloc>()
                    .add(NowPlaying(nowPlaying: myAudio));
                context.read<MainPlayerBloc>().add(IsFavorite());

                return Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50),
                      child:
                          //  BlocBuilder<MainPlayerBloc, MainPlayerState>(
                          //   builder: (context, state) {
                          //     if (state.nowPlaying == null) {
                          //       return SizedBox(
                          //           height: MediaQuery.of(context).size.width,
                          //           width: MediaQuery.of(context).size.width,
                          //           child: Image(
                          //             image: AssetImage('assets/images/defult.jpg'),
                          //           ));
                          //     } else {
                          //       return
                          SizedBox(
                        height: MediaQuery.of(context).size.width,
                        width: MediaQuery.of(context).size.width,
                        child: QueryArtworkWidget(
                          id: int.parse(myAudio.metas.id!),
                          type: ArtworkType.AUDIO,
                          artworkQuality: FilterQuality.high,
                          size: 1500,
                          artworkHeight: 300,
                          artworkWidth: 300,
                          artworkBlendMode: BlendMode.colorBurn,
                          artworkBorder: BorderRadius.circular(8),
                          nullArtworkWidget: Image(
                            image: AssetImage('assets/images/defult.jpg'),
                          ),
                        ),
                      ),
                      // }
                      //   },
                      // ),
                    ),
                    Container(
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
                              height: MediaQuery.of(context).size.height / 90,
                            ),
                            BlocBuilder<MainPlayerBloc, MainPlayerState>(
                              builder: (context, state) {
                                return Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 280,
                                        child: Center(
                                          child: TextScroll(
                                            myAudio.metas.title!,
                                            mode: TextScrollMode.bouncing,
                                            velocity: Velocity(
                                                pixelsPerSecond: Offset(50, 0)),
                                            delayBefore:
                                                Duration(milliseconds: 500),
                                            numberOfReps: 1,
                                            pauseBetween:
                                                Duration(milliseconds: 50),
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                  196, 244, 244, 244),
                                              fontSize: 30,
                                              fontWeight: FontWeight.w800,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            textAlign: TextAlign.right,
                                            selectable: true,
                                          ),
                                        ),
                                        // child: Text(
                                        //   // widget.homeBuildList[_selectedIndex].metas
                                        //   //     .title!,
                                        //   myAudio.metas.title!,
                                        //   style: const TextStyle(
                                        //     color: Color.fromARGB(196, 244, 244, 244),
                                        //     fontSize: 30,
                                        //     fontWeight: FontWeight.w800,
                                        //     overflow: TextOverflow.ellipsis,
                                        //   ),
                                        //   textAlign: TextAlign.center,
                                        // ),
                                      ),
                                      const SizedBox(
                                        height: 9,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 200,
                                            child: Text(
                                              // '${widget.homeBuildList[_selectedIndex].metas.album}',
                                              myAudio.metas.artist!,
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
                                );
                              },
                            ),
                            // QueryArtworkWidget(
                            //   id: int.parse(myAudio.metas.id!),
                            //   type: ArtworkType.AUDIO,
                            //   artworkQuality: FilterQuality.high,
                            //   size: 1500,
                            //   artworkHeight: 300,
                            //   artworkWidth: 300,
                            //   artworkBlendMode: BlendMode.colorBurn,
                            //   artworkBorder: BorderRadius.circular(8),
                            //   nullArtworkWidget: Image(
                            //     image: AssetImage('assets/images/defult.jpg'),
                            //   ),
                            // ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.4,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BlocBuilder<MainPlayerBloc, MainPlayerState>(
                                  builder: (context, state) {
                                    return Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: IconButton(
                                          onPressed: () {
                                            context.read<MainPlayerBloc>().add(
                                                Repeate(
                                                    isRepeat:
                                                        !state.isRepeating));
                                          },
                                          icon: state.isRepeating
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
                                    );
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: BlocBuilder<MainPlayerBloc,
                                      MainPlayerState>(
                                    builder: (context, state) {
                                      return IconButton(
                                        onPressed: () {
                                          context.read<MainPlayerBloc>().add(
                                              AddToFavorite(
                                                  songId: myAudio.metas.id!,
                                                  context: context,
                                                  key: scaffoldKey));
                                        },
                                        icon: state.isFavorite
                                            ? Icon(
                                                Icons.favorite,
                                                color: Color.fromARGB(
                                                    255, 219, 242, 39),
                                                size: 30,
                                              )
                                            : Icon(
                                                Icons.favorite,
                                                color: Color.fromARGB(
                                                    255, 255, 234, 234),
                                                size: 30,
                                              ),
                                      );
                                    },
                                  ),
                                ),
                                BlocBuilder<MainPlayerBloc, MainPlayerState>(
                                  builder: (context, state) {
                                    return Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: IconButton(
                                          onPressed: () {
                                            context.read<MainPlayerBloc>().add(
                                                Shuffle(
                                                    isShuffle:
                                                        !state.isShuffle));
                                          },
                                          icon: state.isShuffle == true
                                              ? const Iconify(
                                                  MdiLight.shuffle,
                                                  color: Color.fromARGB(
                                                      255, 255, 234, 234),
                                                  size: 30,
                                                )
                                              : const Iconify(
                                                  MdiLight.arrow_right,
                                                  color: Color.fromARGB(
                                                      255, 235, 255, 234),
                                                  size: 30,
                                                )),
                                    );
                                  },
                                ),
                              ],
                            ),
                            //============================ Seekbar =======================================================
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child:
                                  assetsAudioPlayer.builderRealtimePlayingInfos(
                                builder: (ctx, infos) {
                                  Duration currentPos = infos.currentPosition;
                                  Duration total = infos.duration;
                                  return ProgressBar(
                                    progress: currentPos,
                                    total: total,
                                    progressBarColor:
                                        const Color.fromARGB(255, 219, 242, 39),
                                    baseBarColor:
                                        Colors.white.withOpacity(0.24),
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
                                        context
                                            .read<MainPlayerBloc>()
                                            .add(PlayPrevious());
                                        context
                                            .read<MainPlayerBloc>()
                                            .add(IsPlaying(isPlaying: true));
                                      }, //FaIcon(FontAwesomeIcons.gamepad),
                                      icon: const Iconify(
                                        RadixIcons.track_previous,
                                        color: Colors.white,
                                        size: 60,
                                      )),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  BlocBuilder<MainPlayerBloc, MainPlayerState>(
                                    builder: (context, state) {
                                      return SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: IconButton(
                                            onPressed: () {
                                              context
                                                  .read<MainPlayerBloc>()
                                                  .add(PlayPause(
                                                      isPlaying:
                                                          !state.isPlaying));
                                            }, //FaIcon(FontAwesomeIcons.gamepad),
                                            icon: state.isPlaying == true
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
                                      );
                                    },
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        context
                                            .read<MainPlayerBloc>()
                                            .add(PlayNext());
                                        context
                                            .read<MainPlayerBloc>()
                                            .add(IsPlaying(isPlaying: true));
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
                        ))
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
