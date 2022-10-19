part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchSong extends SearchEvent {
  SearchSong({required this.search_text});
  String search_text;
}
