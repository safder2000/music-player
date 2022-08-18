import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';

import 'package:music_player/screens/main_player/screen_main_player.dart';
import 'package:on_audio_query/on_audio_query.dart';

class HomeSongListTile extends StatefulWidget {
  HomeSongListTile({
    Key? key,
    this.songDuration,
    this.songIndex,
    required this.assetsAudioPlayer,
    required this.songInfo,
    this.songImg = const AssetImage('assets/images/defult.jpg'),
  }) : super(key: key);

  AssetImage songImg;
  SongModel songInfo;
  final songDuration;
  final songIndex;
  AssetsAudioPlayer assetsAudioPlayer;

  @override
  State<HomeSongListTile> createState() => _HomeSongListTileState();
}

class _HomeSongListTileState extends State<HomeSongListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx1) => ScreenMainPlayer(
                          songInfo: widget.songInfo,
                          songImg: widget.songImg,
                          // songDuration: widget.songDuration,
                          // songIndex: widget.songIndex,
                          assetsAudioPlayer: widget.assetsAudioPlayer,
                        ),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                            alignment: Alignment.topCenter,
                            image: widget.songImg,
                            fit: BoxFit.fill,
                          ),
                        ),
                        height: 50,
                        width: 50,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 235,
                            child: Text(
                              widget.songInfo.title,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          SizedBox(
                            width: 235,
                            child: Text(
                              '${widget.songInfo.album}',
                              style: const TextStyle(
                                  color: Color.fromARGB(150, 255, 255, 255),
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    '${widget.songDuration.toStringAsFixed(2)}',
                    style: const TextStyle(
                        color: Color.fromARGB(150, 255, 255, 255),
                        fontSize: 13),
                  ),
                  const Iconify(
                    Carbon.overflow_menu_vertical,
                    color: Color.fromARGB(150, 255, 255, 255),
                    size: 26,
                  ),
                ],
              )
            ],
          ),
          const Divider(
            color: Colors.white30,
          ),
        ],
      ),
    );
  }
}
