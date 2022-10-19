part of 'search_bloc.dart';

@immutable
class SearchState {
  SearchState({required this.songs});
  List<Audio> songs = [];
}

class InitialState extends SearchState {
  InitialState() : super(songs: []);
}
