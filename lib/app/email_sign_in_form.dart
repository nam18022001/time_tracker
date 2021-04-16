import 'package:flutter/material.dart';
import 'package:time_tracker_demo/app/services/auth.dart';
import 'package:time_tracker_demo/common_widgets/form_submit_button.dart';

enum EmailSignInFormType { signIn, register }

class EmailSignInForm extends StatefulWidget {
  EmailSignInForm({@required this.auth});

  final AuthBase auth;

  @override
  _EmailSignInFormState createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  //
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  EmailSignInFormType _formType = EmailSignInFormType.signIn;

  List<Widget> _buidlChildren() {
    final primaryText = _formType == EmailSignInFormType.signIn
        ? 'Sign In'
        : 'Create an account';
    final secondaryText = _formType == EmailSignInFormType.signIn
        ? "You don't have an account? Register"
        : 'Have an account? Sign in';
    return [
      TextField(
        decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'You Email',
        ),
        controller: _emailTextController,
      ),
      SizedBox(height: 8.0),
      TextField(
        decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'You Password',
        ),
        controller: _passwordTextController,
        obscureText: true,
      ),
      SizedBox(height: 18.0),
      FormSubmitButton(
        text: primaryText,
        onPressed: _submit,
      ),
      SizedBox(height: 8.0),
      FlatButton(
        onPressed: _toggleFormType,
        child: Text(secondaryText),
      )
    ];
  }

  void _toggleFormType() {
    setState(() {
      _formType = _formType == EmailSignInFormType.signIn
          ? EmailSignInFormType.register
          : EmailSignInFormType.signIn;
    });
    _emailTextController.clear();
    _passwordTextController.clear();
  }

  void _submit() async {
    try {
      if (_formType == EmailSignInFormType.signIn) {
        await widget.auth.signInWithEmailAndPassword(
            _emailTextController.text, _passwordTextController.text);
      } else {
        await widget.auth.regesterUserWithEmailAndPassword(
            _emailTextController.text, _passwordTextController.text);
      }
      Navigator.of(context).pop();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(36.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: _buidlChildren(),
      ),
    );
  }
}
