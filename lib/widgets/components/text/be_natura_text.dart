import 'package:flutter/material.dart';

class BeNaturaText extends StatelessWidget {
  final String text;
  final TextAlign? align;
  final double? size;
  final TextStyle style;

  BeNaturaText(
    this.text, {
    super.key,
    this.align,
    this.size,
    TextStyle style = const TextStyle(),
  }) : style = style.copyWith(
          fontFamily: 'PilcrowRounded',
          fontWeight: FontWeight.w700,
          fontSize: size,
        );

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: style,
      softWrap: true,
      maxLines: 10,
      overflow: TextOverflow.ellipsis,
    );
  }
}
