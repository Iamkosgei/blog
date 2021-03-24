import 'package:blog/bloc/auth_bloc/auth_bloc.dart';
import 'package:blog/services/services.dart';
import 'package:blog/ui/widgets/widgets.dart';
import 'package:blog/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        } else if (state is AuthSuccess) {
          locator
              .get<NavigationService>()
              .navigateTo(blogsListPage, clearBackStack: true);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "LOGIN",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CommonTextField(
                      label: "Email",
                      onSaved: (value) {
                        _email = value;
                      },
                      validator: isEmailValid,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CommonTextField(
                      label: "Password",
                      obscureText: true,
                      onSaved: (value) {
                        _password = value;
                      },
                      validator: validPassword,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    state is AuthLoading
                        ? Center(child: CircularProgressIndicator())
                        : PrimaryButton(
                            txt: "LOGIN",
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                context
                                    .read<AuthBloc>()
                                    .add(LoginUser(_email, _password));
                              }
                            },
                          )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
