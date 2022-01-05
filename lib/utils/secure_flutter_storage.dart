import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureFlutterStorage {
  late FlutterSecureStorage flutterSecureStorage;

  SecureFlutterStorage() {
    flutterSecureStorage = const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
      iOptions: IOSOptions(
        accessibility: IOSAccessibility.first_unlock_this_device,
      ),
    );
  }

  Future<bool> containsKey({required String key}) async {
    try {
      return await flutterSecureStorage.containsKey(key: key);
    } catch (error) {
      print(error);
    }
    return false;
  }

  Future<void> delete({required String key}) async {
    try {
      return await flutterSecureStorage.delete(key: key);
    } catch (error) {
      print(error);
    }
  }

  Future<void> deleteAll() async {
    try {
      return await flutterSecureStorage.deleteAll();
    } catch (error) {
      print(error);
    }
  }

  Future<String?> read({required String key}) async {
    try {
      return await flutterSecureStorage.read(key: key);
    } catch (error) {
      print(error);
    }
    return null;
  }

  Future<Map<String, String>> readAll() async {
    try {
      return await flutterSecureStorage.readAll();
    } catch (error) {
      print(error);
    }
    return {};
  }

  Future<void> write({required String key, required String value}) async {
    try {
      return await flutterSecureStorage.write(key: key, value: value);
    } catch (error) {
      print(error);
    }
  }
}
