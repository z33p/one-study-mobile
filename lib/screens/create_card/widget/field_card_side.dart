import 'package:flutter/material.dart';

class FieldCardSide extends StatelessWidget {
  const FieldCardSide({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.icon,
    this.autoFocus = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final IconData icon;
  final bool autoFocus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: TextFormField(
        minLines: 3,
        maxLines: 5,
        controller: controller,
        autofocus: autoFocus,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: Theme.of(context).primaryColor,
            ),
            labelText: labelText,
            alignLabelWithHint: true,
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 1.0),
            )),
      ),
    );
  }
}
