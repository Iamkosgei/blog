import '../ui/pages/pages.dart';
import 'package:flutter/material.dart';

import 'utils.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case splashPageRoute:
      return MaterialPageRoute(builder: (context) => SplashPage());
    case loginPageRoute:
      return MaterialPageRoute(builder: (context) => LoginPage());
    case blogsListPage:
      return MaterialPageRoute(builder: (context) => BlogListPage());
    case blogEntryPage:
      return MaterialPageRoute(
          builder: (context) => BlogEntryPage(
                id: settings.arguments,
              ));
    default:
      return MaterialPageRoute(builder: (context) => SplashPage());
  }
}
