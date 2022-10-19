import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import 'package:music_player/db/functions/player.dart';
import 'package:music_player/infrastructure/playlist_functions.dart';

part 'main_player_event.dart';
part 'main_player_state.dart';

class MainPlayerBloc extends Bloc<MainPlayerEvent, MainPlayerState> {
  MainPlayerBloc() : super(InitialState()) {
    on<MainPlayerEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<NowPlaying>((event, emit) async {
      emit(MainPlayerState(
          isFavorite: state.isFavorite,
          isPlaying: state.isPlaying,
          isRepeating: state.isRepeating,
          nowPlaying: event.nowPlaying,
          isShuffle: state.isShuffle));
      // TODO: implement event handler
    });
    on<IsFavorite>((event, emit) async {
      bool isfav;
      if (state.nowPlaying != null) {
        isfav = await Player.isFavorate(state.nowPlaying?.metas.id);
      } else {
        isfav = false;
      }
      log(isfav.toString());
      emit(MainPlayerState(
          isFavorite: isfav,
          isPlaying: state.isPlaying,
          isRepeating: state.isRepeating,
          nowPlaying: state.nowPlaying,
          isShuffle: state.isShuffle));
      // TODO: implement event handler
    });
    on<AddToFavorite>((event, emit) async {
      await PlaylistFunctions.addToPlayList(
          playlistName: 'favorite',
          songId: event.songId,
          context: event.context,
          key: event.key);

      // emit(MainPlayerState(
      //     isFavorite: state.isFavorite,
      //     isPlaying: state.isPlaying,
      //     isRepeating: state.isRepeating,
      //     nowPlaying: state.nowPlaying,
      //     isShuffle: state.isShuffle));
      // TODO: implement event handler
      bool isfav;
      if (state.nowPlaying != null) {
        isfav = await Player.isFavorate(state.nowPlaying?.metas.id);
      } else {
        isfav = false;
      }
      log(isfav.toString());
      emit(MainPlayerState(
          isFavorite: isfav,
          isPlaying: state.isPlaying,
          isRepeating: state.isRepeating,
          nowPlaying: state.nowPlaying,
          isShuffle: state.isShuffle));
    });
    on<Shuffle>((event, emit) {
      assetsAudioPlayer.toggleShuffle();
      emit(MainPlayerState(
          isFavorite: state.isFavorite,
          isPlaying: state.isPlaying,
          isRepeating: state.isRepeating,
          nowPlaying: state.nowPlaying,
          isShuffle: event.isShuffle));
      // TODO: implement event handler
    });
    on<Repeate>((event, emit) {
      emit(MainPlayerState(
          isFavorite: state.isFavorite,
          isPlaying: state.isPlaying,
          isRepeating: event.isRepeat,
          nowPlaying: state.nowPlaying,
          isShuffle: state.isShuffle));
      // TODO: implement event handler
    });
    on<PlayPause>((event, emit) {
      state.isPlaying ? Player.pauseSong() : Player.playSong();
      emit(MainPlayerState(
          isFavorite: state.isFavorite,
          isPlaying: event.isPlaying,
          isRepeating: state.isRepeating,
          nowPlaying: state.nowPlaying,
          isShuffle: state.isShuffle));
      // TODO: implement event handler
    });
    on<IsPlaying>((event, emit) {
      emit(MainPlayerState(
          isFavorite: state.isFavorite,
          isPlaying: event.isPlaying,
          isRepeating: state.isRepeating,
          nowPlaying: state.nowPlaying,
          isShuffle: state.isShuffle));
      // TODO: implement event handler
    });
    on<PlayNext>((event, emit) {
      Player.playNextSong();
      emit(MainPlayerState(
          isFavorite: state.isFavorite,
          isPlaying: state.isPlaying,
          isRepeating: state.isRepeating,
          nowPlaying: state.nowPlaying,
          isShuffle: state.isShuffle));
      // TODO: implement event handler
    });
    on<PlayPrevious>((event, emit) {
      Player.playPreviusSong();
      emit(MainPlayerState(
          isFavorite: state.isFavorite,
          isPlaying: state.isPlaying,
          isRepeating: state.isRepeating,
          nowPlaying: state.nowPlaying,
          isShuffle: state.isShuffle));
      // TODO: implement event handler
    });
  }
}
