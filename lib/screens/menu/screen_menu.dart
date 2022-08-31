import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:music_player/screens/menu/screen_about.dart';
import 'package:music_player/screens/menu/screen_nerdy.dart';

class ScreenMenu extends StatefulWidget {
  const ScreenMenu({Key? key}) : super(key: key);

  @override
  State<ScreenMenu> createState() => _ScreenMenuState();
}

class _ScreenMenuState extends State<ScreenMenu> {
  bool _switchValue = true;
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 242, 39),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    const Icon(
                      Icons.settings,
                      size: 50,
                      color: Color.fromARGB(255, 1, 64, 64),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 156,
                  height: 60,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                    color: Color.fromARGB(255, 1, 64, 64),
                  ),
                  child: const Center(
                    child: Text(
                      'Customize',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                    color: Color.fromARGB(255, 1, 64, 64),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 7.0, bottom: 7.0),
                    child: Row(
                      children: [
                        const Text(
                          ' Notification',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          width: 0,
                        ),
                        Transform.scale(
                          scale: 0.8,
                          child: CupertinoSwitch(
                            trackColor: const Color.fromARGB(118, 2, 157, 157),
                            activeColor:
                                const Color.fromARGB(255, 219, 242, 39),
                            value: _switchValue,
                            onChanged: (value) {
                              setState(() {
                                _switchValue = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx1) => const ScreenAbout(),
                  )),
                  child: Container(
                    width: 110,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50)),
                      color: Color.fromARGB(255, 1, 64, 64),
                    ),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'About',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx1) => const ScreenNerdy(),
                  )),
                  child: Container(
                    width: 150,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                      color: Color.fromARGB(255, 1, 64, 64),
                    ),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'nerdy stuffs',
                          style: TextStyle(color: Colors.white, fontSize: 23),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'version',
                      style: TextStyle(
                          color: Color.fromARGB(87, 0, 0, 0), fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      '0.0.10',
                      style: TextStyle(
                          color: Color.fromARGB(87, 0, 0, 0), fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            )
          ],
        ),
      ));
}
