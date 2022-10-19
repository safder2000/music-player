import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/colors/colors.dart';
import 'package:music_player/db/functions/Boxes.dart';

import '../../../application/playlist_folder/playlist_folder_bloc.dart';

class PlaylistRename extends StatelessWidget {
  PlaylistRename({super.key, required this.oldName});
  String oldName;
  final _box = Boxes.getList();
  String? _title;
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kGreen,
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
                  color: kYellow,
                ),
              ),
            ),
            style: const TextStyle(
              color: kYellow,
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
            SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                if (formkey.currentState!.validate()) {
                  context
                      .read<PlaylistFolderBloc>()
                      .add(RenamePlaylist(oldName: oldName, newName: _title!));

                  Navigator.pop(context);
                }
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
                    Icons.save,
                    color: kGreen,
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
