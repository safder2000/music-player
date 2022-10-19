part of 'playlist_bloc.dart';

@immutable
abstract class PlaylistEvent {}

class PlaylistSongs extends PlaylistEvent {
  PlaylistSongs({required this.listKey});
  String listKey;
}

class RemoveFromPlaylist extends PlaylistEvent {
  RemoveFromPlaylist({required this.index, required this.playlistName});
  int index;

  String playlistName;
}

class AddToPlaylist extends PlaylistEvent {
  AddToPlaylist(
      {required this.songId,
      required this.playlistName,
      required this.context,
      required this.key});
  String songId;
  final context;
  final key;

  String playlistName;
}
