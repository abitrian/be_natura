import 'package:be_natura/screens/home_page.dart';
import 'package:be_natura/screens/menu_page.dart';
import 'package:be_natura/screens/order_page.dart';
import 'package:be_natura/screens/we_page.dart';
import 'package:be_natura/theme/be_natura_colors.dart';
import 'package:be_natura/theme/be_natura_resources.dart';
import 'package:be_natura/utils/bn_analytics.dart';
import 'package:be_natura/utils/bn_navigator.dart';
import 'package:be_natura/widgets/bottom_bar_column.dart';
import 'package:be_natura/widgets/components/text/be_natura_text.dart';
import 'package:be_natura/widgets/responsive.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BeNaturaBottomBar extends StatelessWidget {
  const BeNaturaBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      color: BeNaturaColors.primaryDarkColor,
      child: ResponsiveWidget.isSmallScreen(context)
          ? Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomBarColumn(
                      heading: AppLocalizations.of(context)!.appName,
                      s1: AppLocalizations.of(context)!.orderOnline,
                      s1Link: () {
                        // Log User interaction
                        FirebaseAnalytics.instance
                            .logEvent(name: BNAnalytics.bottomOrderPress);

                        // Navigate to Order Screen
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const OrderPage(),
                          ),
                        );
                      },
                      s2: AppLocalizations.of(context)!.menu,
                      s2Link: () {
                        // Log User interaction
                        FirebaseAnalytics.instance
                            .logEvent(name: BNAnalytics.bottomMenuPress);

                        // Navigate to Menu Screen
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const MenuPage(),
                          ),
                        );
                      },
                      s3: AppLocalizations.of(context)!.we,
                      s3Link: () {
                        // Log User interaction
                        FirebaseAnalytics.instance
                            .logEvent(name: BNAnalytics.bottomWePress);

                        // Navigate to We Screen
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const WePage(),
                          ),
                        );
                      },
                    ),
                    BottomBarColumn(
                      heading: AppLocalizations.of(context)!.social,
                      s1: AppLocalizations.of(context)!.socialSpotify,
                      s1Link: () async {
                        await BNNavigator()
                            .launchURL(BeNaturaResources.linkSpotify);
                      },
                      s2: AppLocalizations.of(context)!.socialInstagram,
                      s2Link: () async {
                        await BNNavigator()
                            .launchURL(BeNaturaResources.linkInstagram);
                      },
                      s3: AppLocalizations.of(context)!.socialTikTok,
                    ),
                  ],
                ),
                const Divider(
                  color: BeNaturaColors.secondaryColor,
                ),
                const SizedBox(height: 20),
                BeNaturaText(AppLocalizations.of(context)!.bnEmail,
                    style: TextStyle(
                      color: BeNaturaColors.lightFont,
                    )),
                const SizedBox(height: 5),
                BeNaturaText(AppLocalizations.of(context)!.bnLocation,
                    style: TextStyle(
                      color: BeNaturaColors.lightFont,
                    )),
                const SizedBox(height: 20),
                const Divider(
                  color: Colors.blueGrey,
                ),
                const SizedBox(height: 20),
                Text(
                  AppLocalizations.of(context)!.copyright,
                  style: TextStyle(
                    color: Colors.blueGrey.shade300,
                    fontSize: 14,
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          },
                          child: Image.asset(
                            BeNaturaResources.bnIcon,
                            fit: BoxFit.fill,
                            height: 120,
                          ),
                        ),
                      ],
                    ),
                    BottomBarColumn(
                      heading: AppLocalizations.of(context)!.appName,
                      s1: AppLocalizations.of(context)!.orderOnline,
                      s1Link: () {
                        // Log User interaction
                        FirebaseAnalytics.instance
                            .logEvent(name: BNAnalytics.bottomOrderPress);

                        // Navigate to Order Screen
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const OrderPage(),
                          ),
                        );
                      },
                      s2: AppLocalizations.of(context)!.menu,
                      s2Link: () {
                        // Log User interaction
                        FirebaseAnalytics.instance
                            .logEvent(name: BNAnalytics.bottomMenuPress);

                        // Navigate to Menu Screen
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const MenuPage(),
                          ),
                        );
                      },
                      s3: AppLocalizations.of(context)!.we,
                      s3Link: () {
                        // Log User interaction
                        FirebaseAnalytics.instance
                            .logEvent(name: BNAnalytics.bottomWePress);

                        // Navigate to We Screen
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const WePage(),
                          ),
                        );
                      },
                    ),
                    BottomBarColumn(
                      heading: AppLocalizations.of(context)!.social,
                      s1: AppLocalizations.of(context)!.socialSpotify,
                      s1Link: () async {
                        await BNNavigator()
                            .launchURL(BeNaturaResources.linkSpotify);
                      },
                      s2: AppLocalizations.of(context)!.socialInstagram,
                      s2Link: () async {
                        await BNNavigator()
                            .launchURL(BeNaturaResources.linkInstagram);
                      },
                      s3: AppLocalizations.of(context)!.socialTikTok,
                    ),
                    Container(
                      color: Colors.blueGrey,
                      width: 2,
                      height: 150,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BeNaturaText(
                          AppLocalizations.of(context)!.bnEmail,
                          style: TextStyle(
                            color: BeNaturaColors.lightFont,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        BeNaturaText(
                          AppLocalizations.of(context)!.bnLocation,
                          style: TextStyle(
                            color: BeNaturaColors.lightFont,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.blueGrey,
                ),
                const SizedBox(height: 20),
                Text(
                  AppLocalizations.of(context)!.copyright,
                  style: TextStyle(
                    color: Colors.blueGrey.shade300,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
    );
  }
}
