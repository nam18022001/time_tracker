import 'package:flutter/material.dart';

import 'custom_raised_button.dart';

class FormSubmitButton extends CustonRaisedButton {
  FormSubmitButton({
    @required String text,
    VoidCallback onPressed,
  }) : super(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.lightBlue,
              fontSize: 20.0,
            ),
          ),
          color: Colors.amberAccent,
          height: 44.0,
          borderRadius: 50.0,
          onPressed: onPressed,
        );
}
