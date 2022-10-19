import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/icons/mdi_light.dart';
import 'package:iconify_flutter/icons/radix_icons.dart';
import 'package:music_player/application/main_player/main_player_bloc.dart';
import 'package:music_player/screens/screen_main_player.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'package:iconify_flutter/iconify_flutter.dart';

class MiniPlayer extends StatelessWidget {
  MiniPlayer({
    Key? key,
    required this.homeBuildList,
    required this.songIndex,
    // required this.assetsAudioPlayer,
  }) : super(
          key: key,
        );
  List<Audio> homeBuildList = [];

  // AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer.withId("0");
  final AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer.withId("0");

  int songIndex;

  bool isPlaying = false;

  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }

  @override
  Widget build(BuildContext context) {
    context.read<MainPlayerBloc>().add(PlayPause(
        isPlaying: assetsAudioPlayer.isPlaying == true ? true : false));
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx1) => ScreenMainPlayer(
            // songIndex: widget.songIndex,

            homeBuildList: homeBuildList,
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
              child: assetsAudioPlayer.builderRealtimePlayingInfos(
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
                      assetsAudioPlayer.seek(to);
                    },
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                assetsAudioPlayer.builderCurrent(
                    builder: (context, Playing? playing) {
                  final myAudio =
                      find(homeBuildList, playing!.audio.assetAudioPath);
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
                              '${myAudio.metas.title!.isEmpty ? homeBuildList[0].metas.title : myAudio.metas.title}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Text(
                              ' ${myAudio.metas.title!.isEmpty ? homeBuildList[0].metas.artist : myAudio.metas.artist}',
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
                      context.read<MainPlayerBloc>().add(PlayPrevious());
                    }, //FaIcon(FontAwesomeIcons.gamepad),
                    icon: const Iconify(
                      RadixIcons.track_previous,
                      color: Colors.white,
                      size: 30,
                    )),
                BlocBuilder<MainPlayerBloc, MainPlayerState>(
                  builder: (context, state) {
                    return IconButton(
                      onPressed: () {
                        context
                            .read<MainPlayerBloc>()
                            .add(PlayPause(isPlaying: !state.isPlaying));
                      },
                      iconSize: 50,
                      icon: state.isPlaying
                          ? const Iconify(
                              MdiLight.pause,
                              color: Color.fromARGB(255, 219, 242, 39),
                              size: 190,
                            )
                          : const Iconify(
                              MdiLight.play,
                              color: Color.fromARGB(255, 219, 242, 39),
                              size: 190,
                            ),
                    );
                  },
                ),
                IconButton(
                    onPressed: () {
                      context.read<MainPlayerBloc>().add(PlayNext());
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
}
