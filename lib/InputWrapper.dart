import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'authentification.dart';

class InputWrapper extends StatelessWidget {
  Future<void> signInWithGoogle() async {
    await Authentification().signInWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 80,
          ),
          SizedBox(
            width: 250.0,
            child: OutlineButton.icon(
                label: Text(
                  'Sign In With Google',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                shape: StadiumBorder(),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                highlightedBorderColor: Colors.white,
                borderSide: BorderSide(color: Colors.white),
                textColor: Colors.white,
                icon: FaIcon(FontAwesomeIcons.google, color: Colors.red),
                onPressed: signInWithGoogle),
          ),
        ],
      ),
    );
  }
}
