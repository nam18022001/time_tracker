import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:time_tracker_demo/app/services/auth.dart';
import 'package:time_tracker_demo/app/services/validation.dart';
import 'package:time_tracker_demo/common_widgets/form_submit_button.dart';

enum EmailSignInFormType { signIn, register }

class EmailSignInForm extends StatefulWidget with EmailAndPasswordValidator {
  EmailSignInForm({@required this.auth});

  final AuthBase auth;

  @override
  _EmailSignInFormState createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  //
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  //
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  EmailSignInFormType _formType = EmailSignInFormType.signIn;

  String get _email => _emailTextController.text;
  String get _password => _passwordTextController.text;

  bool submitted = false;
  bool isLoading = false;

  List<Widget> _buidlChildren() {
    final primaryText = _formType == EmailSignInFormType.signIn
        ? 'Sign In'
        : 'Create an account';
    final secondaryText = _formType == EmailSignInFormType.signIn
        ? "You don't have an account? Register"
        : 'Have an account? Sign in';

    bool submitEnable = widget.emailValidate.isValid(_email) &&
        widget.emailValidate.isValid(_password) &&
        !isLoading;
    return [
      _emailTextInput(),
      SizedBox(height: 8.0),
      _passwordTextInput(),
      SizedBox(height: 18.0),
      FormSubmitButton(
        text: primaryText,
        onPressed: submitEnable ? _submit : null,
      ),
      SizedBox(height: 8.0),
      FlatButton(
        onPressed: !isLoading ? _toggleFormType : null,
        child: Text(secondaryText),
      )
    ];
  }

  TextField _emailTextInput() {
    bool showErrorText = submitted && !widget.emailValidate.isValid(_email);

    return TextField(
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'You Email',
        errorText: showErrorText ? widget.invalidEmailErrorText : null,
        enabled: isLoading == false,
      ),
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      controller: _emailTextController,
      textInputAction: TextInputAction.next,
      focusNode: _emailFocusNode,
      onChanged: (email) => _updateState(),
      onEditingComplete: _emailEditingComplete,
    );
  }

  TextField _passwordTextInput() {
    bool showErrorText =
        submitted && !widget.passwordValidate.isValid(_password);
    return TextField(
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'You Password',
        errorText: showErrorText ? widget.invalidPasswordErrorText : null,
        enabled: isLoading == false,
      ),
      controller: _passwordTextController,
      obscureText: true,
      textInputAction: TextInputAction.done,
      focusNode: _passwordFocusNode,
      onChanged: (password) => _updateState(),
      onEditingComplete: _submit,
    );
  }

  void _updateState() {
    setState(() {});
  }

  void _emailEditingComplete() {
    final newwFocus = widget.emailValidate.isValid(_email)
        ? _passwordFocusNode
        : _emailFocusNode;
    FocusScope.of(context).requestFocus(newwFocus);
  }

  void _toggleFormType() {
    setState(() {
      submitted = false;
      _formType = _formType == EmailSignInFormType.signIn
          ? EmailSignInFormType.register
          : EmailSignInFormType.signIn;
    });
    _emailTextController.clear();
    _passwordTextController.clear();
  }

  void _submit() async {
    setState(() {
      submitted = true;
      isLoading = true;
    });
    try {
      await Future.delayed(Duration(seconds: 3));
      if (_formType == EmailSignInFormType.signIn) {
        await widget.auth.signInWithEmailAndPassword(_email, _password);
      } else {
        await widget.auth.regesterUserWithEmailAndPassword(_email, _password);
      }
      Navigator.of(context).pop();
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading = false;
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
