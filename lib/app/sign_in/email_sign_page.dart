import 'package:flutter/material.dart';
import 'package:time_tracker_demo/app/sign_in/email_sign_in_form.dart';
import 'package:time_tracker_demo/app/services/auth.dart';

class EmailSignInPage extends StatelessWidget {
  EmailSignInPage({@required this.auth});
  final AuthBase auth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
        elevation: 5.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Card(
          child: EmailSignInForm(auth: auth),
        ),
      ),
      backgroundColor: Colors.grey,
    );
  }
}
