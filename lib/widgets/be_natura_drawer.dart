import 'package:be_natura/screens/home_page.dart';
import 'package:be_natura/screens/menu_page.dart';
import 'package:be_natura/screens/order_page.dart';
import 'package:be_natura/screens/we_page.dart';
import 'package:be_natura/widgets/components/text/be_natura_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:be_natura/theme/be_natura_colors.dart';

class BeNaturaDrawer extends StatelessWidget {
  const BeNaturaDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: BeNaturaColors.primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {},
                child: BeNaturaText("",
                    align: TextAlign.left,
                    style: TextStyle(
                      color: BeNaturaColors.lightFont,
                    ),
                    size: 20),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.blueGrey.shade50,
                  thickness: 0.5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                child: BeNaturaText(AppLocalizations.of(context)!.htBeNatura,
                    align: TextAlign.left,
                    style: TextStyle(
                      color: BeNaturaColors.lightFont,
                    ),
                    size: 20),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.blueGrey.shade50,
                  thickness: 0.5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const OrderPage(),
                    ),
                  );
                },
                child: BeNaturaText(AppLocalizations.of(context)!.orderOnline,
                    align: TextAlign.left,
                    style: TextStyle(
                      color: BeNaturaColors.lightFont,
                    ),
                    size: 20),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.blueGrey.shade50,
                  thickness: 0.5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MenuPage(),
                    ),
                  );
                },
                child: BeNaturaText(AppLocalizations.of(context)!.menu,
                    align: TextAlign.left,
                    style: TextStyle(
                      color: BeNaturaColors.lightFont,
                    ),
                    size: 20),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.blueGrey.shade50,
                  thickness: 0.5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const WePage(),
                    ),
                  );
                },
                child: BeNaturaText(AppLocalizations.of(context)!.we,
                    align: TextAlign.left,
                    style: TextStyle(
                      color: BeNaturaColors.lightFont,
                    ),
                    size: 20),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.blueGrey.shade50,
                  thickness: 0.5,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: BeNaturaText(
                    AppLocalizations.of(context)!.copyright,
                    size: 14,
                    align: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blueGrey.shade100,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
