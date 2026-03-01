import 'package:evently_app/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultTextFormField extends StatefulWidget {
  const DefaultTextFormField({
    super.key,
    required this.hintText,
    this.controller,
    this.onChanged,
    this.validator,
    this.prefixIconImageName,
    this.suffixIconImageName,
    this.isPassword = false,
    this.maxLines = 1,
  });

  final String hintText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? prefixIconImageName;
  final String? suffixIconImageName;
  final bool isPassword;
  final int maxLines;

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  late bool isobscure = widget.isPassword;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      validator: widget.validator,
      obscureText: widget.isPassword && isobscure,
      autovalidateMode: .onUserInteraction,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: widget.prefixIconImageName == null
            ? null
            : Padding(
                padding: EdgeInsets.all(12),
                child: SvgPicture.asset(
                  'assets/icons/${widget.prefixIconImageName}.svg',
                ),
              ),
        suffixIcon: Padding(
          padding: EdgeInsets.all(12),
          child: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    isobscure = !isobscure;
                    setState(() {});
                  },
                  icon: Icon(
                    isobscure
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: AppTheme.lightgray,
                  ),
                )
              : widget.suffixIconImageName == null
              ? null
              : Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset(
                    'assets/icons/${widget.suffixIconImageName}.svg',
                  ),
                ),
        ),
      ),
    );
  }
}
