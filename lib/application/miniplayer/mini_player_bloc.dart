import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'mini_player_event.dart';
part 'mini_player_state.dart';

class MiniPlayerBloc extends Bloc<MiniPlayerEvent, MiniPlayerState> {
  MiniPlayerBloc() : super(InitialState()) {
    on<MiniPlayerEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<MiniPlayerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
