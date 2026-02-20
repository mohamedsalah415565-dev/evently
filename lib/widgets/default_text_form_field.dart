import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultTextFormField extends StatelessWidget {
  const DefaultTextFormField({
    super.key,
    required this.hintText,
    this.controller,
    this.onChanged,
    this.validator,
    this.prefixIconImageName,
    this.suffixIconImageName,
  });

  final String hintText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? prefixIconImageName;
  final String? suffixIconImageName;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIconImageName == null
            ? null
            : SvgPicture.asset('assets/icons/$prefixIconImageName.svg'),
        suffixIcon: Padding(
          padding: EdgeInsets.all(12),
          child: suffixIconImageName == null
              ? null
              : SvgPicture.asset('assets/icons/$suffixIconImageName.svg'),
        ),
      ),
    );
  }
}
