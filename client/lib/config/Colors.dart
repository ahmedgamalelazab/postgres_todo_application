import 'package:flutter/material.dart';

abstract class ApplicationColors {
  Color getPrimaryColor();
  Color getSecondartColor();
  Color getMainFontsColor();
  Color getBackGroundColor();
  Color getIconsColor();
}

class TodoColors extends ApplicationColors {
  @override
  Color getBackGroundColor() {
    return Color(0xffFAFAFA);
  }

  @override
  Color getMainFontsColor() {
    return Color(0xff2699FB);
  }

  @override
  Color getPrimaryColor() {
    return Color(0xff2699FB);
  }

  @override
  Color getSecondartColor() {
    return Color(0xffBCE0FD);
  }

  @override
  Color getIconsColor() {
    return Color(0xffFAFAFA);
  }
}
