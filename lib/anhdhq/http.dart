import 'dart:core';

class Endpoint {
  static const apiScheme = 'http';
  static const apiHost = '10.0.2.2:8080';
  static const prefix = '/api';

  static Uri uri(String path) {
    final uri = new Uri(
      scheme: apiScheme,
      host: apiHost,
      path: '$prefix$path',
    );
    print('${uri.toString()}');
    return uri;
  }
}
