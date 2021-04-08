import 'package:flutter/material.dart';
import 'package:resu_mo/anhdhq/app.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    print(args);
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MyStatefulWidget());
      case 'enter-name':
        if (args is String) {
          return MaterialPageRoute(builder: (_) => EnterNamePage(name: args));
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: Text('ERROR')),
        body: Center(child: Text('ERROR')),
      );
    });
  }
}
