import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData m1 = MediaQuery.of(context);
    return Container(
      height: m1.size.height / 15,
      width: m1.size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BarItem(image: 'assets/notices.png', title: "NOTICES"),
          BarItem(image: 'assets/mark.png', title: "KNOW MORE"),
          BarItem(image: 'assets/docs.png', title: "READ DOCS")
        ],
      ),
    );
  }
}

class BarItem extends StatelessWidget {
  String image, title;
  BarItem({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    MediaQueryData m1 = MediaQuery.of(context);
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(image),
          Text(
            title,
            style: TextStyle(fontSize: m1.size.width / 34, color: Colors.white),
          ),
        ],
      ),
      height: m1.size.height / 16,
      width: m1.size.width / 3.05,
      color: Colors.grey,
    );
  }
}
