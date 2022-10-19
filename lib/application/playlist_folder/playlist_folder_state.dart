part of 'playlist_folder_bloc.dart';

@immutable
class PlaylistFolderState {
  PlaylistFolderState({required this.playlistNames});
  List playlistNames = [];
}

class InitialState extends PlaylistFolderState {
  InitialState() : super(playlistNames: []);
}
