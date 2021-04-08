import 'package:flutter/material.dart';
import 'package:time_tracker_demo/common_widgets/custom_raised_button.dart';

class SignInPage extends StatelessWidget {
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
      // color: Colors.grey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Sign In",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 36, fontFamily: 'Times', fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8.0,
          ),
          CustonRaisedButton(
            child: Text(
              'Sign with Google',
              style: TextStyle(
                color: Colors.red,
                fontSize: 18,
              ),
            ),
            color: Colors.white,
            borderRadius: 50,
            onPressed: () {},
          ),
          SizedBox(
            height: 8.0,
          ),
          CustonRaisedButton(
            child: Text(
              'Sign in with FaceBook',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
              ),
            ),
            color: Colors.blue.shade100,
            borderRadius: 50.0,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
