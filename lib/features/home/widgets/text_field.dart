import 'package:employee/themes/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@immutable
class LoginField extends StatefulWidget {
  final String hintText;
  final bool obscureText;
  final double boxHeight;
  final Function(String)? onChanged;
  final bool? background;
  final bool? field;
  final TextEditingController controller;

  LoginField({
    Key? key,
    required this.hintText,
    this.boxHeight = 50.0,
    this.obscureText = false,
    required this.controller,
    this.field = false,
    this.background = false,
    this.onChanged,
  }) : super(key: key);

  @override
  _LoginFieldState createState() => _LoginFieldState();
}

class _LoginFieldState extends State<LoginField> {
  bool _isEmpty = true;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    // double screenWidth = MediaQuery.of(context).size.width;
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: widget.controller,
      inputFormatters: [NoSpaceFormatter()],
      style: widget.background!
          ? TextStyle(color: Colors.white)
          : TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 16.0,
        ),
        filled: true,
        fillColor:
            widget.background! ? AppPallete.gradient4 : Colors.transparent,
        contentPadding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1.0),
          borderSide: const BorderSide(
            color: Colors.black87, // Border color
            width: 0.1, // Border width
          ),
        ),
        labelStyle: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
      ),
      validator: (value) {
        final trimmedValue = value!.trim(); // Trim leading and trailing spaces
        setState(() {
          _isEmpty = trimmedValue.isEmpty;
        });
        if (trimmedValue.isEmpty) {
          return '${widget.hintText} is required';
        } else {
          return null;
        }
      },
      onChanged: widget.onChanged,
      obscureText: widget.obscureText,
    );
  }
}

class NoSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove any spaces from the new value
    final newText = newValue.text.replaceAll(' ', '');
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
