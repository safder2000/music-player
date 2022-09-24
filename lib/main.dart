import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/db/all_songs.dart';
import 'package:music_player/db/functions/Boxes.dart';
// import 'package:just_audio/just_audio.dart';
import 'package:music_player/screens/screen_splash.dart';
import 'package:music_player/widgets/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(AllSongsAdapter());
  // await Hive.openBox<List>('allSongsList_db');
  await Hive.openBox<AllSongs>('allSongs_db');
  await Hive.openBox<List>('SongsList_db');
  final box = Boxes.getSongs();
  Paint.enableDithering = true;
  runApp(const MusicPlayer());
  AssetsAudioPlayer.setupNotificationsOpenAction((notification) {
    return true;
  });
}

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({Key? key}) : super(key: key);

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: currentTheme.currentTheme,
      // theme: ThemeData(
      //   primaryColor: const Color.fromARGB(255, 219, 242, 39),
      //   hintColor: const Color.fromARGB(255, 219, 242, 39),
      //   fontFamily: 'Sen',
      //   colorScheme: ColorScheme.fromSwatch().copyWith(
      //     secondary: const Color.fromARGB(255, 219, 242, 39),
      //   ),
      // ),
      home: const ScreenSplash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
