import 'package:flutter/material.dart';
import 'package:ui/src/themes/fonts.dart';

class UIInputDecoration extends InputDecoration {
  const UIInputDecoration(
      {super.isDense = true,
      super.counterText = "",
      required super.labelText,
      super.alignLabelWithHint = true,
      super.border = const OutlineInputBorder(),
      super.focusedBorder,
      super.enabledBorder,
      super.labelStyle = const TextStyle(
          fontFamily: UIFonts.sfPro, fontSize: 14, color: Color(0xFF7B8794)),
      super.floatingLabelStyle = const TextStyle(
          fontFamily: UIFonts.sfPro,
          fontSize: 14,
          color: Color(0xFF7B8794),
          fontWeight: FontWeight.w500),
      super.contentPadding = const EdgeInsets.fromLTRB(11, 13, 11, 12),
      super.errorStyle = const TextStyle(
          fontFamily: UIFonts.sfPro,
          fontSize: 13,
          height: 1,
          fontWeight: FontWeight.w400),
      super.errorMaxLines = 2,
      super.prefixIcon,
      super.prefixIconConstraints,
      super.enabled,
      super.filled = false,
      super.fillColor = const Color(0xFFFAFAFA),
      super.floatingLabelBehavior = FloatingLabelBehavior.auto,
      super.hintMaxLines = 15,
      super.hintText,
      super.hintStyle = const TextStyle(
          fontFamily: UIFonts.sfPro, fontSize: 14, color: Color(0xFF7B8794)),
      super.suffixIcon,
      super.prefixText,
      super.suffixIconConstraints});
}
