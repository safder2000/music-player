import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:music_player/infrastructure/fetch_song.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(InitialState()) {
    on<HomePageEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<FetchAllSongs>((event, emit) async {
      List<Audio> fetchedsongs = await FetchSong.fetchAllSong();
      state.songs = fetchedsongs;
      if (state.songs.isNotEmpty) {
        state.isLoaded = true;
      }
      // HomePageState(songs: fetchedsongs);
      emit(state);
      // TODO: implement event handler
    });
  }
}
