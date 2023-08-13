// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:be_natura/theme/be_natura_colors.dart';
import 'package:be_natura/widgets/components/text/be_natura_text.dart';
import 'package:flutter/material.dart';

class BottomBarColumn extends StatelessWidget {
  final String heading;
  final String s1;
  final String s2;
  final String s3;
  final s1Link;
  final s2Link;
  final s3Link;

  const BottomBarColumn({super.key,
    required this.heading,
    required this.s1,
    required this.s2,
    required this.s3,
    this.s1Link,
    this.s2Link,
    this.s3Link
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BeNaturaText(
            heading,
            style: TextStyle(
              color: BeNaturaColors.lightFont,
              fontSize: 18,
              fontWeight: FontWeight.w200,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: s1Link,
            child: BeNaturaText(
              s1,
              style: TextStyle(
                color: BeNaturaColors.lightFont,
                fontWeight: FontWeight.w200,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 5),
          GestureDetector(
            onTap: s2Link,
            child: BeNaturaText(
              s2,
              style: TextStyle(
                color: BeNaturaColors.lightFont,
                fontWeight: FontWeight.w200,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 5),
          GestureDetector(
            onTap: s3Link,
            child: BeNaturaText(
              s3,
              style: TextStyle(
                color: BeNaturaColors.lightFont,
                fontWeight: FontWeight.w200,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
