import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:music_player/colors/colors.dart';
import 'package:music_player/db/all_songs.dart';
import 'package:music_player/db/functions/Boxes.dart';
import 'package:music_player/screens/playlist/screen_main_playlist.dart';
import 'package:music_player/screens/playlist/widgets/playlistRename.dart';

class PlayListTile extends StatefulWidget {
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
  @override
  State<PlayListTile> createState() => _PlayListTileState();
}

TextEditingController renameController = TextEditingController();
final box = Boxes.getList();
ValueNotifier<List<AllSongs>> playlistNotifier = ValueNotifier([]);

class _PlayListTileState extends State<PlayListTile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.isEditable = editable();
  }

  Icon tileIcon() {
    Icon temp = Icon(Icons.music_note);
    if (widget.name == "favorite") {
      temp = Icon(Icons.favorite);
    }
    if (widget.name == "recent") {
      temp = Icon(Icons.timelapse);
    }
    return temp;
  }

  bool editable() {
    bool temp = true;
    if (widget.name == "favorite" || widget.name == "recent") {
      temp = false;
    }
    return temp;
  }

  List keys = box.keys.toList();

  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    List<AllSongs> playlist = box.get(widget.name)!.cast<AllSongs>();
    return Visibility(
      visible: editable(),
      child: Padding(
        padding: const EdgeInsets.only(top: 4.0, bottom: 4, right: 8, left: 8),
        child: InkWell(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx1) => ScreenMainPlaylist(
                  playlist: playlist, playlistName: widget.name),
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
                      '${widget.name}',
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
                                  oldName: widget.name,
                                );
                              });
                        }
                        if (result == 1) {
                          deleteConfirm();
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

  deleteConfirm() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: kGreen,
            scrollable: true,
            title: Text(
              "Delete ' ${keys[widget.index]} ' ?",
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
                  deletePlaylist();
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

  deletePlaylist() {
    box.delete(keys[widget.index]);

    setState(() {});
    Navigator.pop(context);
  }
}
