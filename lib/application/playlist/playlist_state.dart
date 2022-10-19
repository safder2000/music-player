part of 'playlist_bloc.dart';

@immutable
class PlaylistState {
  PlaylistState({required this.songs});
  List<Audio> songs = [];
}

class InitialState extends PlaylistState {
  InitialState() : super(songs: []);
}
