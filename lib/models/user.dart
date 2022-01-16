import 'package:flutter/foundation.dart';
import 'package:spotify_clone/models/playlist.dart';
import 'package:spotify_clone/models/song.dart';

class SpotifyUser {
  final String uid;
  final String userName;
  final String? password;
  final String dateOfBirth;
  final String gender;
  final String? email;
  final String? phoneNumber;
  final String? avatarUrl;

  // privacy section
  final bool isOptInForReceivingMarketingMessages;
  final bool isOptInForSharingPersonalDataForMarketingPurposes;

  // user's current subscription status
  final bool hasPremiumAccount;
  final String? premiumPlan;

  // user's playlist and liked songs
  final List<Playlist> playlists;
  final List<Song> likedSongs;

  /// _id of the device
  final String deviceId;
  final String? playingDevice;
  final List<String> connectedDevices;

  /// _id of the users
  final List<String> followers;
  final List<String> following;
  final List<Song> recentlyPlayed;

  /// Artist Section
  final bool isUserArtist;
  final int? artistPopularityCount;
  final int? monthlyListeners;
  final List<Song>? songs;
  final int? positionInWorld;
  final bool? isVerified;
  final List<String>? photos;
  final String? about;

  SpotifyUser({
    required this.uid,
    required this.userName,
    this.password,
    required this.dateOfBirth,
    required this.gender,
    this.email,
    this.phoneNumber,
    this.avatarUrl,
    required this.isOptInForReceivingMarketingMessages,
    required this.isOptInForSharingPersonalDataForMarketingPurposes,
    required this.hasPremiumAccount,
    required this.premiumPlan,
    required this.playlists,
    required this.recentlyPlayed,
    required this.likedSongs,
    required this.deviceId,
    required this.playingDevice,
    required this.connectedDevices,
    required this.followers,
    required this.following,
    required this.isUserArtist,
    this.artistPopularityCount,
    this.monthlyListeners,
    this.songs,
    this.positionInWorld,
    this.isVerified,
    this.photos,
    this.about,
  });
}

class SpotifyUserProvider extends ChangeNotifier {
  SpotifyUser? _userDetails;
}
