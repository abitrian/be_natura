// ignore_for_file: prefer_typing_uninitialized_variables, library_private_types_in_public_api

import 'package:be_natura/theme/be_natura_resources.dart';
import 'package:be_natura/theme/be_natura_styles.dart';
import 'package:be_natura/widgets/components/text/be_natura_text.dart';
import 'package:flutter/material.dart';

import '../theme/be_natura_colors.dart';
import '../utils/screen_util.dart';

class BeNaturaSection extends StatefulWidget {
  final backgroundImage;
  final sectionImage;
  final message;
  final description;
  final hashTagMessage;
  final buttonLeft;
  final buttonLeftDestination;
  final buttonRight;
  final buttonRightDestination;
  final textColor;
  final opacity;


  const BeNaturaSection(
      {super.key,
      this.backgroundImage = BeNaturaResources.bnLogo,
      this.sectionImage,
      this.message = "",
      this.description = "",
      this.hashTagMessage = "",
      this.buttonLeft,
      this.buttonLeftDestination,
      this.buttonRight,
      this.buttonRightDestination,
      this.textColor ,
      this.opacity = 0.4
      });

  @override
  _Section createState() => _Section();
}

class _Section extends State<BeNaturaSection> {
  @override
  Widget build(BuildContext context) {

    return DecoratedBox(
        decoration: widget.backgroundImage != null
            ? BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        BeNaturaColors.darkFont
                            .withOpacity(widget.opacity ?? 0.4),
                        BlendMode.darken),
                    image: AssetImage(widget.backgroundImage),
                    fit: BoxFit.cover),
              )
            : BoxDecoration(color: Colors.grey.shade50),
        child: Container(
          constraints: BoxConstraints(
              minHeight: 100,
              minWidth: double.infinity,
              maxHeight: ScreenUtil()
                  .getWidgetSize(context, MediaQuery.of(context).size.height)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: ScreenUtil().getPaddingSize(context, 100),
                          right: ScreenUtil().getPaddingSize(
                              context, MediaQuery.of(context).size.width / 2),
                          top: ScreenUtil().getPaddingSize(context, 10)),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: BeNaturaText(widget.hashTagMessage,
                              style: TextStyle(
                                color: widget.textColor,
                              ),
                              size: ScreenUtil().getFontSize(context, 20),
                              align: TextAlign.left)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: ScreenUtil().getPaddingSize(
                              context, MediaQuery.of(context).size.width / 2),
                          left: ScreenUtil().getPaddingSize(context, 100),
                          top: ScreenUtil().getPaddingSize(context, 10)),
                      child: BeNaturaText(widget.message,
                          style: TextStyle(
                            color: widget.textColor,
                          ),
                          size: ScreenUtil().getFontSize(context, 50),
                          align: TextAlign.left),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: ScreenUtil().getPaddingSize(
                              context, MediaQuery.of(context).size.width / 2),
                          left: ScreenUtil().getPaddingSize(context, 100),
                          top: ScreenUtil().getPaddingSize(context, 10)),
                      child: BeNaturaText(widget.description,
                            style: TextStyle(
                              color: widget.textColor,
                            ),
                            size: ScreenUtil().getFontSize(context, 30),
                            align: TextAlign.left),
                      ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: ScreenUtil().getPaddingSize(context, 100),
                          top: ScreenUtil().getPaddingSize(context, 30)),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: FittedBox(
                            child: Row(
                          children: [
                            const SizedBox(height: 10),
                            Visibility(
                              visible: widget.buttonLeft != null,
                              child: ElevatedButton(
                                style: BeNaturaStyles.buttonStyle,
                                onPressed: widget.buttonLeftDestination,
                                child: BeNaturaText(widget.buttonLeft
                                    .toString()
                                    .toUpperCase()),
                              ),
                            ),
                            const SizedBox(width: 40),
                            Visibility(
                              visible: widget.buttonRight != null,
                              child: ElevatedButton(
                                style: BeNaturaStyles.buttonStyle,
                                onPressed: widget.buttonRightDestination,
                                child: BeNaturaText(widget.buttonRight
                                    .toString()
                                    .toUpperCase()),
                              ),
                            ),
                          ],
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
