import 'package:bitsadmission/data/calenderdata.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData m1 = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(m1.size.height / 28),
            child: Text(
              "CALENDAR",
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
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: m1.size.height / 14,
                child: Image.asset(
                  'assets/cross.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          ...List.generate(
            calenderdata.length,
            (index) => Padding(
              padding: const EdgeInsets.all(16.0),
              // child: ListTile(
              //   tileColor: Colors.grey,
              //   title: Text(
              //     calenderdata[index].d1 + ":",
              //     style: Theme.of(context).textTheme.titleLarge,
              //   ),
              //   subtitle: Text(
              //     calenderdata[index].title,
              //     style: Theme.of(context).textTheme.titleSmall,
              //   ),
              // ),
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 181, 178, 178),
                    borderRadius: BorderRadius.all(Radius.circular(2.0))),
                height: m1.size.height / 10,
                width: m1.size.width,
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      calenderdata[index].d1 + ":",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Divider(
                      height: 5,
                    ),
                    Text(
                      calenderdata[index].title,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
