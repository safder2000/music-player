import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:iconify_flutter/icons/zondicons.dart';
import 'package:music_player/screens/screen_all.dart';
import 'package:music_player/screens/screen_main.dart';
import 'package:music_player/screens/tests.dart';
import 'package:music_player/widgets/all_song__list_tile.dart';
import 'package:music_player/widgets/menu.dart';
import 'package:music_player/widgets/miniplayer.dart';
import 'package:music_player/widgets/playlist_tile.dart';

class ScreenPlaylist extends StatefulWidget {
  const ScreenPlaylist({Key? key}) : super(key: key);

  @override
  State<ScreenPlaylist> createState() => _ScreenPlaylistState();
}

class _ScreenPlaylistState extends State<ScreenPlaylist> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 1, 64, 64),
          // leading: IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (ctx1) => ScreenMain(),
              ));
            },
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Color.fromARGB(255, 219, 242, 39),
                          scrollable: true,
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Form(
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'New Playlist',
                                      labelStyle: TextStyle(
                                        color: Color.fromARGB(255, 1, 64, 64),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          actions: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 1, 64, 64),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Icon(
                                  Icons.add,
                                  color: Color.fromARGB(255, 219, 242, 39),
                                  size: 30,
                                ),
                              ),
                            )
                          ],
                        );
                      });
                },
                icon: Iconify(
                  Carbon.add,
                  color: Colors.white,
                  size: 29,
                )),
            IconButton(
                onPressed: () {},
                icon: Iconify(
                  Carbon.edit,
                  color: Colors.white,
                  size: 24,
                )),
            IconButton(
                onPressed: () {},
                icon: Iconify(
                  Carbon.delete,
                  color: Colors.white,
                  size: 22,
                )),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                decoration:
                    const BoxDecoration(color: Color.fromARGB(255, 1, 64, 64)),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [
                        0.00,
                        0.00,
                        0.7,
                      ],
                      colors: [
                        Color.fromARGB(255, 1, 64, 64),
                        Color.fromARGB(255, 1, 64, 64),
                        Color.fromARGB(182, 0, 0, 0),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 545,
                        child: ListView(
                          children: [
                            //===================================================================
                            PlayListTile(),
                            PlayListTile(),
                            PlayListTile(),
                            PlayListTile(),

                            //===================================================================
                          ],
                        ),
                      ),
                      MiniPlayer()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
