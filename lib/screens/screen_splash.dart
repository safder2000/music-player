import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:music_player/application/home_page/home_page_bloc.dart';

import 'package:music_player/screens/menu/screen_main.dart';
import 'package:permission_handler/permission_handler.dart';

// final AudioPlayer audioPlayer = AudioPlayer();

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    context.read<HomePageBloc>().add(FetchAllSongs());
    HomePageState _state = context.select((HomePageBloc b) => b.state);
    if (_state.isLoaded) {
      load(context);
    } else {
      wait(context);
    }

    Permission.storage.request();
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

  load(context) async {
    // await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx1) => ScreenMain()));
  }

  wait(context) async {
    await Future.delayed(const Duration(seconds: 2));
    load(context);
  }
}
