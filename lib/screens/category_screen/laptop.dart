import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_pro/screens/category_screen/category.dart';
import 'package:flutter/material.dart';

class LaptopScreen extends StatefulWidget {
  const LaptopScreen({Key? key}) : super(key: key);

  @override
  State<LaptopScreen> createState() => _LaptopScreenState();
}

List<String> imagesUrlCategories = [
  'assets/Lg gram.png',
  'assets/Macbook pro 13.png',
  'assets/MateBook 13.png',
  'assets/PixelBook Go.png',
  'assets/Surface laptop.png',
  'assets/XPS laptop 13.png',
];
int categoryIndex = 0;
List<String> categories = [
  "Lg gram",
  "Macbook pro 13",
  "MateBook 13",
  "PixelBook Go",
  "Surface laptop",
  "XPS laptop 13"
];
int priceIndex = 0;
List<String> price = [
  "USD 999",
  "USD 899",
  "USD 1399",
  "USD 1299",
  "USD 849",
  "USD 949"
];

class _LaptopScreenState extends State<LaptopScreen> {
  var selectedfilters;
  var selectedprice;
  final latech = FirebaseFirestore.instance.collection('Category').snapshots();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Laptop',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Container(
                    width: width / 2.3,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButton(
                        hint: const Text("Ascending price"),
                        items: ["Ascending price"]
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                        onChanged: (val) {
                          setState(() {
                            selectedprice = val;
                          });
                        },
                        value: selectedprice,
                        icon: const Icon(
                          Icons.arrow_upward_outlined,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width / 11,
                  ),
                  DropdownButton(
                    hint: const Text("Filters"),
                    items: ["Filters"]
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedfilters = val;
                      });
                    },
                    value: selectedfilters,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CategoryScreen()),
                        );
                      },
                      icon: const Icon(Icons.category_outlined))
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: StreamBuilder(
                stream: latech,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Connection error');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text('Loading....');
                  }
                  var docs = snapshot.data!.docs;
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: docs.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 100,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                              docs[index]['image'])),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    docs[index]['name'],
                                    style: const TextStyle(
                                        color: Color(0xff0001FC),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "${docs[index]['price']}\$",
                                    style: const TextStyle(
                                        color: Color(0xff0001FC),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
