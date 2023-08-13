import 'package:be_natura/theme/be_natura_colors.dart';
import 'package:be_natura/theme/be_natura_resources.dart';
import 'package:be_natura/utils/screen_util.dart';
import 'package:flutter/material.dart';

class BNDefault extends StatelessWidget {
  const BNDefault({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  BeNaturaColors.darkFont.withOpacity(0.2),
                  BlendMode.darken),
              image: const AssetImage(
                  BeNaturaResources.bnBackground),
              fit: BoxFit.cover),
        ),
        child: Container(
            constraints: BoxConstraints(
                minHeight: 100,
                minWidth: double.infinity,
                maxHeight: ScreenUtil().getWidgetSize(
                    context,
                    MediaQuery.of(context).size.height))));
  }
}