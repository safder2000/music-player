part of 'home_page_bloc.dart';

@immutable
class HomePageState {
  HomePageState({required this.songs, required this.isLoaded});
  List<Audio> songs = [];
  bool isLoaded;
}

class InitialState extends HomePageState {
  InitialState() : super(songs: [], isLoaded: false);
}
