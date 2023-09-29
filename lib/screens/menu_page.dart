// ignore_for_file: library_private_types_in_public_api

import 'package:be_natura/theme/be_natura_colors.dart';
import 'package:be_natura/theme/be_natura_resources.dart';
import 'package:be_natura/utils/screen_util.dart';
import 'package:be_natura/widgets/be_natura_bottom_bar.dart';
import 'package:be_natura/widgets/be_natura_drawer.dart';
import 'package:be_natura/widgets/components/text/be_natura_text.dart';
import 'package:be_natura/widgets/components/view/bn_default.dart';
import 'package:be_natura/widgets/be_natura_section.dart';
import 'package:flutter/material.dart';
import 'package:internet_file/internet_file.dart';
import 'package:pdfx/pdfx.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:be_natura/widgets/be_natura_app_bar.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  /// Scrollbar for appbar *
  final ScrollController _scrollController = ScrollController();

  /// PDF Controller *
  late PdfController _pdfController;
  late final _menuFile = InternetFile.get(BeNaturaResources.bnMenu);

  @override
  void initState() {
    _pdfController = PdfController(
      document: PdfDocument.openData(_menuFile),
    );
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
                          backgroundImage: BeNaturaResources.bnSandwich,
                          message: AppLocalizations.of(context)!.sectHomeMenu,
                          hashTagMessage:
                              AppLocalizations.of(context)!.htBeNatura,
                          textColor: BeNaturaColors.lightFont,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: ScreenUtil().getPaddingSize(context, 80),
                              top: ScreenUtil().getPaddingSize(context, 50),
                              bottom: ScreenUtil().getPaddingSize(context, 10)),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: BeNaturaText(
                                AppLocalizations.of(context)!.discoverMenu,
                                size: ScreenUtil().getFontSize(context, 40),
                                style: const TextStyle(
                                  color: BeNaturaColors.darkFont,
                                ),
                                align: TextAlign.left),
                          ),
                        ),
                        Center(
                          child: SizedBox(
                            height: ScreenUtil().getPDFSize(
                                context, MediaQuery.of(context).size.height),
                            child: FutureBuilder<PdfDocument>(
                              future: PdfDocument.openData(_menuFile),
                              builder: (context, snapshot) {
                                return (snapshot.connectionState ==
                                        ConnectionState.done)
                                    ? PdfView(
                                        controller: _pdfController,
                                        scrollDirection: Axis.vertical,
                                      )
                                    : const BNDefault();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const BeNaturaBottomBar(),
              ],
            )));
  }

  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }
}
