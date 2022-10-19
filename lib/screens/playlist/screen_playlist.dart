import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';

import 'package:music_player/application/playlist_folder/playlist_folder_bloc.dart';
import 'package:music_player/colors/colors.dart';
import 'package:music_player/db/all_songs.dart';
import 'package:music_player/db/functions/Boxes.dart';

import 'package:music_player/screens/playlist/widgets/default_playlist.dart';

import 'package:music_player/screens/playlist/widgets/playlist_tile.dart';

class ScreenPlaylist extends StatelessWidget {
  List<Audio> homeBuildList;
  // int songIndex;
  ScreenPlaylist({
    Key? key,
    required this.homeBuildList,
    //  required this.songIndex
  }) : super(key: key);

  final box = Boxes.getList();
  final _newPlayList = TextEditingController();
  List<AllSongs> playlists = [];
  String? playListTitle;
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    context.read<PlaylistFolderBloc>().add(AllPlaylists());

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
                        backgroundColor: kGreen,
                        scrollable: true,
                        content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            key: formkey,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                    maxLength: 15,
                                    minLines: 1,
                                    onChanged: (value) {
                                      playListTitle = value.trim();
                                    },
                                    cursorColor: kYellow,
                                    cursorHeight: 30,
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: kYellow,
                                    ),
                                    controller: _newPlayList,
                                    decoration: const InputDecoration(
                                      labelText: 'New Playlist',
                                      labelStyle: TextStyle(
                                        color: Color.fromARGB(255, 1, 64, 64),
                                      ),
                                    ),
                                    validator: (value) {
                                      List keys = box.keys.toList();
                                      if (value!.trim() == "") {
                                        return "name required";
                                      }
                                      if (keys
                                          .where((element) =>
                                              element == value.trim())
                                          .isNotEmpty) {
                                        return "this name already exits";
                                      }
                                      return null;
                                    }),
                              ],
                            ),
                          ),
                        ),
                        actions: [
                          InkWell(
                            onTap: (() => Navigator.pop(context)),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: kYellow,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Icon(
                                  Icons.close,
                                  color: kGreen,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: kYellow,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(15.0),
                              child: InkWell(
                                onTap: () {
                                  if (formkey.currentState!.validate()) {
                                    box.put(playListTitle, playlists);
                                    Navigator.pop(context);
                                  }
                                },
                                child: const Icon(
                                  Icons.add,
                                  color: kGreen,
                                  size: 31,
                                ),
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
        ],
      ),
      body: ListView(
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
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView(
                        children: [
                          //===================================================================

                          SizedBox(
                            height: 4,
                          ),
                          defaultPlaylist(
                            name: 'favorite',
                          ),
                          defaultPlaylist(
                            name: 'recent',
                          ),

                          Container(
                            height: MediaQuery.of(context).size.height,
                            child: BlocBuilder<PlaylistFolderBloc,
                                PlaylistFolderState>(
                              builder: (context, state) {
                                return
                                    // ValueListenableBuilder<Box<List>>(
                                    //   valueListenable: Boxes.getList().listenable(),
                                    //   builder: (BuildContext ctx, box, _) {
                                    //     List keys = box.keys.toList();

                                    //     return
                                    ListView.builder(
                                  itemCount: state.playlistNames.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    String title = state.playlistNames[index];

                                    return PlayListTile(
                                      name: title,
                                      index: index,
                                    );
                                  },
                                );
                                //   },
                                // );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  createNewPlayList() {
    final PlaylistName = _newPlayList.text.trim();

    if (PlaylistName.isEmpty) {
      log('playlist name null boi');
      return;
    } else {
      // newPlayList(PlaylistName);
    }
  }
}
