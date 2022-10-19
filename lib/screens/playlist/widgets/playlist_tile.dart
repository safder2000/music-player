import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:music_player/application/playlist_folder/playlist_folder_bloc.dart';
import 'package:music_player/colors/colors.dart';
import 'package:music_player/db/all_songs.dart';
import 'package:music_player/db/functions/Boxes.dart';
import 'package:music_player/screens/playlist/screen_main_playlist.dart';
import 'package:music_player/screens/playlist/widgets/playlistRename.dart';

class PlayListTile extends StatelessWidget {
  PlayListTile(
      {Key? key,
      this.icon = const Icon(Icons.music_note),
      required this.name,
      required this.index})
      : super(key: key);
  Icon icon;
  String name;
  bool? isEditable;
  int index;
  Icon tileIcon() {
    Icon temp = Icon(Icons.music_note);
    if (name == "favorite") {
      temp = Icon(Icons.favorite);
    }
    if (name == "recent") {
      temp = Icon(Icons.timelapse);
    }
    return temp;
  }

  bool editable() {
    bool temp = true;
    if (name == "favorite" || name == "recent") {
      temp = false;
    }
    return temp;
  }

  List keys = box.keys.toList();

  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: editable(),
      child: Padding(
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
                    tileIcon(),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      '$name',
                      style: TextStyle(
                          color: Color.fromARGB(255, 4, 41, 64),
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Visibility(
                  visible: editable(),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 13.0),
                    child: PopupMenuButton<int>(
                      onSelected: (result) {
                        if (result == 0) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return PlaylistRename(
                                  oldName: name,
                                );
                              });
                        }
                        if (result == 1) {
                          deleteConfirm(context: context);
                        }
                      },
                      itemBuilder: (context) => [
                        // popupmenu item 1
                        PopupMenuItem(
                          value: 0,

                          // row has two child icon and text.
                          child: Row(
                            children: [
                              Icon(
                                Icons.edit,
                                color: Color.fromARGB(255, 219, 242, 39),
                              ),
                              SizedBox(
                                // sized box with width 10
                                width: 10,
                              ),
                              Text(
                                "Rename",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 219, 242, 39),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // popupmenu item 2
                        PopupMenuItem(
                          value: 1,
                          // row has two child icon and text
                          child: Row(
                            children: [
                              Icon(
                                Icons.delete,
                                color: Color.fromARGB(255, 219, 242, 39),
                              ),
                              SizedBox(
                                // sized box with width 10
                                width: 10,
                              ),
                              Text(
                                "Delete",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 219, 242, 39),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                      offset: Offset(0, 50),
                      color: const Color.fromARGB(255, 1, 64, 64),
                      elevation: 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  deleteConfirm({required context}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: kGreen,
            scrollable: true,
            title: Text(
              "Delete ' ${keys[index]} ' ?",
              style: TextStyle(color: kYellow, fontSize: 25),
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
              InkWell(
                onTap: () {
                  context
                      .read<PlaylistFolderBloc>()
                      .add(DeletePlaylist(playlistKey: name));
                  Navigator.pop(context);
                },
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
                      Icons.delete,
                      color: Color.fromARGB(255, 242, 90, 39),
                      size: 32,
                    ),
                  ),
                ),
              )
            ],
          );
        });
  }
}

TextEditingController renameController = TextEditingController();
final box = Boxes.getList();
ValueNotifier<List<AllSongs>> playlistNotifier = ValueNotifier([]);
