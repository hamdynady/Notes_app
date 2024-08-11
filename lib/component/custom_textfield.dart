import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  /// Creates a custom text field with various customization options.
  ///
  /// [labelText] is to display the label.
  /// [onChanged] is an optional callback triggered when the text changes.
  /// [obscureText] controls whether the text is obscured, default is false.
  /// [suffixIcon] is an optional widget displayed at the end of the text field.
  /// [maxLines] sets the maximum number of lines for the text field, default is 1.
  /// [onSaved] is an optional callback for saving the input value.
  const CustomTextField({
    super.key,
    this.labelText,
    this.onChanged,
    this.obscureText = false,
    this.suffixIcon,
    this.maxLines = 1,
    this.onSaved,
    this.hint,
  });

  /// Determines if the text field obscures the text.
  final bool obscureText;

  /// The label text displayed above the text field.
  final String? labelText;

  final String? hint;

  /// Callback when the text changes.
  final Function(String)? onChanged;

  /// Callback to save the input value.
  final void Function(String?)? onSaved;

  /// Widget displayed at the end of the text field.
  final Widget? suffixIcon;

  /// Maximum number of lines for the text field.
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      validator: (value) {
        // Validates that the input is not empty.
        return value?.isEmpty ?? true ? "Field is required" : null;
      },
      obscureText: obscureText,
      onChanged: onChanged,
      onSaved: onSaved,
      style: const TextStyle(color: Colors.cyan),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(fontSize: 18, color: Colors.cyan),
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 18, color: Colors.cyan),
        enabledBorder: _buildBorder(Colors.white),
        focusedBorder: _buildBorder(Colors.cyan),
        errorBorder: _buildBorder(Colors.red),
        focusedErrorBorder: _buildBorder(Colors.red),
        suffixIcon: suffixIcon,
      ),
      cursorColor: Colors.cyan,
    );
  }

  /// Builds the border style for the text field.
  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.circular(8),
    );
  }
}
