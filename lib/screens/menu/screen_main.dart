import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:music_player/screens/screen_home.dart';
import 'package:music_player/screens/menu/screen_menu.dart';

class ScreenMain extends StatefulWidget {
  ScreenMain({Key? key, required this.homeBuildList}) : super(key: key);
  List<Audio> homeBuildList = [];

  @override
  State<ScreenMain> createState() => _ScreenMainState();
}

class _ScreenMainState extends State<ScreenMain> {
  @override
  Widget build(BuildContext context) => ZoomDrawer(
        menuScreen: const ScreenMenu(),
        mainScreen: ScreenHome(homeBuildList: widget.homeBuildList),
        showShadow: true,
        shadowLayer1Color: Color.fromARGB(61, 1, 64, 64),
        shadowLayer2Color: Color.fromARGB(68, 1, 64, 64),
        moveMenuScreen: true,
        menuBackgroundColor: Color.fromARGB(255, 219, 242, 39),
        angle: 0,
        // style: DrawerStyle.style1,
      );
}
