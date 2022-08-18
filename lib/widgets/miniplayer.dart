import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi_light.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:animate_do/animate_do.dart';
import 'package:music_player/screens/main_player/screen_player_old.dart';
import 'package:music_player/screens/menu/screen_main.dart';

class MiniPlayer extends StatefulWidget {
  const MiniPlayer({Key? key}) : super(key: key);

  @override
  State<MiniPlayer> createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool isPlaying = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => Navigator.of(context).push(MaterialPageRoute(
      //   builder: (ctx1) => ScreenHome(
      //     songSub: 'Zodvik',
      //     songTitle: 'Long Nights',
      //   ),
      // )),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black45,
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
              Color.fromARGB(255, 38, 115, 101),
              Color.fromARGB(0, 0, 0, 0),
            ],
          ),
        ),
        height: 80,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.93,
              child: ProgressBar(
                progress: const Duration(milliseconds: 1000),
                buffered: const Duration(milliseconds: 2000),
                total: const Duration(milliseconds: 5000),
                progressBarColor: const Color.fromARGB(255, 219, 242, 39),
                baseBarColor:
                    const Color.fromARGB(255, 0, 0, 0).withOpacity(0.24),
                bufferedBarColor: Colors.white.withOpacity(0.24),
                thumbColor: const Color.fromARGB(0, 255, 255, 255),
                barHeight: 3.0,
                thumbRadius: 5.0,
                timeLabelTextStyle:
                    const TextStyle(color: Colors.white, fontSize: 0),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        image: DecorationImage(
                          alignment: Alignment.topCenter,
                          image: AssetImage('assets/images/1.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      height: 60,
                      width: 60,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      'Long Nights',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: toggleIcon,
                      iconSize: 50,
                      icon: AnimatedIcon(
                        icon: AnimatedIcons.play_pause,
                        progress: controller,
                        color: const Color.fromARGB(255, 219, 242, 39),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    )
                  ],
                ),
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
      });
}
