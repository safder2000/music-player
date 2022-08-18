import 'package:flutter/material.dart';

import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:music_player/screens/screen_home.dart';
import 'package:music_player/screens/menu/screen_menu.dart';

class ScreenMain extends StatefulWidget {
  const ScreenMain({Key? key}) : super(key: key);

  @override
  State<ScreenMain> createState() => _ScreenMainState();
}

class _ScreenMainState extends State<ScreenMain> {
  @override
  Widget build(BuildContext context) => const ZoomDrawer(
        menuScreen: const ScreenMenu(),
        mainScreen: ScreenHome(),
        showShadow: true,
        shadowLayer1Color: Color.fromARGB(61, 1, 64, 64),
        shadowLayer2Color: Color.fromARGB(68, 1, 64, 64),
        moveMenuScreen: true,
        menuBackgroundColor: Color.fromARGB(255, 219, 242, 39),
        angle: 0,
        // style: DrawerStyle.style1,
      );
}
