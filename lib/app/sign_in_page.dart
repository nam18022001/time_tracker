import 'package:flutter/material.dart';
import 'package:time_tracker_demo/app/services/auth.dart';
import 'package:time_tracker_demo/common_widgets/custom_raised_button.dart';
import 'package:time_tracker_demo/common_widgets/social_sign_in_button.dart';

import 'email_sign_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({
    Key key,
    @required this.auth,
  }) : super(key: key);

  final AuthBase auth;

  Future<void> _signInAnonymous() async {
    try {
      await auth.signInAnonymously();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithFacebook() async {
    try {
      await auth.signInWithFacebook();
    } catch (e) {
      print(e.toString());
    }
  }

  void _signInWithEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => EmailSignInPage(auth: auth),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Tracker"),
        elevation: 5.0,
      ),
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
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
            onPressed: _signInWithGoogle,
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
            onPressed: _signInWithFacebook,
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
            onPressed: () => _signInWithEmail(context),
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
