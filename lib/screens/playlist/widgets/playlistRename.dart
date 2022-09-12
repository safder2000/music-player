import 'package:flutter/material.dart';
import 'package:music_player/db/functions/Boxes.dart';

class PlaylistRename extends StatelessWidget {
  PlaylistRename({super.key, required this.oldName});
  String oldName;
  final _box = Boxes.getList();
  String? _title;
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 219, 242, 39),
      scrollable: true,
      // title: Text(
      //   'Recent',
      //   style: TextStyle(
      //       color: Color.fromARGB(
      //           255, 1, 64, 64),
      //       fontSize: 25),
      // ),
      actions: [
        SizedBox(
          height: 20,
          width: 10,
        ),
        Form(
          key: formkey,
          child: TextFormField(
            initialValue: oldName,
            cursorHeight: 25,
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 1, 64, 64),
                ),
              ),
            ),
            style: const TextStyle(
              color: Color.fromARGB(255, 1, 64, 64),
              fontSize: 20,
            ),
            onChanged: (value) {
              _title = value.trim();
            },
            validator: (value) {
              List keys = _box.keys.toList();
              if (value!.trim() == "") {
                return "name Required";
              }
              if (keys.where((element) => element == value.trim()).isNotEmpty) {
                return "this name already exits";
              }
              return null;
            },
          ),
        ),
        SizedBox(
          height: 20,
          width: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
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
            SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                if (formkey.currentState!.validate()) {
                  List? playlists = _box.get(oldName);
                  _box.put(_title, playlists!);
                  _box.delete(oldName);
                  Navigator.pop(context);
                }
              },
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
                    Icons.save,
                    color: Color.fromARGB(255, 219, 242, 39),
                    size: 32,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}