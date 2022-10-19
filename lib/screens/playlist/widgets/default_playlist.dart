import 'package:flutter/material.dart';
import 'package:music_player/db/all_songs.dart';
import 'package:music_player/db/functions/playlist.dart';
import 'package:music_player/screens/playlist/screen_main_playlist.dart';

class defaultPlaylist extends StatelessWidget {
  defaultPlaylist({
    super.key,
    required this.name,
  });
  String name;
  Icon tileIcon() {
    Icon temp = Icon(Icons.music_note);
    if (name == "favorite") {
      temp = Icon(
        Icons.favorite,
        color: Color.fromARGB(255, 1, 64, 64),
      );
    }
    if (name == "recent") {
      temp = Icon(
        Icons.timelapse,
        color: Color.fromARGB(255, 1, 64, 64),
      );
    }
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    List<AllSongs> playlist = box.get(name)!.cast<AllSongs>();
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 4, right: 8, left: 8),
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx1) => ScreenMainPlaylist(playlistName: name),
          ),
        ),
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
                Color.fromARGB(80, 218, 242, 39),
                Color.fromARGB(36, 159, 193, 49),
              ],
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          height: 60,
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              tileIcon(),
              const SizedBox(
                width: 20,
              ),
              Text(
                '${name}',
                style: TextStyle(
                    color: Color.fromARGB(255, 202, 212, 128),
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
