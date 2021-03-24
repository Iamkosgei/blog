import 'package:blog/bloc/startup_bloc/startup_bloc.dart';
import 'package:blog/services/services.dart';
import 'package:blog/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => StartupBloc()..add(CheckAuthState()),
        child: BlocConsumer<StartupBloc, StartupState>(
          listener: (context, state) {
            if (state is UserAlreadySignedIn) {
              if (state.userSignedIn) {
                locator
                    .get<NavigationService>()
                    .navigateTo(blogsListPage, clearBackStack: true);
              } else {
                locator
                    .get<NavigationService>()
                    .navigateTo(loginPageRoute, clearBackStack: true);
              }
            }
          },
          builder: (context, state) {
            return Scaffold(
              body: Container(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.5),
                    image: DecorationImage(
                      image: AssetImage("assets/blog_bg.jpeg"),
                      fit: BoxFit.cover,
                    )),
                child: Center(
                    child: Text(
                  "Blog",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                )),
              ),
            );
          },
        ));
  }
}
