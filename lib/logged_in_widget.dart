import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'authentification.dart';

class LoggedInWidget extends StatelessWidget {
  Future<void> signOut() async {
    await Authentification().signOut();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Container(
      alignment: Alignment.center,
      color: Colors.blueGrey.shade900,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 8),
          CircleAvatar(
            maxRadius: 50,
            backgroundImage: NetworkImage(user.photoURL),
          ),
          SizedBox(height: 8),
          Text(
            user.displayName,
            style: TextStyle(color: Colors.white, fontSize: 25.0),
          ),
          SizedBox(height: 8),
          Text(
            user.email,
            style: TextStyle(color: Colors.white, fontSize: 17.0),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: signOut,
            child: Text('SignOut'),
          )
        ],
      ),
    );
  }
}
