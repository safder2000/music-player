import 'package:assets_audio_player/assets_audio_player.dart';

import 'package:music_player/db/all_songs.dart';
import 'package:music_player/db/functions/Boxes.dart';
import 'package:music_player/infrastructure/playlist_functions.dart';

class SearchFuction {
  static List<Audio> SearchSong({required String Search_text}) {
    final songBox = Boxes.getSongs();
    List<AllSongs> dbSongs = songBox.values.toList().cast<AllSongs>();
    List<AllSongs> filteredList = <AllSongs>[];
    for (AllSongs temp in dbSongs) {
      if (temp.title
          .toString()
          .toUpperCase()
          .contains(Search_text.toUpperCase())) {
        filteredList.add(temp);
      }
    }

    List<Audio> searchResult = PlaylistFunctions.toAudio(rowList: filteredList);
    return searchResult;
  }
}
