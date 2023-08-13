import 'package:be_natura/screens/home_page.dart';
import 'package:be_natura/screens/menu_page.dart';
import 'package:be_natura/screens/order_page.dart';
import 'package:be_natura/screens/we_page.dart';
import 'package:be_natura/theme/be_natura_colors.dart';
import 'package:be_natura/theme/be_natura_resources.dart';
import 'package:be_natura/utils/bn_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

import 'components/menu/item_menu.dart';

class TopBarContents extends StatefulWidget {
  final double opacity;

  const TopBarContents(this.opacity, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TopBarContentsState createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: Container(
        color: BeNaturaColors.primaryColor.withOpacity(widget.opacity),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: screenSize.height * 0.075,
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(
                    28), //const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ItemMenu(
                        AppLocalizations.of(context)!.orderOnline, const OrderPage()),
                    const SizedBox(width: 40),
                    ItemMenu(AppLocalizations.of(context)!.menu, const MenuPage()),
                    const SizedBox(width: 40),
                    ItemMenu(AppLocalizations.of(context)!.we, const WePage()),
                    const SizedBox(width: 40),
                    /*ItemMenu(AppLocalizations.of(context)!.contact,
                        OrderPage()),
                    const SizedBox(width: 40),*/
                    InkWell(
                      onTap: () async {
                        await BNNavigator()
                            .launchURL(BeNaturaResources.linkInstagram);
                      },
                      child: Image.asset(
                        BeNaturaResources.iconInstagram,
                        fit: BoxFit.cover,
                        height: 20,
                        width: 20,
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () async {
                        await BNNavigator()
                            .launchURL(BeNaturaResources.linkInstagram);
                      },
                      child: Image.asset(
                        BeNaturaResources.iconTikTok,
                        fit: BoxFit.cover,
                        height: 20,
                        width: 20,
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () async {
                        await BNNavigator()
                            .launchURL(BeNaturaResources.linkSpotify);
                      },
                      child: Image.asset(
                        BeNaturaResources.iconSpotify,
                        fit: BoxFit.cover,
                        height: 20,
                        width: 20,
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        final Uri emailLaunchUri = Uri(
                          scheme: 'mailto',
                          path: AppLocalizations.of(context)!.bnEmail,
                          queryParameters: {'subject': '', 'body': ""},
                        );
                        launchUrl(emailLaunchUri);
                      },
                      child: Image.asset(
                        BeNaturaResources.iconEmail,
                        fit: BoxFit.cover,
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
