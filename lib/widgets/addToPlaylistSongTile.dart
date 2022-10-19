import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/application/playlist/playlist_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class AddToPlalistTileBuilder extends StatelessWidget {
  List<Audio> homeBuildList = [];
  String playlistName;
  AddToPlalistTileBuilder(
      {Key? key, required this.homeBuildList, required this.playlistName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => SongTile(
        homeBuildList: homeBuildList,
        songIndex: index,
        playlistName: playlistName,
      ),
      itemCount: homeBuildList.length,
    );
  }
}

class SongTile extends StatelessWidget {
  SongTile({
    Key? key,
    required this.homeBuildList,
    required this.playlistName,
    this.songIndex,
    this.songImg = const AssetImage('assets/images/defult.jpg'),
  }) : super(key: key);
  List<Audio> homeBuildList = [];
  AssetImage songImg;
  final songIndex;
  String playlistName;

  Object? _value = 0;

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
                    context.read<PlaylistBloc>().add(AddToPlaylist(
                        songId: homeBuildList[songIndex].metas.id!,
                        playlistName: playlistName,
                        context: context,
                        key: _scaffoldKey));
                  },
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
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
                        child: SizedBox(
                          child: QueryArtworkWidget(
                            id: int.parse(homeBuildList[songIndex].metas.id!),
                            type: ArtworkType.AUDIO,
                            artworkBorder: BorderRadius.circular(8),
                            nullArtworkWidget: Image(
                              image: AssetImage('assets/images/defult.jpg'),
                            ),
                            format: ArtworkFormat.PNG,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 235,
                            child: Text(
                              homeBuildList[songIndex].metas.title!,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          SizedBox(
                            width: 235,
                            child: Text(
                              '${homeBuildList[songIndex].metas.artist}',
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
