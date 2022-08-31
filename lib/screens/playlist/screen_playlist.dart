import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';

import 'package:music_player/screens/menu/screen_main.dart';

import 'package:music_player/widgets/miniplayer.dart';
import 'package:music_player/screens/playlist/widgets/playlist_tile.dart';

class ScreenPlaylist extends StatefulWidget {
  const ScreenPlaylist({Key? key}) : super(key: key);

  @override
  State<ScreenPlaylist> createState() => _ScreenPlaylistState();
}

class _ScreenPlaylistState extends State<ScreenPlaylist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 1, 64, 64),
        // leading: IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'PlayList',
          style: TextStyle(
              color: Color.fromARGB(255, 202, 212, 128), fontSize: 25),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor:
                            const Color.fromARGB(255, 219, 242, 39),
                        scrollable: true,
                        content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  decoration: const InputDecoration(
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
                        title: Text(
                          'New Playlist',
                          style: TextStyle(
                              color: Color.fromARGB(255, 202, 212, 128),
                              fontSize: 25),
                        ),
                        actions: [
                          InkWell(
                            onTap: (() => Navigator.pop(context)),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 1, 64, 64),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Icon(
                                  Icons.close,
                                  color: Color.fromARGB(255, 219, 242, 39),
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 1, 64, 64),
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Icon(
                                Icons.add,
                                color: Color.fromARGB(255, 219, 242, 39),
                                size: 32,
                              ),
                            ),
                          )
                        ],
                      );
                    });
              },
              icon: const Iconify(
                Carbon.add,
                color: Colors.white,
                size: 29,
              )),
          // IconButton(
          //     onPressed: () {},
          //     icon: const Iconify(
          //       Carbon.edit,
          //       color: Colors.white,
          //       size: 24,
          //     )),
          // IconButton(
          //     onPressed: () {},
          //     icon: const Iconify(
          //       Carbon.delete,
          //       color: Colors.white,
          //       size: 22,
          //     )),
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
                      height: MediaQuery.of(context).size.height * 0.794,
                      child: ListView(
                        children: [
                          //===================================================================
                          PlayListTile(
                            icon: Icon(
                              Icons.favorite,
                              color: Color.fromARGB(255, 93, 114, 22),
                            ),
                            name: 'Favorite',
                          ),
                          PlayListTile(
                            icon: Icon(
                              Icons.timelapse,
                              color: Color.fromARGB(255, 93, 114, 22),
                            ),
                            name: 'Recent',
                          ),

                          InkWell(
                            onLongPress: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor: const Color.fromARGB(
                                          255, 219, 242, 39),
                                      scrollable: true,
                                      content: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Form(
                                          child: Column(
                                            children: <Widget>[
                                              TextFormField(
                                                decoration:
                                                    const InputDecoration(
                                                  hintText: 'AR rahman',
                                                  hintStyle: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 1, 64, 64),
                                                      fontSize: 30),
                                                  labelStyle: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 1, 64, 64),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // title: Text(
                                      //   'Recent',
                                      //   style: TextStyle(
                                      //       color: Color.fromARGB(
                                      //           255, 1, 64, 64),
                                      //       fontSize: 25),
                                      // ),
                                      actions: [
                                        InkWell(
                                          onTap: (() => Navigator.pop(context)),
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 1, 64, 64),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(50),
                                              ),
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(15.0),
                                              child: Icon(
                                                Icons.close,
                                                color: Color.fromARGB(
                                                    255, 219, 242, 39),
                                                size: 30,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(
                                            color:
                                                Color.fromARGB(255, 1, 64, 64),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(50),
                                            ),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(15.0),
                                            child: Icon(
                                              Icons.save,
                                              color: Color.fromARGB(
                                                  255, 219, 242, 39),
                                              size: 32,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(
                                            color:
                                                Color.fromARGB(255, 1, 64, 64),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(50),
                                            ),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(15.0),
                                            child: Icon(
                                              Icons.delete,
                                              color: Color.fromARGB(
                                                  255, 242, 90, 39),
                                              size: 32,
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  });
                            },
                            child: PlayListTile(
                              icon: Icon(
                                Icons.book_online_sharp,
                                color: Color.fromARGB(255, 93, 114, 22),
                              ),
                              name: 'AR rahman',
                            ),
                          ),

                          //===================================================================
                        ],
                      ),
                    ),
                    // const MiniPlayer()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
