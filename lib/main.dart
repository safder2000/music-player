import 'package:flutter/material.dart';
import 'package:music_player/screens/screen_splash.dart';

void main() {
  Paint.enableDithering = true;
  runApp(const MusicPlayer());
}

class MusicPlayer extends StatelessWidget {
  const MusicPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 219, 242, 39),
        hintColor: Color.fromARGB(255, 219, 242, 39),
        fontFamily: 'Sen',
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Color.fromARGB(255, 219, 242, 39),
        ),
      ),
      home: const ScreenSplash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
