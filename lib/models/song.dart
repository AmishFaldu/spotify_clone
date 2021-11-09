import 'package:flutter/foundation.dart';
import 'package:spotify_clone/models/lyrics.dart';
import 'package:spotify_clone/models/user.dart';

class Song {
  final String title;
  final List<User> artists;
  final List<Lyric> lyrics;
  final bool hasLyrics;
  final String avatar;
  final int popularityCount;

  // ignore: slash_for_doc_comments
  /**
   * ARGB value of shade
   */
  final List<int> shade;

  Song(
    this.title,
    this.artists,
    this.lyrics,
    this.hasLyrics,
    this.avatar,
    this.shade,
    this.popularityCount,
  );
}

class SongProvider extends ChangeNotifier {}
