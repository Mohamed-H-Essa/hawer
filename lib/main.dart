import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hawer_app/core/constants.dart';
import 'app/home_pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale: const Locale(
          "fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales,
      debugShowCheckedModeBanner: false,
      title: 'Rover app',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffE5EBFC),
        primarySwatch: Colors.blue,
      ),
      // home: UserState(),
      home: AnimatedSplashScreen(
        splash: Text(
          "حاوِر",
          style: TextStyle(
              color: Constants.darkBlue,
              fontSize: 60,
              fontWeight: FontWeight.bold),
        ),
        splashIconSize: 100,
        duration: 900,
        splashTransition: SplashTransition.rotationTransition,
        // nextScreen: const Feedback3(),
        nextScreen: const Home(),
      ),
    );
  }
}
