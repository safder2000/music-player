part of 'main_player_bloc.dart';

@immutable
class MainPlayerState {
  MainPlayerState(
      {required this.isFavorite,
      required this.isPlaying,
      required this.isRepeating,
      required this.isShuffle,
      required this.nowPlaying});

  bool isFavorite;
  bool isRepeating;
  bool isPlaying;
  bool isShuffle;
  Audio? nowPlaying;
}

class InitialState extends MainPlayerState {
  InitialState()
      : super(
            isFavorite: false,
            isRepeating: false,
            isPlaying: false,
            isShuffle: false,
            nowPlaying: null);
}
