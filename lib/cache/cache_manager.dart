import 'package:get_storage/get_storage.dart';

class CacheManager {
  static final CacheManager _singleton = CacheManager._internal();
  final _getStorage = GetStorage();

  factory CacheManager() => _singleton;

  CacheManager._internal();

  void clearAllStorage() {
    _getStorage.erase();
  }

  String? readStringValue(CacheKeys key) => _getStorage.read(key.toString());

  void writeStringValue(CacheKeys key, String? value) {
    _getStorage.write(key.toString(), value);
  }

  bool readBoolValue(CacheKeys key) =>
      _getStorage.read(key.toString()) ?? false;

  void writeBoolValue(CacheKeys key, bool value) {
    _getStorage.write(key.toString(), value);
  }

  String getApiKey() {
    return readStringValue(CacheKeys.token) ?? '';
  }

  void setApiKey(String token) {
    writeStringValue(CacheKeys.token, token);
  }
}

enum CacheKeys {
  token,
}
