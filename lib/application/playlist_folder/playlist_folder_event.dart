part of 'playlist_folder_bloc.dart';

@immutable
abstract class PlaylistFolderEvent {}

class AllPlaylists extends PlaylistFolderEvent {}

class DeletePlaylist extends PlaylistFolderEvent {
  DeletePlaylist({required this.playlistKey});
  String playlistKey;
}

class RenamePlaylist extends PlaylistFolderEvent {
  RenamePlaylist({required this.oldName, required this.newName});
  String oldName;
  String newName;
}
