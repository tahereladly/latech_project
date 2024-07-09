import 'package:final_pro/components/constant.dart';
import 'package:flutter/material.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("About-App:"),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: width - 30,
              child: const Card(
                surfaceTintColor: Colors.white,
                color: kLightBlue,
                elevation: 10,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "*An application that displays electronic devicesI have different types of devices that are displayed in the application like computers,speakers ,smart object\n\n*The  app is available for bothAndroid and iOS, so you can respond quickly to questions from bidders or buyers. To download the app for your device, select from\n\n*The mobile app makes it easy to create, edit, and monitor your listings. You can also relist items and provide tracking information on the go.\n\n*The  app is available for bothAndroid and iOS, so you can respond quickly to questions from bidders or buyers. To download the app for your device, select from",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: kPrimaryTextColor),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Thank you ",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
