import 'package:hive/hive.dart';
part 'all_songs.g.dart';

@HiveType(typeId: 0)
class AllSongs extends HiveObject {
  AllSongs({
    required this.uri,
    required this.title,
    required this.artist,
    required this.id,
    required this.duration,
  });

  @HiveField(0)
  String? uri;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? artist;
  @HiveField(4)
  int? id;
  @HiveField(3)
  int? duration;
}
