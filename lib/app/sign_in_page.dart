import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker_demo/common_widgets/custom_raised_button.dart';
import 'package:time_tracker_demo/common_widgets/social_sign_in_button.dart';

class SignInPage extends StatelessWidget {
  Future<void> _signInAnonymous() async {
    final userAnonymous = await FirebaseAuth.instance.signInAnonymously();
    print('${userAnonymous.user.uid}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Tracker"),
        elevation: 5.0,
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.black26,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Sign In",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 40, fontFamily: 'Times', fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20.0,
          ),
          SocialSignInButton(
            assetName: 'images/google-logo.png',
            text: 'Sign with Google',
            borderRadius: 50.0,
            color: Colors.white,
            textColor: Colors.black,
            onPressed: () {},
          ),
          SizedBox(
            height: 10.0,
          ),
          SocialSignInButton(
            assetName: 'images/facebook-logo.png',
            text: 'Sign in with FaceBook',
            borderRadius: 50.0,
            color: Color(0xFF334D92),
            textColor: Colors.white,
            onPressed: () {},
          ),
          SizedBox(
            height: 10.0,
          ),
          CustonRaisedButton(
            child: Text(
              'Sign in with Email and Password',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
                fontSize: 18.0,
              ),
            ),
            color: Colors.white,
            borderRadius: 50.0,
            onPressed: () {},
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'or',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10.0,
          ),
          CustonRaisedButton(
            child: Text(
              'Continue with anonymous',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.teal,
              ),
            ),
            color: Colors.white,
            borderRadius: 50.0,
            onPressed: _signInAnonymous,
          ),
        ],
      ),
    );
  }
}
