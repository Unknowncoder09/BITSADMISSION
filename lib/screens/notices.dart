import 'package:bitsadmission/data/notices.dart';
import 'package:bitsadmission/screens/calender.dart';
import 'package:bitsadmission/widegt,dart/bottombaritem.dart';
import 'package:flutter/material.dart';

class Others extends StatelessWidget {
  String title;
  Others({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    var m1 = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(m1.size.height / 28),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.displayLarge,
                )),
            toolbarHeight: m1.size.height / 12,
            automaticallyImplyLeading: false,
            backgroundColor: Color.fromARGB(255, 181, 178, 178),
            centerTitle: true,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Calender();
                    }));
                  },
                  child: Container(
                    height: m1.size.height / 14,
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
            height: m1.size.height,
            child: ListView(
              children: title == 'NOTICES'
                  ? [
                      ...List.generate(notices.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: ListView(
                              children: [
                                Container(
                                  height: m1.size.height / 25,
                                  color: Colors.grey,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        notices[index]['title'].toString() +
                                            ":"),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    notices[index]['body'].toString(),
                                    textAlign: TextAlign.justify,
                                  ),
                                )
                              ],
                              shrinkWrap: true,
                            ),
                          ),
                        );
                      })
                    ]
                  : [],
            ),
          ),
          bottomNavigationBar: BottomBar()),
    );
  }
}
