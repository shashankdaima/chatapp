import 'dart:convert';
import 'dart:html';

import 'package:chatapp/db/entities.dart';
part 'queries.dart';
class StorageRepository {
  static final Storage _localStorage = window.localStorage;

  static Future<void> save(String key, String value) async {
    _localStorage[key] = value;
  }

  static Future<String?> get(String key) async {
    return _localStorage[key];
  }

  static Future<void> remove(String key) async {
    _localStorage.remove(key);
  }
}
