import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  final _userDocQueryManager = FutureRequestManager<UsersRecord>();
  Future<UsersRecord> userDocQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<UsersRecord> Function() requestFn,
  }) =>
      _userDocQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserDocQueryCache() => _userDocQueryManager.clear();
  void clearUserDocQueryCacheKey(String? uniqueKey) =>
      _userDocQueryManager.clearRequest(uniqueKey);

  final _upCommingEventsManager = StreamRequestManager<List<EventRecord>>();
  Stream<List<EventRecord>> upCommingEvents({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<EventRecord>> Function() requestFn,
  }) =>
      _upCommingEventsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUpCommingEventsCache() => _upCommingEventsManager.clear();
  void clearUpCommingEventsCacheKey(String? uniqueKey) =>
      _upCommingEventsManager.clearRequest(uniqueKey);

  final _pastWorkManager = StreamRequestManager<List<EventRecord>>();
  Stream<List<EventRecord>> pastWork({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<EventRecord>> Function() requestFn,
  }) =>
      _pastWorkManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPastWorkCache() => _pastWorkManager.clear();
  void clearPastWorkCacheKey(String? uniqueKey) =>
      _pastWorkManager.clearRequest(uniqueKey);

  final _chatsManager = StreamRequestManager<List<ChatsRecord>>();
  Stream<List<ChatsRecord>> chats({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ChatsRecord>> Function() requestFn,
  }) =>
      _chatsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearChatsCache() => _chatsManager.clear();
  void clearChatsCacheKey(String? uniqueKey) =>
      _chatsManager.clearRequest(uniqueKey);
}
