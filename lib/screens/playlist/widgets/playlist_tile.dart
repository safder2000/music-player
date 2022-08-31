import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:music_player/screens/playlist/screen_main_playlist.dart';

class PlayListTile extends StatefulWidget {
  PlayListTile(
      {Key? key, this.icon = const Icon(Icons.punch_clock), required this.name})
      : super(key: key);
  Icon icon;
  String name;

  @override
  State<PlayListTile> createState() => _PlayListTileState();
}

class _PlayListTileState extends State<PlayListTile> {
  bool isChecked = true;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 4.0, bottom: 4, right: 8, left: 8),
        child: InkWell(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx1) => const ScreenMainPlaylist(),
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
                  child: PopupMenuButton<int>(
                    itemBuilder: (context) => [
                      // popupmenu item 1
                      PopupMenuItem(
                        onTap: () {
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
                                          color: Color.fromARGB(255, 1, 64, 64),
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
                                        color: Color.fromARGB(255, 1, 64, 64),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(50),
                                        ),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: Icon(
                                          Icons.save,
                                          color:
                                              Color.fromARGB(255, 219, 242, 39),
                                          size: 32,
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
                                          Icons.delete,
                                          color:
                                              Color.fromARGB(255, 242, 90, 39),
                                          size: 32,
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              });
                        },
                        value: 1,
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
                            Text("Rename",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 219, 242, 39),
                                ))
                          ],
                        ),
                      ),
                      // popupmenu item 2
                      PopupMenuItem(
                        value: 2,
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
              ],
            ),
          ),
        ),
      );
}
