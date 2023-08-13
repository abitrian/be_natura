// ignore_for_file: library_private_types_in_public_api

import 'package:be_natura/widgets/be_natura_bottom_bar.dart';
import 'package:be_natura/widgets/be_natura_drawer.dart';
import 'package:flutter/material.dart';
import 'package:be_natura/widgets/be_natura_section.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:be_natura/theme/be_natura_colors.dart';
import 'package:be_natura/theme/be_natura_resources.dart';
import 'package:be_natura/widgets/be_natura_app_bar.dart';

class WePage extends StatefulWidget {
  const WePage({super.key});

  @override
  _WePageState createState() => _WePageState();
}

class _WePageState extends State<WePage> {
  /// Scrollbar for appbar *
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: BeNaturaAppBar(scrollController: _scrollController),
        drawer: const BeNaturaDrawer(),
        body: SingleChildScrollView(
            controller: _scrollController,
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                Stack(
                  children: [
                    Column(
                      children: [
                        BeNaturaSection(
                          backgroundImage: BeNaturaResources.bnWeFamily,
                          message: AppLocalizations.of(context)!.sectWeIntro,
                          hashTagMessage:
                              AppLocalizations.of(context)!.htBeNatura,
                          textColor: BeNaturaColors.lightFont,
                        ),
                        BeNaturaSection(
                          backgroundImage: BeNaturaResources.bnWeFruitMix,
                          message: "",
                          opacity: 0.7,
                          description:
                              AppLocalizations.of(context)!.sectWeWelcome,
                          textColor: BeNaturaColors.lightFont,
                        ),
                      ],
                    ),
                  ],
                ),
                const BeNaturaBottomBar(),
              ],
            )));
  }
}
