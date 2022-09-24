import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'dart:developer';
import 'package:iconify_flutter/iconify_flutter.dart'; // For Iconify Widget

import 'package:iconify_flutter/icons/carbon.dart';
import 'package:music_player/db/all_songs.dart';
import 'package:music_player/db/functions/Boxes.dart';

import 'package:music_player/widgets/home_song_list_builder.dart';

import 'package:music_player/widgets/home_song_list_tile.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({Key? key}) : super(key: key);

  @override
  State<ScreenSearch> createState() => ScreenSearchstate();
}

class ScreenSearchstate extends State<ScreenSearch> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    // image: DecorationImage(
                    //   alignment: Alignment.topCenter,
                    //   image: AssetImage('assets/images/background2.jpg'),
                    //   fit: BoxFit.fill,
                    // ),
                    color: Color.fromARGB(255, 1, 64, 64)),
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
                  child: SafeArea(
                    child: ListView(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: const Iconify(
                                Carbon.arrow_up_left,
                                color: Color.fromARGB(75, 255, 255, 255),
                                size: 25,
                              ),
                              onPressed: () {
                                // KeyboardVisibilityNotification().addNewListener(
                                //   onChange: (bool visible) {
                                //     print(visible);
                                //   },
                                // );

                                FocusManager.instance.primaryFocus?.unfocus();
                                Navigator.pop(context);
                              },
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8),
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 219, 242, 39),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      bottomLeft: Radius.circular(40),
                                    )),
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (ctx1) =>
                                                  const ScreenSearch(),
                                            ),
                                          );
                                        },
                                        icon: const Iconify(
                                          Carbon.search,
                                          color:
                                              Color.fromARGB(255, 27, 82, 72),
                                          size: 25,
                                        )),
                                    SizedBox(
                                        width: 264,
                                        child: TextField(
                                          controller: searchController,
                                          decoration: InputDecoration(
                                              hintText: 'Song title',
                                              suffixIcon: IconButton(
                                                onPressed:
                                                    searchController.clear,
                                                icon: Icon(
                                                  Icons.clear,
                                                  color: Color.fromARGB(
                                                      222, 1, 64, 64),
                                                ),
                                              )),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            ValueListenableBuilder(
                                valueListenable: searchController,
                                // valueListenable: _searchController.value,
                                builder:
                                    (BuildContext ctx, index, Widget? child) {
                                  final songBox = Boxes.getSongs();
                                  List<AllSongs> dbSongs =
                                      songBox.values.toList().cast<AllSongs>();
                                  List<AllSongs> filteredList = <AllSongs>[];
                                  //  for(int i=0; i<=student_data.length; i++){

                                  //  }
                                  for (AllSongs temp in dbSongs) {
                                    if (temp.title
                                        .toString()
                                        .toUpperCase()
                                        .contains(searchController.text
                                            .toUpperCase())) {
                                      filteredList.add(temp);
                                    }
                                  }
                                  List<Audio> filterdSongs = [];
                                  for (var element in filteredList) {
                                    filterdSongs.add(
                                      Audio.file(
                                        element.uri.toString(),
                                        metas: Metas(
                                            title: element.title,
                                            id: element.id.toString(),
                                            artist: element.artist,
                                            album: element.duration!
                                                .toStringAsFixed(2)),
                                      ),
                                    );
                                  }

                                  return Container(
                                      child: filteredList.isNotEmpty
                                          ? SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  05,
                                              child: LocalSongListBuilder(
                                                  homeBuildList: filterdSongs),
                                            )
                                          : SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  05,
                                              child: songNotFound(),
                                            ));
                                }
                                //===================================================================
                                // HomeSongListTile(
                                //   songTitle: 'LongNights',
                                //   songSub: 'appukuttan',
                                //   songImg: const AssetImage(
                                //       'assets/covers/LongNights.jpg'),
                                // ),

                                //=========================================================================
                                ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text songNotFound() {
    log('no sogsn found');
    return Text(
      'No songs found',
      style: TextStyle(color: Color.fromARGB(75, 255, 255, 255), fontSize: 20),
    );
  }
}
