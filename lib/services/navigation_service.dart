import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName,
      {bool clearBackStack = false, args}) {
    if (clearBackStack) {
      return navigatorKey.currentState
          .pushNamedAndRemoveUntil(routeName, (route) => false);
    }
    return navigatorKey.currentState.pushNamed(routeName, arguments: args);
  }

  goBack() {
    if (navigatorKey.currentState.canPop()) {
      return navigatorKey.currentState.pop();
    }
  }
}
