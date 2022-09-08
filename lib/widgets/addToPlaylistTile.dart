import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:music_player/db/all_songs.dart';
import 'package:music_player/db/functions/Boxes.dart';
import 'package:music_player/screens/playlist/screen_main_playlist.dart';

class AddToPlayList extends StatefulWidget {
  AddToPlayList({
    Key? key,
    this.icon = const Icon(Icons.punch_clock),
    required this.songId,
    required this.name,
  }) : super(key: key);
  Icon icon;
  String? songId;
  String name;

  @override
  State<AddToPlayList> createState() => _AddToPlayListState();
}

final box = Boxes.getList();

class _AddToPlayListState extends State<AddToPlayList> {
  List keys = box.keys.toList();
  bool isChecked = true;
  final songBox = Boxes.getSongs();

  @override
  Widget build(BuildContext context) {
    List? playlist = box.get(widget.name);
    List<AllSongs> dbSongs = songBox.values.toList().cast<AllSongs>();
    final temp = findSong(dbSongs, widget.songId!);
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 4, right: 8, left: 8),
      child: InkWell(
        onTap: () => playlist!
                .where((element) => element.id.toString() == temp.id.toString())
                .isEmpty
            ? addToPlaylist(temp, playlist)
            : alreadyExist(temp),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              stops: [
                0.0,
                0.9,
              ],
              colors: [
                Color.fromARGB(255, 219, 242, 39),
                Color.fromARGB(225, 159, 193, 49),
              ],
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  widget.icon,
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    '${widget.name}',
                    style: TextStyle(
                        color: Color.fromARGB(255, 4, 41, 64),
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 13.0),
                  child: Icon(Icons.check_box)),
            ],
          ),
        ),
      ),
    );
  }

  removeFromPlaylist(AllSongs song, List? playlist) async {
    playlist!
        .removeWhere((element) => element.id.toString() == song.id.toString());
    Navigator.pop(context);
    SnackBar(
      content: Text(
        song.title! + " Added to Favourites",
        style: TextStyle(
          color: Color.fromARGB(255, 1, 71, 58),
        ),
      ),
    );

    log('removed');
  }

  alreadyExist(temp) {
    showSnackbar(temp, 'already in the playlist');
    Navigator.pop(context);
  }

  addToPlaylist(AllSongs song, List? playlist) async {
    playlist?.add(song);
    await box.put(widget.name, playlist!);
    Navigator.pop(context);
    showSnackbar(song, 'added to the playlist');

    log('added ${song.title}');
  }

  AllSongs findSong(List<AllSongs> songs, String id) {
    return songs.firstWhere(
      (element) => element.id.toString().contains(id),
    );
  }

  showSnackbar(AllSongs temp, String string) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Color.fromARGB(255, 219, 242, 39),
        content: Text(temp.title! + string,
            style: TextStyle(
              color: Color.fromARGB(255, 1, 71, 58),
            )),
      ),
    );
  }
}
