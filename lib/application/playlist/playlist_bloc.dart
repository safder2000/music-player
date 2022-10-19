import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:music_player/infrastructure/playlist_functions.dart';

part 'playlist_event.dart';
part 'playlist_state.dart';

class PlaylistBloc extends Bloc<PlaylistEvent, PlaylistState> {
  PlaylistBloc() : super(InitialState()) {
    on<PlaylistEvent>((event, emit) {});
    on<PlaylistSongs>((event, emit) async {
      List<Audio> _songs =
          await PlaylistFunctions.playlistSongs(lisKey: event.listKey);

      emit(PlaylistState(songs: _songs));
    });
    on<RemoveFromPlaylist>((event, emit) async {
      await PlaylistFunctions.removeFromPlaylist(
          index: event.index,
          songList: state.songs,
          playlistName: event.playlistName);
      List<Audio> _songs =
          await PlaylistFunctions.playlistSongs(lisKey: event.playlistName);

      emit(PlaylistState(songs: _songs));
    });
    on<AddToPlaylist>((event, emit) async {
      await PlaylistFunctions.addToPlayList(
          playlistName: event.playlistName,
          songId: event.songId,
          context: event.context,
          key: null);
      List<Audio> _songs =
          await PlaylistFunctions.playlistSongs(lisKey: event.playlistName);

      emit(PlaylistState(songs: _songs));
    });
  }
}
