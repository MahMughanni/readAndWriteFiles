import 'package:flutter/material.dart';

class CheetahInput extends StatelessWidget {
  final String labelText;
  final Function(String?)? onSaved;

  const CheetahInput({
    super.key,

    required this.labelText,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      initialValue: '',
      validator: (value) {
        return value == null ? '$labelText is required' : null;
      },
      onSaved: onSaved,
    );
  }
}
