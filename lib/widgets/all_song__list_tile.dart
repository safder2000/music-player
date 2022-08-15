import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:music_player/screens/screen_home.dart';

class SongListTile extends StatelessWidget {
  SongListTile({
    Key? key,
    required this.songTitle,
    required this.songSub,
    this.songImg = const AssetImage('assets/images/defult.jpg'),
  }) : super(key: key);
  String songTitle;
  String songSub;
  AssetImage songImg;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx1) => ScreenHome(
                          songSub: songSub,
                          songTitle: songTitle,
                          songImg: songImg,
                        ),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                            alignment: Alignment.topCenter,
                            image: songImg,
                            fit: BoxFit.fill,
                          ),
                        ),
                        height: 50,
                        width: 50,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 235,
                            child: Text(
                              songTitle,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            width: 235,
                            child: Text(
                              songSub,
                              style: TextStyle(
                                  color: Color.fromARGB(150, 255, 255, 255),
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    '3.00',
                    style: TextStyle(
                        color: Color.fromARGB(150, 255, 255, 255),
                        fontSize: 13),
                  ),
                  Iconify(
                    Carbon.overflow_menu_vertical,
                    color: Color.fromARGB(150, 255, 255, 255),
                    size: 26,
                  ),
                ],
              )
            ],
          ),
          Divider(
            color: Colors.white30,
          ),
        ],
      ),
    );
  }
}
