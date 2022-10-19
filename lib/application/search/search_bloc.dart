import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:music_player/infrastructure/search_function.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(InitialState()) {
    on<SearchEvent>((event, emit) {});
    on<SearchSong>((event, emit) {
      List<Audio> _temp =
          SearchFuction.SearchSong(Search_text: event.search_text);
      emit(SearchState(songs: _temp));
    });
  }
}
