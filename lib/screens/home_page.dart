import 'package:be_natura/screens/menu_page.dart';
import 'package:be_natura/screens/order_page.dart';
import 'package:be_natura/theme/be_natura_resources.dart';
import 'package:be_natura/utils/bn_analytics.dart';
import 'package:be_natura/widgets/be_natura_bottom_bar.dart';
import 'package:be_natura/widgets/be_natura_drawer.dart';
import 'package:be_natura/widgets/components/view/bn_default.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:be_natura/widgets/be_natura_section.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:be_natura/theme/be_natura_colors.dart';
import 'package:be_natura/widgets/be_natura_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late final VideoPlayerController _controller = VideoPlayerController.networkUrl(
      Uri.parse(BeNaturaResources.bnIntroVideo));

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
                Column(children: [
                  /*Center(
                  child: _controller.value.isInitialized
                      ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                      : const BNDefault(),
                ),*/
                  FutureBuilder(
                    future: _controller.initialize(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        // If the VideoPlayerController has finished initialization, use
                        // the data it provides to limit the aspect ratio of the video.
                        _controller.play();
                        _controller.setLooping(true);
                        return AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          // Use the VideoPlayer widget to display the video.
                          child: VideoPlayer(_controller),
                        );
                      } else {
                        // If the VideoPlayerController is still initializing, show a
                        // loading spinner.
                        return const BNDefault();
                      }
                    },
                  ),
                  /// Order online section *
                  BeNaturaSection(
                    backgroundImage: BeNaturaResources.bnOrderBowl,
                    opacity: 0.0,
                    message: AppLocalizations.of(context)!.sectHomeOrder,
                    hashTagMessage: AppLocalizations.of(context)!.htBeNatura,
                    textColor: BeNaturaColors.darkFont,
                    buttonLeft:
                        AppLocalizations.of(context)!.buttonOrder,
                    buttonLeftDestination: () {
                      // Log User interaction
                      FirebaseAnalytics.instance.logEvent(name: BNAnalytics.homeOrderPress);

                      // Navigate to Order Screen
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const OrderPage(),
                        ),
                      );
                    },
                  ),
                  /// Menu section *
                  BeNaturaSection(
                    backgroundImage: BeNaturaResources.bnBowls,
                    message: AppLocalizations.of(context)!.sectHomeMenu,
                    hashTagMessage: "",
                    textColor: BeNaturaColors.lightFont,
                    buttonLeft: AppLocalizations.of(context)!.buttonMenu,
                    buttonLeftDestination: () {
                      // Log User interaction
                      FirebaseAnalytics.instance.logEvent(name: BNAnalytics.homeMenuPress);

                      // Navigate to Menu Screen
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MenuPage(),
                        ),
                      );
                    },
                  ),
                  /// After work section *
                  BeNaturaSection(
                    backgroundImage: BeNaturaResources.bnCocktail,
                    message: AppLocalizations.of(context)!.sectHomeCocktail,
                    hashTagMessage: "",
                    textColor: BeNaturaColors.lightFont,
                  ),
                  /// Sandwich section *
                  BeNaturaSection(
                    backgroundImage: BeNaturaResources.bnSandwich,
                    message: AppLocalizations.of(context)!.sectHomeSandwich,
                    hashTagMessage: "",
                    textColor: BeNaturaColors.lightFont,
                  ),

                  /// Salad section *
                  BeNaturaSection(
                    backgroundImage: BeNaturaResources.bnSalad,
                    message: AppLocalizations.of(context)!.sectHomeSalad,
                    hashTagMessage: "",
                    textColor: BeNaturaColors.lightFont,
                  ),
                ])
              ],
            ),
            const BeNaturaBottomBar(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
