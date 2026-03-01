import 'package:flutter/material.dart';

class DefaultElevetedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const DefaultElevetedButton({
    super.key,
    required this.label,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.sizeOf(context).width, 48),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
