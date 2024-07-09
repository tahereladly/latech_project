import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../components/Constant.dart';
import '../screens/category_screen/laptop.dart';

class SaleItem extends StatelessWidget {
  SaleItem(
      {super.key,
      required this.category,
      required this.image,
      required this.sale});

  String image;
  String category;
  String sale;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (category == "Laptops" || category == "Monitors") {
          Navigator.push(
              context, MaterialPageRoute(builder: (builder) => LaptopScreen()));
        }
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        width: 150,
        decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(6)),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 25,
                margin: EdgeInsets.only(left: 10),
                child: Center(
                    child: Text(sale,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff1F53E4)))),
                decoration: BoxDecoration(
                    color: const Color(0xffe0ecf8),
                    borderRadius: BorderRadius.circular(2)),
              ),
            ],
          ),
          Image.network(image),
          Text(
            category,
            style: const TextStyle(
                color: kPrimaryTextColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          )
        ]),
      ),
    );
  }
}
