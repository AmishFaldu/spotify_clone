import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final Map<String, dynamic> tempData = {};

  Future<bool> checkIfEmailExists(String email) async {
    try {
      final user =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      if (user.isNotEmpty) {
        return true;
      }
      return false;
    } catch (error) {
      print(error);
    }
    // TODO : need to show error dialog for this
    return true;
  }

  Future<bool> checkIfEmailIsValid(String email) async {
    try {
      await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
    } on FirebaseAuthException catch (error) {
      if (error.code == 'invalid-email') {
        return false;
      }
    } catch (error) {
      // TODO : need to show error dialog for this
      return false;
    }
    return true;
  }

  Future<void> signUpUserWithEmailAndPassword({
    required String email,
    required String password,
    required String userName,
    required String dateOfBirth,
    required String gender,
    required bool isOptInForReceivingMarketingMessages,
    required bool isOptInForSharingPersonalDataForMarketingPurposes,
  }) async {
    final firebaseAuthUser =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final userId = firebaseAuthUser.user?.uid ?? '';

    final userData = {
      'uid': userId,
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
    await FirebaseFirestore.instance.collection('users').add(userData);

    // TODO - also need to add device id
    _userDetails = SpotifyUser(
      uid: userId,
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

  Future<bool> checkIfPhoneNumberExists(String phoneNumber) async {
    try {
      final user = await FirebaseFirestore.instance
          .collection("users")
          .where('phoneNumber', isEqualTo: phoneNumber)
          .get();
      if (user.size > 0) {
        return true;
      }
      return false;
    } catch (error) {
      // TODO : need to show error dialog for this
      print(error);
    }
    return true;
  }

  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required void Function(String, int?) codeSentFunction,
  }) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (_creds) {
          print(_creds);
        },
        verificationFailed: (exception) {
          print(exception);
        },
        codeSent: codeSentFunction,
        codeAutoRetrievalTimeout: (verificationId) {
          print(verificationId);
        },
      );
    } on FirebaseAuthException catch (error) {
      if (error.code == 'too-many-requests') {}
    } catch (error) {
      // TODO : need to show error dialog for this
      print(error);
    }
  }

  Future<void> verifySmsVerificationCode({
    required String verificationId,
    required String smsCode,
  }) async {
    final creds = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    await FirebaseAuth.instance.signInWithCredential(creds);
  }

  Future<void> signUpUserWithPhoneNumber({
    required String phoneNumber,
    required String userName,
    required String dateOfBirth,
    required String gender,
    required bool isOptInForReceivingMarketingMessages,
    required bool isOptInForSharingPersonalDataForMarketingPurposes,
  }) async {
    try {
      // TODO - need to add read deviceid
      final userId = FirebaseAuth.instance.currentUser?.uid ?? '';
      final userData = {
        'uid': userId,
        'userName': userName,
        'password': null,
        'dateOfBirth': dateOfBirth,
        'gender': gender,
        'email': null,
        'phoneNumber': phoneNumber,
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
      await FirebaseFirestore.instance.collection('users').add(userData);
      _userDetails = SpotifyUser(
        uid: userId,
        userName: userName,
        password: null,
        dateOfBirth: dateOfBirth,
        gender: gender,
        email: null,
        phoneNumber: phoneNumber,
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
    } catch (error) {
      // TODO : need to show error dialog for this
      print(error);
    }
  }

  void postSignupCleanUp() {
    tempData.clear();
  }

  Future<void> logOutUser() async {
    await FirebaseAuth.instance.signOut();
  }
}
