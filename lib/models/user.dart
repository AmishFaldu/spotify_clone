import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:spotify_clone/models/playlist.dart';
import 'package:spotify_clone/models/song.dart';

class User {
  final String uid;
  final String userName;
  final String password;
  final bool hasPremiumAccount;
  final String? premiumPlan;
  final List<Playlist> playlists;
  final List<Song> likedSongs;

  /// _id of the device
  final String? playingDevice;
  final List<String> connectedDevices;

  final double volume;
  final String email;
  final String? avatarUrl;

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

  User({
    required this.uid,
    required this.userName,
    required this.password,
    required this.hasPremiumAccount,
    required this.premiumPlan,
    required this.playlists,
    required this.likedSongs,
    required this.playingDevice,
    required this.connectedDevices,
    required this.volume,
    required this.email,
    required this.avatarUrl,
    required this.followers,
    required this.following,
    required this.recentlyPlayed,
    required this.isUserArtist,
    this.monthlyListeners,
    this.songs,
    this.positionInWorld,
    this.isVerified,
    this.photos,
    this.about,
    this.artistPopularityCount,
  });
}

class UserProvider extends ChangeNotifier {
  User? _userDetails;

  Future<void> signInUser(String email, String password) async {
    final userAuthResponse = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    final response = await FirebaseFirestore.instance
        .collection("users")
        .doc(userAuthResponse.user?.uid)
        .get();
    final userData = response.data();
    if (userData != null) {
      _userDetails = User(
        uid: userData['uid'],
        userName: userData['userName'],
        password: userData['password'],
        hasPremiumAccount: userData['hasPremiumAccount'],
        premiumPlan: userData['premiumPlan'],
        playlists: userData['playlists'],
        likedSongs: userData['likedSongs'],
        playingDevice: userData['playingDevice'],
        connectedDevices: userData['connectedDevices'],
        volume: userData['volume'],
        email: userData['email'],
        avatarUrl: userData['avatarUrl'],
        followers: userData['followers'],
        following: userData['following'],
        recentlyPlayed: userData['recentlyPlayed'],
        isUserArtist: userData['isUserArtist'],
        monthlyListeners: userData['monthlyListeners'],
        songs: userData['songs'],
        positionInWorld: userData['positionInWorld'],
        isVerified: userData['isVerified'],
        photos: userData['photos'],
        about: userData['about'],
        artistPopularityCount: userData['artistPopularityCount'],
      );
    }
  }

  Future<void> signUpUser(
      String userName, String email, String password) async {
    final userAuthResponse = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    final userData = {
      'uid': userAuthResponse.user?.uid,
      'userName': userName,
      'password': password,
      'hasPremiumAccount': false,
      'premiumPlan': null,
      'playlists': [],
      'likedSongs': [],
      'playingDevice': null,
      'connectedDevices': [],
      'volume': 70,
      'email': email,
      'avatarUrl': null,
      'followers': [],
      'following': [],
      'recentlyPlayed': [],
      'isUserArtist': false,
    };
    await FirebaseFirestore.instance.collection('user').add(userData);
    _userDetails = User(
      uid: userAuthResponse.user!.uid,
      userName: userName,
      password: password,
      hasPremiumAccount: false,
      premiumPlan: null,
      playlists: [],
      likedSongs: [],
      playingDevice: null,
      connectedDevices: [],
      volume: 70,
      email: email,
      avatarUrl: null,
      followers: [],
      following: [],
      recentlyPlayed: [],
      isUserArtist: false,
    );
  }

  Future<void> logOutUser() async {
    await FirebaseAuth.instance.signOut();
  }
}
