import 'package:flutter/material.dart';

class loadingSnackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Row(
        children: <Widget>[
          CircularProgressIndicator(),
          SizedBox(
            width: 20,
          ),
          Text(" Signing-In...")
        ],
      ),
    );
  }
}
