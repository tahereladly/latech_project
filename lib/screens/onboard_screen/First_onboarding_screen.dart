import 'dart:async';
import 'package:final_pro/components/constant.dart';
import 'package:final_pro/screens/onboard_screen/Final_Onboarding_Screen.dart';
import 'package:final_pro/screens/onboard_screen/onboard_content/onboarding_contents.dart';
import 'package:final_pro/screens/onboard_screen/size/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    // Timer(const Duration(seconds: 3),()=>Navigator.push(context, CupertinoPageRoute(builder: (_)=>NewRegisterScreen())));
    super.initState();
  }

  int _currentPage = 0;
  List colors = const [
    kBackGroundColor,
    kBackGroundColor,
    kBackGroundColor,
  ];

  AnimatedContainer _buildDots({
    int? index,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;

    return Scaffold(
      backgroundColor: colors[_currentPage],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: _controller,
                  onPageChanged: (value) =>
                      setState(() => _currentPage = value),
                  itemCount: contents.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 120,
                          ),
                          Image.asset(
                            contents[i].image,
                            height: SizeConfig.blockV! * 30,
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          Text(
                            contents[i].title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: "Mulish",
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        contents.length,
                        (int index) => _buildDots(
                          index: index,
                        ),
                      ),
                    ),
                    // _currentPage + 1 == contents.length
                    //     ? Padding(
                    //         padding: const EdgeInsets.all(30),
                    //         child: ElevatedButton(

                    //           onPressed: () {
                    //             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const FinalOnboarding(),),);
                    //           },
                    //           style: ElevatedButton.styleFrom(
                    //             backgroundColor: kBackGroundColor,
                    //             elevation: 0,
                    //             shape: RoundedRectangleBorder(
                    //               borderRadius: BorderRadius.circular(50),
                    //             ),
                    //             padding: (width <= 550)
                    //                 ? const EdgeInsets.symmetric(
                    //                     horizontal: 100, vertical: 20)
                    //                 : EdgeInsets.symmetric(
                    //                     horizontal: width * 0.2, vertical: 25),
                    //             textStyle:
                    //                 TextStyle(fontSize: (width <= 550) ? 13 : 17),
                    //           ),
                    //           child: const Text(" Next",style: TextStyle(fontSize: 18,color: Colors.black),),
                    //         ),
                    //       )
                    //:
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (_currentPage + 1 == contents.length) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const FinalOnboarding(),
                                  ),
                                );
                              }
                              _controller.nextPage(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeIn,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kBackGroundColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              elevation: 0,
                              padding: (width <= 550)
                                  ? const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 20)
                                  : const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 25),
                              textStyle:
                                  TextStyle(fontSize: (width <= 550) ? 13 : 17),
                            ),
                            child: const Text(
                              "NEXT",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
