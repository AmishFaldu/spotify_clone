import 'package:flutter/cupertino.dart';
import 'package:spotify_clone/models/song.dart';
import 'package:spotify_clone/models/user.dart';

class Playlist extends ChangeNotifier {
  final String name;
  final List<Song> songs;
  final List<SpotifyUser> creator;
  final List<String> photos;
  final bool isPrivate;

  Playlist(
    this.name,
    this.songs,
    this.creator,
    this.photos,
    this.isPrivate,
  );
}
