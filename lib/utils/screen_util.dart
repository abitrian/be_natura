import 'package:flutter/material.dart';

import '../widgets/responsive.dart';

class ScreenUtil {
  dynamic getFontSize(context, size) {
    if(ResponsiveWidget.isSmallScreen(context)) {
      return size / 1.5;
    }
    if(ResponsiveWidget.isMediumScreen(context)) {
      return size / 1.25;
    }
    if(ResponsiveWidget.isLargeScreen(context)) {
      return size;
    }
  }
  dynamic getWidgetSize(context, size) {
    if(ResponsiveWidget.isSmallScreen(context)) {
      return size / 1.5;
    }
    if(ResponsiveWidget.isMediumScreen(context)) {
      return size / 1.25;
    }
    if(ResponsiveWidget.isLargeScreen(context)) {
      return size;
    }
  }

  dynamic getPaddingSize(context, size) {
    if(ResponsiveWidget.isSmallScreen(context)) {
      return size / 3;
    }
    if(ResponsiveWidget.isMediumScreen(context)) {
      return size / 2;
    }
    if(ResponsiveWidget.isLargeScreen(context)) {
      return size;
    }
  }

  getCellSize(BuildContext context, int size) {
    if(ResponsiveWidget.isSmallScreen(context)) {
      return size / 1.5;
    }
    if(ResponsiveWidget.isMediumScreen(context)) {
      return size / 1.25;
    }
    if(ResponsiveWidget.isLargeScreen(context)) {
      return size;
    }
  }

  dynamic getGridviewColumnCount(context) {
    if(ResponsiveWidget.isSmallScreen(context)) {
      return 2;
    }
    if(ResponsiveWidget.isMediumScreen(context)) {
      return 3;
    }
    if(ResponsiveWidget.isLargeScreen(context)) {
      return 4;
    }
  }

  getPDFSize(BuildContext context, double size) {
    if(ResponsiveWidget.isSmallScreen(context)) {
      return size;
    }
    if(ResponsiveWidget.isMediumScreen(context)) {
      return size * 1.25;
    }
    if(ResponsiveWidget.isLargeScreen(context)) {
      return size * 1.5;
    }
  }


}