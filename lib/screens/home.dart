import 'package:bitsadmission/data/photos.dart';
import 'package:bitsadmission/screens/calender.dart';
import 'package:bitsadmission/widegt,dart/bottombaritem.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({
    super.key,
    required this.m1,
  });

  final MediaQueryData m1;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool hide = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(widget.m1.size.height / 28),
                child: Text(
                  "",
                  style: Theme.of(context).textTheme.displayLarge,
                )),
            toolbarHeight: widget.m1.size.height / 12,
            automaticallyImplyLeading: false,
            backgroundColor: Color.fromARGB(255, 181, 178, 178),
            centerTitle: true,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () async {
                    setState(() {
                      hide = true;
                    });

                    await Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Calender();
                    }));
                    setState(() {
                      hide = false;
                    });
                  },
                  child: Container(
                    height: widget.m1.size.height / 14,
                    child: Image.asset(
                      'assets/mdi_calendar.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: Container(
            height: widget.m1.size.height,
            child: hide == true
                ? SizedBox.shrink()
                : ListView(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: widget.m1.size.width,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 181, 178, 178),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: Text(
                              "WELCOME TO THE BITS ADMISSIONS APP",
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: const Color.fromARGB(255, 37, 37, 37),
                        height: widget.m1.size.height / 3.8,
                        child: CarouselSlider(
                          items: List.generate(
                              home.length,
                              (index) => Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 5.0),
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
                        width: widget.m1.size.width,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 181, 178, 178),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                "EDUCATIONAL PROCESS AND PROGRAMMES OF STUDIES",
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: widget.m1.size.height / 4,
                              width: widget.m1.size.width / 3,
                              child: Image.asset(
                                "assets/home.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            height: widget.m1.size.height / 4,
                            width: widget.m1.size.height / 4,
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
          bottomNavigationBar: BottomBar()),
    );
  }
}
