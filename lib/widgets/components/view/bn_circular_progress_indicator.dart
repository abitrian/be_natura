import 'package:be_natura/theme/be_natura_colors.dart';
import 'package:flutter/material.dart';

class BNCircularProgressIndicator {

  static CircularProgressIndicator circularProgress() {
    return const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(BeNaturaColors.primaryColor),
    );
  }

}