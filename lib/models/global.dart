import 'package:flutter/foundation.dart';
import 'package:spotify_clone/models/song.dart';
import 'package:spotify_clone/models/user.dart';

class SpotifyGlobal extends ChangeNotifier {
  final List<Song> popularSongs;
  final List<SpotifyUser> topArtists;

  SpotifyGlobal(
    this.popularSongs,
    this.topArtists,
  );
}
