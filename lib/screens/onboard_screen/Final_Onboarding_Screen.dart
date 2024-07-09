import 'package:final_pro/components/constant.dart';
import 'package:final_pro/login%20and%20register/login_screen/Login_Screen.dart';
import 'package:final_pro/login%20and%20register/register_screen/Register_Screen.dart';
import 'package:flutter/material.dart';

class FinalOnboarding extends StatelessWidget {
  const FinalOnboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text("Connexion",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.white)),
              const Spacer(
                flex: 4,
              ),
              Container(
                  alignment: AlignmentDirectional.center,
                  width: 311,
                  height: 53,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white),
                  child: TextButton(
                    child: const Text("Create an account",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff0001FC),
                        )),
                    onPressed: () {},
                  )),
              const SizedBox(
                height: 35,
              ),
              Container(
                width: 311,
                height: 53,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/img_1.png'),
                    const SizedBox(
                      width: 16,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Connect with Google",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Container(
                width: 311,
                height: 53,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: const Color(0xff415A93)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/img_2.png'),
                    const SizedBox(
                      width: 16,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text("Connect with Facebook",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ))),
                  ],
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account ?",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffFBDF00),
                      )),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          color: Color(
                            0xffFBDF00,
                          ),
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 6),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterScreen(),
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
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
