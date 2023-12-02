import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStroage {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  storeData({required String key, required String value}) async {
    await storage.write(key: key, value: value);
  }

  readData({required String key}) async {
    return await storage.read(key: key) ?? 'No data found!';
  }

  deleteData({required String key}) async {
    return await storage.delete(key: key);
  }
}
