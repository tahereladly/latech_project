import 'package:final_pro/components/constant.dart';
import 'package:final_pro/screens/category_screen/laptop.dart';
import 'package:final_pro/screens/home.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

int categoryIndex = 0;
List<String> categories = [
  "All",
  "Computers",
  "Laptop",
  "Accessories",
  "Smartphones",
  "Smart objects",
  "Speakers"
];

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      // appBar: AppBar(
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.pop(
      //           context, MaterialPageRoute(builder: (builder) => HomeScreen()));
      //     },
      //     icon: const Icon(Icons.arrow_back),
      //     color: const Color(0xff0001FC),
      //   ),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            const Text(
              'Categories',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryTextColor),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LaptopScreen()),
                          );
                        },
                        child: Container(
                          height: 77,
                          width: 343,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(19),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  categories[index],
                                  style: const TextStyle(
                                      color: Color(0xff0001FC),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 19),
                  itemCount: categories.length),
            ),
          ],
        ),
      ),
    );
  }
}
