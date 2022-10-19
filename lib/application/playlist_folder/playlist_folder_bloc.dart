import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:music_player/infrastructure/playlist_functions.dart';

part 'playlist_folder_event.dart';
part 'playlist_folder_state.dart';

class PlaylistFolderBloc
    extends Bloc<PlaylistFolderEvent, PlaylistFolderState> {
  PlaylistFolderBloc() : super(InitialState()) {
    on<PlaylistFolderEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<AllPlaylists>((event, emit) async {
      List temp = await PlaylistFunctions.fetchAllPlaylist();

      emit(PlaylistFolderState(playlistNames: temp));
    });
    on<DeletePlaylist>((event, emit) async {
      await PlaylistFunctions.deletePlaylist(playlistKey: event.playlistKey);
      List _temp = await PlaylistFunctions.fetchAllPlaylist();
      emit(PlaylistFolderState(playlistNames: _temp));
    });
    on<RenamePlaylist>((event, emit) async {
      await PlaylistFunctions.renamePlaylist(
          oldName: event.oldName, newName: event.newName);
      List _temp = await PlaylistFunctions.fetchAllPlaylist();
      emit(PlaylistFolderState(playlistNames: _temp));
    });
  }
}
