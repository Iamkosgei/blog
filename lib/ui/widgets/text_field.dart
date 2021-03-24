import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final Function(String) validator, onSaved;

  const CommonTextField(
      {Key key,
      @required this.label,
      this.obscureText = false,
      @required this.validator,
      @required this.onSaved})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(.1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        validator: validator,
        obscureText: obscureText,
        onSaved: onSaved,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: "$label",
        ),
      ),
    );
  }
}
