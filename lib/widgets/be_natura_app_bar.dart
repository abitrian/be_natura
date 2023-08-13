// ignore_for_file: library_private_types_in_public_api

import 'package:be_natura/widgets/responsive.dart';
import 'package:be_natura/widgets/top_bar_contents.dart';
import 'package:flutter/material.dart';
import 'package:be_natura/screens/home_page.dart';
import 'package:be_natura/theme/be_natura_colors.dart';
import 'package:be_natura/theme/be_natura_resources.dart';

class BeNaturaAppBar extends StatefulWidget implements PreferredSizeWidget {
  final ScrollController scrollController;

  const BeNaturaAppBar({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  _BeNaturaAppBar createState() => _BeNaturaAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

class _BeNaturaAppBar extends State<BeNaturaAppBar> {
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = widget.scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return ResponsiveWidget.isSmallScreen(context)
        ? AppBar(
            backgroundColor: BeNaturaColors.primaryColor.withOpacity(_opacity),
            elevation: 0,
            toolbarHeight: 600,
            title: SizedBox(
              height: screenSize.height * 0.5,
              width: screenSize.width * 0.2,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                child: Image.asset(
                  BeNaturaResources.bnLogo,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          )
        : TopBarContents(_opacity);
  }
}
