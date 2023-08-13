import 'package:flutter/material.dart';

import 'be_natura_colors.dart';

class BeNaturaStyles {

  BeNaturaStyles._();

  static ButtonStyle buttonStyle = ButtonStyle(
    minimumSize: MaterialStateProperty.all(
      const Size(200, 60),
    ),
    backgroundColor: MaterialStateProperty.all(BeNaturaColors.primaryColor),
    textStyle: MaterialStateProperty.all(
        const TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
  );

}