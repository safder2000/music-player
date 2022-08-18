import 'package:flutter/material.dart';

class PlaylistSongTile extends StatelessWidget {
  PlaylistSongTile({
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
                    // Navigator.of(context).pushReplacement(
                    //   MaterialPageRoute(
                    //     builder: (ctx1) => ScreenHome(
                    //       songSub: songSub,
                    //       songTitle: songTitle,
                    //       songImg: songImg,
                    //     ),
                    //   ),
                    // );
                  },
                  child: Row(
                    children: [
                      const SizedBox(width: 6),
                      const Icon(
                        Icons.menu,
                        color: Color.fromARGB(64, 255, 255, 255),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                            alignment: Alignment.topCenter,
                            image: songImg,
                            fit: BoxFit.fill,
                          ),
                        ),
                        height: 50,
                        width: 50,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              songTitle,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          SizedBox(
                            width: 200,
                            child: Text(
                              songSub,
                              style: const TextStyle(
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
                  const Text(
                    '3.00',
                    style: TextStyle(
                        color: Color.fromARGB(150, 255, 255, 255),
                        fontSize: 13),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  // Iconify(
                  //   Carbon.overflow_menu_vertical,
                  //   color: Color.fromARGB(150, 255, 255, 255),
                  //   size: 26,
                  // ),
                ],
              )
            ],
          ),
          const Divider(
            color: Colors.white30,
          ),
        ],
      ),
    );
  }
}
