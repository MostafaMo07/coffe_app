import 'package:coffe_app/coffe_router.dart';
import 'package:coffe_app/screens/menu.dart';
import 'package:coffe_app/services/analytics.dart';
import 'package:coffe_app/services/auth.dart';
import 'package:coffe_app/widgets/button.dart';
import 'package:coffe_app/widgets/login_inputs.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    required this.scaffoldKey,
  });
  final scaffoldKey;
  static String routeName = 'loginScreen';
  static Route<RegisterScreen> route(registerScaffoldKey) {
    return MaterialPageRoute<RegisterScreen>(
      settings: RouteSettings(name: routeName),
      builder: (BuildContext context) => RegisterScreen(
        scaffoldKey: registerScaffoldKey,
      ),
    );
  }

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

  final _emailFieldController = TextEditingController();

  final _passwordFieldController = TextEditingController();

  final AuthService _authService = AuthService.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldKey,
      appBar: AppBar(
        title: Text("Register"),
        actions: [
          Image.asset(
            "assets/logo.png",
            semanticLabel: 'logo',
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LoginInputs(
                  emailFieldController: _emailFieldController,
                  passwordFieldController: _passwordFieldController,
                ),
                CommonButton(
                  onPressed: () {},
                  text: 'Register',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _isFormValidated() {
    final FormState form = formKey.currentState!;
    return form.validate();
  }

  _onSubmitLoginButton(context) async {
    if (_isFormValidated()) {
      widget.scaffoldKey.currentState.showSnackBar(_loadingSnackBar());

      final User? user = await _authService.createUserWithEmailAndPassword(
          email: _emailFieldController.text,
          password: _passwordFieldController.text);

      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      CoffeeRouter.instance.push(MenuScreen.route());
    }
  }

  Widget _loadingSnackBar() {
    return SnackBar(
      content: Row(
        children: <Widget>[
          CircularProgressIndicator(),
          SizedBox(
            width: 20,
          ),
          Text(" Creating User...")
        ],
      ),
    );
  }
}
