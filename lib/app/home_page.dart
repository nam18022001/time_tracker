import 'package:flutter/material.dart';
import 'package:time_tracker_demo/app/services/auth.dart';

class HomePage extends StatelessWidget {
  //
  const HomePage({
    Key key,
    @required this.auth,
  }) : super(key: key);

  final AuthBase auth;

  //
  Future<void> _signOut() async {
    await auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Text("ok"),
        title: Text('Home Page'),
        actions: [
          FlatButton(
            onPressed: _signOut,
            child: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: 'Times',
              ),
            ),
          )
        ],
      ),
    );
  }
}
