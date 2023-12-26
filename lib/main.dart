import 'package:bitsadmission/data/photos.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);
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
      title: 'Theme Switcher',
      debugShowCheckedModeBanner: false,
      theme: isdark
          ? ThemeData.dark().copyWith(
              textTheme: TextTheme(
                  displayMedium: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w800,
                      color: Color.fromARGB(255, 58, 58, 111),
                      fontSize: m1.size.height / 40)),
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
    return Scaffold(
      body: Container(
        height: m1.size.height,
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: m1.size.height / 14,
                    color: Colors.red,
                    child: Image.asset(
                      'assets/mdi_calendar.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: m1.size.height / 21,
              width: m1.size.width,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 181, 178, 178),
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: Center(
                child: Text(
                  "WELCOME TO THE BITS ADMISSIONS APP",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 37, 37, 37),
              height: m1.size.height / 3.8,
              child: CarouselSlider(
                items: List.generate(
                    home.length,
                    (index) => Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                          ),
                          child: Image.asset(
                            home[index],
                            fit: BoxFit.cover,
                          ),
                        )),
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Birla Institute of Technology & Science (BITS), Pilani a leading Institute of Higher Education and a deemed University under section 3 of the UGC act offering degree programmes in Engineering, Sciences, Technology, Pharmacy, Management and Humanities. This web site describes the admission modalities for the on-campus degree programmes offered at Pilani campus, Goa Campus and Hyderabad Campus of BITS, Pilani.",
                  textAlign: TextAlign.justify,
                  textScaler: TextScaler.linear(0.775),
                ),
              ),
            ),
            Container(
              height: m1.size.height / 15,
              width: m1.size.width,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 181, 178, 178),
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "EDUCATIONAL PROCESS AND PROGRAMMES OF STUDIES",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/home.png",
                    height: m1.size.height / 5,
                    width: m1.size.width / 3,
                  ),
                ),
                Container(
                  height: m1.size.height / 5,
                  width: m1.size.height / 4,
                  child: Text(
                    "BITS Pilani's mission is to groom young leaders for driving economic and industrial progress, fostering societal creativity. Renowned for its innovation in higher education, the university employs a semester system with continuous evaluation. Modular and flexible educational programs, including Integrated First Degree, Higher Degree, and Doctoral programs, emphasize science and applied science components. ",
                    textAlign: TextAlign.justify,
                    textScaler: TextScaler.linear(0.775),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Practice School fosters industry links, while a unique academic structure supports innovations. Structural flexibility allows multiple entry points and meets diverse student needs. The curriculum, built on self-contained courses fostering curiosity and rational thinking, integrates real-world experience through internships and mission-oriented projects. Off-campus Work-Integrated programs target employed professionals, emphasizing self-learning and modern technologies. Collaboration with various organizations shapes structured or open degree offerings. The Three Tier Structure encompasses all Institute programs",
                textAlign: TextAlign.justify,
                textScaler: TextScaler.linear(0.775),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Stack(
        children: [
          BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
            ],
          ),
          Positioned(
            bottom: 4.0, // Adjust the position as needed
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Add more custom buttons as needed
                Padding(
                  padding: const EdgeInsets.all(0.1),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset('assets/notices.png'),
                        Text("NOTICES"),
                      ],
                    ),
                    height: m1.size.height / 18,
                    width: m1.size.width / 3.09,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.1),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset('assets/mark.png'),
                        Text("KNOW MORE"),
                      ],
                    ),
                    height: m1.size.height / 18,
                    width: m1.size.width / 3.09,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.1),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset('assets/docs.png'),
                        Text("READ DOCS"),
                      ],
                    ),
                    height: m1.size.height / 18,
                    width: m1.size.width / 3.09,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
