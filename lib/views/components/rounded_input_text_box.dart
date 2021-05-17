import 'package:firebaseapp/views/components/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        autofocus: false,
        cursorColor: Theme.of(context).colorScheme.primary,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.black26,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}