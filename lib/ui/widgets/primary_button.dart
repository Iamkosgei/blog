import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String txt;
  final Function onPressed;

  const PrimaryButton({Key key, @required this.txt, @required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.green,
          onSurface: Colors.grey,
        ),
        child: Text('$txt'),
        onPressed: onPressed,
      ),
    );
  }
}
