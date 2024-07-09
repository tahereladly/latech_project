import 'package:flutter/material.dart';

import '../components/constant.dart';

class BestSellingItem extends StatelessWidget {
  BestSellingItem(
      {super.key,
      required this.image,
      required this.desc,
      required this.price});

  String image;
  String desc;
  String price;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kBottomNavigationBarHeight;
    var width = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        margin: EdgeInsets.only(top: height / 19),
        height: height / 5,
        width: width / 1.07,
        decoration: BoxDecoration(
            color: kBackGroundColor, borderRadius: BorderRadius.circular(6)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  desc,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  price,
                  style: const TextStyle(
                      color: Color(0xffE0ECF8),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            Image.network(
              image,
              width: width / 3.2,
            )
          ],
        ),
      ),
    );
  }
}
