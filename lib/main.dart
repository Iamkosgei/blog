import 'package:blog/repositories/repos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bloc/auth_bloc/auth_bloc.dart';
import 'services/navigation_service.dart';
import 'utils/utils.dart';

void main() {
  //set up locator
  setupLocator();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AuthBloc(authRepo: locator.get<AuthRepo>()))
      ],
      child: MaterialApp(
        title: 'Blog',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          textTheme: GoogleFonts.nunitoTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        initialRoute: splashPageRoute,
        onGenerateRoute: generateRoute,
        navigatorKey: locator.get<NavigationService>().navigatorKey,
      ),
    );
  }
}
