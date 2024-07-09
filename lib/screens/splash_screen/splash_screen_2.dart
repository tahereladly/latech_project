import 'package:final_pro/components/constant.dart';
import 'package:final_pro/login%20and%20register/login_screen/Login_Screen.dart';
import 'package:final_pro/screens/onboard_screen/First_onboarding_screen.dart';
import 'package:final_pro/screens/onboard_screen/size/size_config.dart';
import 'package:flutter/material.dart';

class SplashScreenTwo extends StatefulWidget {
  const SplashScreenTwo({Key? key}) : super(key: key);

  @override
  State<SplashScreenTwo> createState() => _SplashScreenTwoState();
}

class _SplashScreenTwoState extends State<SplashScreenTwo> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    // Timer(const Duration(seconds: 3),()=>Navigator.push(context, CupertinoPageRoute(builder: (_)=>NewRegisterScreen())));
    super.initState();
  }

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    return Scaffold(
      backgroundColor: kBackGroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("LATECH",
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  )),
              const SizedBox(
                height: 12,
              ),
              const Text("TECH MARKET",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  )),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 380,
                height: 300,
                child: Image.asset(
                  'assets/images/img.png',
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: 311,
                height: 53,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white),
                child: MaterialButton(
                  child: const Text("Let’s start",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      )),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OnboardingScreen(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                child: const Text("Skip for now",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
