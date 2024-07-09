import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_pro/widgets/best_selling_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dots_indicator/dots_indicator.dart';
import '../components/Constant.dart';
import '../widgets/sale_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List saleItems = [];
  List bestSelling = [];
  int _sliderIndex = 0;

  CollectionReference saleRef = FirebaseFirestore.instance.collection("sales");
  CollectionReference bestSellingRef =
      FirebaseFirestore.instance.collection("best-selling");

  getSale() async {
    var responsebody = await saleRef.get();
    responsebody.docs.forEach((element) {
      setState(() {});

      saleItems.add(element.data());
    });
  }

  getBestSelling() async {
    var responsebody = await bestSellingRef.get();
    responsebody.docs.forEach((element) {
      setState(() {});

      bestSelling.add(element.data());
    });
  }

  @override
  void initState() {
    getSale();
    getBestSelling();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 55, left: 21),
          child: Text(
            "Home",
            style: TextStyle(
                color: kPrimaryTextColor,
                fontSize: 32,
                fontWeight: FontWeight.w900),
          ),
        ),
        CarouselSlider.builder(
          itemCount: bestSelling.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) {
            if (bestSelling.isNotEmpty) {
              return BestSellingItem(
                image: bestSelling[itemIndex]["image"],
                price: bestSelling[itemIndex]["price"],
                desc: bestSelling[itemIndex]["desc"],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              aspectRatio: 2.0,
              initialPage: 0,
              onPageChanged: (index, reason) {
                _sliderIndex = index;
                setState(() {});
              }),
        ),
        Center(
          child: DotsIndicator(
            dotsCount: 5,
            position: _sliderIndex,
            decorator: DotsDecorator(
                color: const Color(0xffA7A9BE).withOpacity(0.3),
                activeColor: const Color(0xffA7A9BE),
                size: const Size(7, 7),
                activeSize: const Size(8, 8),
                spacing:
                    const EdgeInsets.symmetric(horizontal: 2, vertical: 18)),
          ),
        ),
        const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 35, bottom: 20),
            child: Text(
              "Sales",
              style: TextStyle(
                  color: kPrimaryTextColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          height: 235,
          child: ListView.builder(
              // shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: saleItems.length,
              itemBuilder: (context, i) {
                return SaleItem(
                  sale: saleItems[i]['sale'],
                  image: saleItems[i]['image'],
                  category: saleItems[i]['category'],
                );
              }),
        ),
      ],
    );
  }
}
