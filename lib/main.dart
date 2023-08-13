import 'package:be_natura/firebase_options.dart';
import 'package:be_natura/screens/home_page.dart';
import 'package:be_natura/screens/menu_page.dart';
import 'package:be_natura/screens/order_page.dart';
import 'package:be_natura/screens/we_page.dart';
import 'package:be_natura/theme/be_natura_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async{

  /// Initialize firebase analytics *
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    /// Fix Orientations to ease UX *
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: "BeNatura",
      theme: BeNaturaTheme().beNatura,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      routes: {
        '/': (context) => const HomePage(),
        '/order': (context) => const OrderPage(),
        '/menu': (context) => const MenuPage(),
        '/we': (context) => const WePage(),
      },
    );
  }
}
