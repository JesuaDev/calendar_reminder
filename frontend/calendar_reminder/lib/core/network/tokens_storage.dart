import 'package:flutter/rendering.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokensStorage {
  final _secureStorage = FlutterSecureStorage();

  Future<String?> get accesToken => _secureStorage.read(key: 'access_token');
  Future<String?> get refreshAccesToken =>
      _secureStorage.read(key: 'refresh_access_token');

  Future<void> saveTokens(String token, String refreshToken) async {
    await _secureStorage.write(key: 'access_token', value: token);
    await _secureStorage.write(
      key: 'refresh_access_token',
      value: refreshToken,
    );

    debugPrint(token);
  }

  Future<void> deleteTokens() => _secureStorage.deleteAll();
}
