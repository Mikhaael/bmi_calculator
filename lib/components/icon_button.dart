import 'package:flutter/material.dart';


roundedIconButton({
  required IconData icon,
  required VoidCallback onPressed
}) =>
RawMaterialButton(
      onPressed: onPressed,
      elevation: 6.0,
      constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      fillColor: const Color(0xFF4C4F5E),
      child: Icon(icon),
    );