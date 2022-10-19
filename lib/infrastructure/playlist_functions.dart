import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';

import 'package:music_player/db/all_songs.dart';
import 'package:music_player/db/functions/Boxes.dart';
import 'package:music_player/widgets/addToFavorite.dart';

class PlaylistFunctions {
//=======================  Convert to audio file  ====================================================================

  static List<Audio> toAudio({required List rowList}) {
    List<Audio> audioFiles = [];
    for (var element in rowList) {
      audioFiles.add(
        Audio.file(
          element.uri.toString(),
          metas: Metas(
              title: element.title,
              id: element.id.toString(),
              artist: element.artist,
              album: element.duration!.toStringAsFixed(2)),
        ),
      );
    }
    return audioFiles;
  }

  static Future<List<Audio>> playlistSongs({required String lisKey}) async {
    final listBox = await Boxes.getList();
    final songs = await listBox.get(lisKey);
    List<Audio> emptyList = [];
    List<Audio> audioFiles = toAudio(rowList: songs ?? emptyList);
    return audioFiles;
  }
//=======================  Remove Song From Playlist  ====================================================================

  static removeFromPlaylist(
      {required int index,
      required List<Audio> songList,
      required String playlistName}) async {
    final songBox = await Boxes.getSongs();
    final Listbox = await Boxes.getList();
    // final box = Boxes.getList();

    List<AllSongs> dbSongs = songBox.values.toList().cast<AllSongs>();
    List? thisList = Listbox.get(playlistName);

    final temp = findSong(dbSongs, songList[index].metas.id!);
    thisList!
        .removeWhere((element) => element.id.toString() == temp.id.toString());
    await Listbox.put(playlistName, thisList);
    log('removed ${temp.title} from $playlistName');

    // final playList = box.values.toList().cast<List>();
    // List playListName = box.keys.toList();
  }

  static AllSongs findSong(List<AllSongs> songs, String id) {
    return songs.firstWhere(
      (element) => element.id.toString().contains(id),
    );
  }

//=======================  Fetch All Playlist  ====================================================================
  static fetchAllPlaylist() async {
    final Listbox = await Boxes.getList();
    List keys = Listbox.keys.toList();
    return keys;
  }
//=======================  Delete  ====================================================================

  static deletePlaylist({required String playlistKey}) async {
    final Listbox = await Boxes.getList();
    Listbox.delete(playlistKey);
  }

//=======================  RENAME  ====================================================================
  static renamePlaylist(
      {required String oldName, required String newName}) async {
    final _box = await Boxes.getList();

    List? playlists = _box.get(oldName);
    _box.put(newName, playlists!);
    _box.delete(oldName);
  }
//======================= Add Song To PlayList ====================================================================

  static addToPlayList(
      {required String playlistName,
      required String songId,
      required context,
      required key}) async {
    final _box = await Boxes.getList();

    final playList = _box.values.toList().cast<List>();

    if (playlistName == "favorite") {
      Favorite.AddToFavorite(
        context: context,
        songId: songId,
        key: null,
      );
      // Navigator.pop(context);
    }
    if (playlistName != "favorite") {
      Favorite.AddSongToPlaylist(
        name: playlistName,
        // songId: homeBuildList[songIndex].metas.id!,
        songId: songId,
        context: context, key: key,
      );

      // Navigator.pop(context);
    }
  }
}
