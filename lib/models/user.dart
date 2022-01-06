import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:spotify_clone/models/playlist.dart';
import 'package:spotify_clone/models/song.dart';

class SpotifyUser {
  final String uid;
  final String userName;
  final String password;
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
    required this.password,
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

  Future<void> signInUser(String email, String password) async {
    final userAuthResponse = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    final response = await FirebaseFirestore.instance
        .collection("users")
        .doc(userAuthResponse.user?.uid)
        .get();
    final userData = response.data();
    if (userData != null) {
      _userDetails = SpotifyUser(
        uid: userData['uid'],
        userName: userData['userName'],
        password: userData['password'],
        dateOfBirth: userData['dateOfBirth'],
        gender: userData['gender'],
        email: userData['email'],
        phoneNumber: userData['phoneNumber'],
        avatarUrl: userData['avatarUrl'],
        isOptInForReceivingMarketingMessages:
            userData['isOptInForReceivingMarketingMessages'],
        isOptInForSharingPersonalDataForMarketingPurposes:
            userData['isOptInForSharingPersonalDataForMarketingPurposes'],
        hasPremiumAccount: userData['hasPremiumAccount'],
        premiumPlan: userData['premiumPlan'],
        playlists: userData['playlists'],
        likedSongs: userData['likedSongs'],
        recentlyPlayed: userData['recentlyPlayed'],
        deviceId: "",
        playingDevice: userData['playingDevice'],
        connectedDevices: userData['connectedDevices'],
        followers: userData['followers'],
        following: userData['following'],
        isUserArtist: userData['isUserArtist'],
        artistPopularityCount: userData['artistPopularityCount'],
        monthlyListeners: userData['monthlyListeners'],
        songs: userData['songs'],
        positionInWorld: userData['positionInWorld'],
        isVerified: userData['isVerified'],
        photos: userData['photos'],
        about: userData['about'],
      );
    }
  }

  Future<void> signUpUserWithEmail({
    required String userName,
    required String email,
    required String password,
    required String gender,
    required String dateOfBirth,
    required isOptInForReceivingMarketingMessages,
    required isOptInForSharingPersonalDataForMarketingPurposes,
  }) async {
    final userAuthResponse = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    final userData = {
      'uid': userAuthResponse.user?.uid,
      'userName': userName,
      'password': password,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
      'email': email,
      'phoneNumber': null,
      'avatarUrl': null,
      'isOptInForReceivingMarketingMessages':
          isOptInForReceivingMarketingMessages,
      'isOptInForSharingPersonalDataForMarketingPurposes':
          isOptInForSharingPersonalDataForMarketingPurposes,
      'hasPremiumAccount': false,
      'premiumPlan': null,
      'playlists': [],
      'likedSongs': [],
      'recentlyPlayed': [],
      'deviceId': '',
      'playingDevice': null,
      'connectedDevices': [],
      'followers': [],
      'following': [],
      'isUserArtist': false,
    };

    await FirebaseFirestore.instance.collection('user').add(userData);
    _userDetails = SpotifyUser(
      uid: userAuthResponse.user!.uid,
      userName: userName,
      password: password,
      dateOfBirth: dateOfBirth,
      gender: gender,
      email: email,
      phoneNumber: null,
      avatarUrl: null,
      isOptInForReceivingMarketingMessages:
          isOptInForReceivingMarketingMessages,
      isOptInForSharingPersonalDataForMarketingPurposes:
          isOptInForSharingPersonalDataForMarketingPurposes,
      hasPremiumAccount: false,
      premiumPlan: null,
      playlists: [],
      likedSongs: [],
      recentlyPlayed: [],
      deviceId: '',
      playingDevice: null,
      connectedDevices: [],
      followers: [],
      following: [],
      isUserArtist: false,
    );
  }

  // Future<void> signUpUserWithPhoneNumber({
  //   required String userName,
  //   required String phoneNumber,
  //   required String gender,
  //   required String dateOfBirth,
  //   required isOptInForReceivingMarketingMessages,
  //   required isOptInForSharingPersonalDataForMarketingPurposes,
  // }) async {
  //   final userAuthResponse = await FirebaseAuth.instance.verifyPhoneNumber(
  //     phoneNumber: phoneNumber,
  //     timeout: Duration(minutes: 5),
  //     forceResendingToken: 2,
  //     verificationFailed: (exception) {
  //       print(exception);
  //     },
  //     codeAutoRetrievalTimeout: (verificationId) {
  //       print("timeout for verification id $verificationId");
  //     },
  //     codeSent: (verificationId, forceResendingToken) {
  //
  //     },
  //     verificationCompleted: (PhoneAuthCredential _creds) {
  //       print(_creds);
  //     },
  //   );
  //
  //   final userData = {
  //     'uid': userAuthResponse.user?.uid,
  //     'userName': userName,
  //     'password': password,
  //     'dateOfBirth': dateOfBirth,
  //     'gender': gender,
  //     'email': email,
  //     'phoneNumber': null,
  //     'avatarUrl': null,
  //     'isOptInForReceivingMarketingMessages':
  //         isOptInForReceivingMarketingMessages,
  //     'isOptInForSharingPersonalDataForMarketingPurposes':
  //         isOptInForSharingPersonalDataForMarketingPurposes,
  //     'hasPremiumAccount': false,
  //     'premiumPlan': null,
  //     'playlists': [],
  //     'likedSongs': [],
  //     'recentlyPlayed': [],
  //     'deviceId': '',
  //     'playingDevice': null,
  //     'connectedDevices': [],
  //     'followers': [],
  //     'following': [],
  //     'isUserArtist': false,
  //   };
  //
  //   await FirebaseFirestore.instance.collection('user').add(userData);
  //   _userDetails = User(
  //     uid: userAuthResponse.user!.uid,
  //     userName: userName,
  //     password: password,
  //     dateOfBirth: dateOfBirth,
  //     gender: gender,
  //     email: email,
  //     phoneNumber: null,
  //     avatarUrl: null,
  //     isOptInForReceivingMarketingMessages:
  //         isOptInForReceivingMarketingMessages,
  //     isOptInForSharingPersonalDataForMarketingPurposes:
  //         isOptInForSharingPersonalDataForMarketingPurposes,
  //     hasPremiumAccount: false,
  //     premiumPlan: null,
  //     playlists: [],
  //     likedSongs: [],
  //     recentlyPlayed: [],
  //     deviceId: '',
  //     playingDevice: null,
  //     connectedDevices: [],
  //     followers: [],
  //     following: [],
  //     isUserArtist: false,
  //   );
  // }

  Future<void> logOutUser() async {
    await FirebaseAuth.instance.signOut();
  }
}
