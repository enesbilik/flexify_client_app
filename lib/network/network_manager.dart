import 'package:dio/dio.dart';
import 'package:flexify_client_app/cache/cache_manager.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager get instance {
    if (_instance != null) return _instance!;
    _instance = NetworkManager._init();
    return _instance!;
  }

  final String _baseUrl = 'http://192.168.1.105:5118/api';
  final String _baseUrl2 = 'http://0.0.0.0:5118/api/';

  late final Dio dio;

  NetworkManager._init() {
    dio = Dio(
      BaseOptions(
          baseUrl: _baseUrl2, headers: {'Content-Type': 'application/json'}),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final apiKey = CacheManager().getApiKey();
          if (apiKey != "") {
            options.headers['Authorization'] = 'Bearer $apiKey';
          }
          return handler.next(options);
        },
      ),
    );
  }
}
