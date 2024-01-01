import 'package:bitsadmission/data/photos.dart';
import 'package:bitsadmission/screens/home.dart';
import 'package:bitsadmission/widegt,dart/bottombaritem.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor:
        Color.fromARGB(255, 181, 178, 178), // Change this color as needed
  ));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isdark = true;
  void switchtheme() {
    setState(() {
      isdark = !isdark;
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData m1 = MediaQuery.of(context);
    return MaterialApp(
      routes: {
        'home': (context) => Home(m1: m1),
      },
      title: 'Theme Switcher',
      debugShowCheckedModeBanner: false,
      theme: isdark
          ? ThemeData.dark().copyWith(
              textTheme: TextTheme(
                  displayLarge: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      fontSize: m1.size.height / 20,
                      textBaseline: TextBaseline.alphabetic),
                  displayMedium: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w800,
                      color: Color.fromARGB(255, 58, 58, 111),
                      fontSize: m1.size.height / 40),
                  titleLarge: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      fontSize: m1.size.height / 40),
                  titleSmall: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: m1.size.height / 60)),
              primaryColor: Colors.blue,
              scaffoldBackgroundColor: Colors.black12,
              appBarTheme: AppBarTheme(
                  backgroundColor: Colors
                      .transparent), // Set your default light theme primary color
            )
          : ThemeData.light().copyWith(
              primaryColor:
                  Colors.teal, // Set your default dark theme primary color
            ),
      home: ThemeSwitcher(
        switchTheme: switchtheme,
        isdark: isdark,
      ),
    );
  }
}

class ThemeSwitcher extends StatefulWidget {
  Function switchTheme;
  bool isdark;
  ThemeSwitcher({required this.switchTheme, required this.isdark});
  @override
  _ThemeSwitcherState createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  void toggleTheme() {
    setState(() {
      widget.isdark = !widget.isdark;
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData m1 = MediaQuery.of(context);
    return Home(m1: m1);
  }
}
