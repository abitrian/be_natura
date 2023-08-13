// ignore_for_file: library_private_types_in_public_api

import 'package:be_natura/utils/bn_navigator.dart';
import 'package:be_natura/utils/screen_util.dart';
import 'package:be_natura/widgets/be_natura_bottom_bar.dart';
import 'package:be_natura/widgets/components/text/be_natura_text.dart';
import 'package:be_natura/widgets/be_natura_drawer.dart';
import 'package:flutter/material.dart';
import 'package:be_natura/widgets/be_natura_section.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:be_natura/theme/be_natura_colors.dart';
import 'package:be_natura/theme/be_natura_resources.dart';
import 'package:be_natura/widgets/be_natura_app_bar.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  /// Scrollbar for appbar *
  final ScrollController _scrollController = ScrollController();

  late GoogleMapController mapController;

  final LatLng _center = const LatLng(37.98732649165334, -1.1284812420549881);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

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
                          backgroundImage: BeNaturaResources.bnOrderBowlGreen,
                          message: AppLocalizations.of(context)!.sectHomeOrder,
                          hashTagMessage:
                              AppLocalizations.of(context)!.htBeNatura,
                          textColor: BeNaturaColors.lightFont,
                          buttonLeft: AppLocalizations.of(context)!.buttonUber,
                          buttonLeftDestination: () {
                            BNNavigator()
                                .launchURL("https://www.ubereats.com/es");
                          },
                          buttonRight:
                              AppLocalizations.of(context)!.buttonGlovo,
                          buttonRightDestination: () {
                            BNNavigator().launchURL("https://glovoapp.com/");
                          },
                        ),
                        /*Padding(
                          padding: EdgeInsets.only(
                              left: ScreenUtil().getPaddingSize(context, 100),
                              top: ScreenUtil().getPaddingSize(context, 50)),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: BeNaturaText(
                                AppLocalizations.of(context)!.followUsInstagram,
                                size: ScreenUtil().getFontSize(context, 50),
                                style: const TextStyle(
                                  color: BeNaturaColors.darkFont,
                                ),
                                align: TextAlign.left),
                          ),
                        ),
                        BeNaturaInstagram(),
                        ElevatedButton(
                          style: BeNaturaStyles.buttonStyle,
                          onPressed: () async {
                            await BNNavigator().launchURL(BeNaturaResources.linkInstagram);
                          },
                          child: BeNaturaText(AppLocalizations.of(context)!.followUsInstagram
                              .toUpperCase()),
                        ),*/
                        const SizedBox(height: 40),
                        Padding(
                          padding: EdgeInsets.only(
                              left: ScreenUtil().getPaddingSize(context, 100),
                              top: ScreenUtil().getPaddingSize(context, 50),
                              bottom: ScreenUtil().getPaddingSize(context, 50)),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: BeNaturaText(
                                AppLocalizations.of(context)!.hereWeAre,
                                size: ScreenUtil().getFontSize(context, 50),
                                style: const TextStyle(
                                  color: BeNaturaColors.darkFont,
                                ),
                                align: TextAlign.left),
                          ),
                        ),
                        // Google maps
                        Container(
                          height: 500,
                          padding: const EdgeInsets.all(10.0),
                          child: GoogleMap(
                            onMapCreated: _onMapCreated,
                            zoomControlsEnabled: true,
                            initialCameraPosition: CameraPosition(
                              target: _center,
                              zoom: 16.0,
                            ),
                            markers: <Marker>{
                              Marker(
                                draggable: true,
                                markerId: const MarkerId("1"),
                                position: _center,
                                icon: BitmapDescriptor.defaultMarker,
                              )
                            },
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
}
