part of 'main_player_bloc.dart';

@immutable
abstract class MainPlayerEvent {}

class NowPlaying extends MainPlayerEvent {
  NowPlaying({
    required this.nowPlaying,
  });
  Audio nowPlaying;
}

class IsFavorite extends MainPlayerEvent {
  // IsFavorite({required this.isFav});
  // bool isFav;
}

class AddToFavorite extends MainPlayerEvent {
  AddToFavorite(
      {required this.songId, required this.context, required this.key});
  String songId;
  final context;
  final key;
}

class Shuffle extends MainPlayerEvent {
  Shuffle({required this.isShuffle});

  bool isShuffle;
}

class Repeate extends MainPlayerEvent {
  Repeate({required this.isRepeat});

  bool isRepeat;
}

class PlayPause extends MainPlayerEvent {
  PlayPause({required this.isPlaying});

  bool isPlaying;
}

class IsPlaying extends MainPlayerEvent {
  IsPlaying({required this.isPlaying});

  bool isPlaying;
}

class PlayNext extends MainPlayerEvent {}

class PlayPrevious extends MainPlayerEvent {}
