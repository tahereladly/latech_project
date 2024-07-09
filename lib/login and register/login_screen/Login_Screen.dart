import 'package:final_pro/components/constant.dart';
import 'package:final_pro/login%20and%20register/register_screen/Register_Screen.dart';
import 'package:final_pro/screens/home_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool visible = true;

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  var formkey = GlobalKey<FormState>();
  signIn() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      var authCredential = userCredential.user;
      print(authCredential!.uid);
      if (authCredential.uid.isNotEmpty) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const HomeLayout()));
      } else {
        Fluttertoast.showToast(
          msg: "Something is wrong",
          textColor: Colors.white,
          fontSize: 20,
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
            msg: "No user found for that email.",
            textColor: Colors.white,
            fontSize: 20,
            backgroundColor: Colors.black);
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(
          msg: "Wrong password provided for that user.",
          textColor: Colors.white,
          fontSize: 20,
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackGroundColor,
        body: Center(
          child: Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      const Text(
                        "Login ",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "email shouldn't be empty";
                          }
                        },
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: " Email Address",
                          hintText: "Enter your email",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          prefixIcon: Icon(
                            Icons.email,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password shouldn't be empty";
                          }
                        },
                        controller: passwordController,
                        obscureText: visible,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: " Password",
                          hintText: "Enter your password",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          prefixIcon: const Icon(
                            Icons.email,
                          ),
                          suffixIcon: IconButton(
                            icon: visible
                                ? const Icon(Icons.remove_red_eye)
                                : const Icon(Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                visible = !visible;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                        ),
                        width: double.infinity,
                        child: MaterialButton(
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              signIn();
                            }
                          },
                          child: const Text(
                            "Validate",
                            style: TextStyle(
                                color: Color(0xff0001FC), fontSize: 18),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don’t have an account ?",
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
                                  builder: (context) => RegisterScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: Color(
                                    0xffFBDF00,
                                  ),
                                  fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen(),),);
                        },
                        child: const Text(
                          "Skip for now",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
