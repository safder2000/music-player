import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/db/all_songs.dart';
import 'package:music_player/db/functions/Boxes.dart';

import 'package:music_player/screens/menu/screen_main.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer.withId("0");
// final AudioPlayer audioPlayer = AudioPlayer();

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    load();
    // TODO: implement initState
    super.initState();
    Permission.storage.request();
    setState(() {
      PermissionStatus;
    });
    fetchSongs();
  }

  final _audioQuery = OnAudioQuery();
  final box = Boxes.getAll();
  List<SongModel> fetchedSongs = [];
  List<AllSongs> afterMapping = [];
  List<SongModel> fullSongs = [];
  List<SongModel> allSongs = [];
  List<AllSongs> audioList = [];
  List<Audio> filterdSongs = [];

  List<AllSongs> dbSongs = [];
  fetchSongs() async {
    fetchedSongs = await _audioQuery.querySongs();

    for (var element in fetchedSongs) {
      if (element.fileExtension == "mp3") {
        allSongs.add(element);
      }
    }
    afterMapping = fetchedSongs
        .map(
          (audio) => AllSongs(
            uri: audio.uri,
            title: audio.title,
            artist: audio.artist,
            id: audio.id,
            duration: audio.duration,
          ),
        )
        .toList();
    await box.put("mainSongBox", afterMapping);
    dbSongs = box.get("mainSongBox") as List<AllSongs>;

    for (var element in dbSongs) {
      filterdSongs.add(
        Audio.file(
          element.uri.toString(),
          metas: Metas(
              title: element.title,
              id: element.id.toString(),
              artist: element.artist,
              album: element.duration!.toStringAsFixed(2)),
        ),
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // Below is the code for Linear Gradient.
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 219, 242, 39),
              Color.fromARGB(255, 1, 71, 58),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SafeArea(
            child: Text(
              'Mango',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w100,
                  fontSize: 50),
            ),
          ),
        ]),
      ),
    );
  }

  Future<void> load() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (ctx1) => ScreenMain(
              homeBuildList: filterdSongs,
            )));
  }
}
