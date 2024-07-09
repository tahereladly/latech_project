import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_pro/components/constant.dart';
import 'package:final_pro/screens/home_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserFormScreen extends StatefulWidget {
  const UserFormScreen({super.key});

  @override
  State<UserFormScreen> createState() => _NewRegisterScreenState();
}

class _NewRegisterScreenState extends State<UserFormScreen> {
  bool visible = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  List<String> gender = ["Male", "Female", "Other"];
  var formkey = GlobalKey<FormState>();
  Future<void> selectDateFromPicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year - 20),
      firstDate: DateTime(DateTime.now().year - 30),
      lastDate: DateTime(DateTime.now().year),
    );
    if (picked != null) {
      setState(() {
        dobController.text = "${picked.day}/ ${picked.month}/ ${picked.year}";
      });
    }
  }
  sendUserDataToDB()async{

    final FirebaseAuth auth = FirebaseAuth.instance;
    var  currentUser = auth.currentUser;

    CollectionReference collectionRef = FirebaseFirestore.instance.collection("users-form-data");
    return collectionRef.doc(currentUser!.email).set({
      "name":nameController.text,
      "phone":phoneController.text,
      "dob":dobController.text,
      "gender":genderController.text,
      "age":ageController.text,
    }).then((value) => Navigator.push(context, MaterialPageRoute(builder: (_)=>const HomeLayout()))).catchError((error)=>print("something is wrong. $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColor,

        body: Center(
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Expanded(
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Submit the form to continue",
                      style: TextStyle(fontSize: 19, color: Colors.white),
                    ),
                    SizedBox(height: 100,),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Your Name";
                          }
                        },
                        controller: nameController,
                        decoration: const InputDecoration(

                          fillColor: Colors.white,
                          filled: true,
                          labelText: " Name",
                          hintText: "Enter your Name",
                          floatingLabelBehavior: FloatingLabelBehavior.always,

                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Phone Number shouldn't be empty";
                          }
                        },
                        controller: phoneController,
                        decoration: const InputDecoration(

                          fillColor: Colors.white,
                          filled: true,
                          labelText: " Phone Number",
                          hintText: "Enter your Phone Number",
                          floatingLabelBehavior: FloatingLabelBehavior.always,

                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Data of birth shouldn't be empty";
                          }
                        },

                        controller: dobController,
                        decoration: InputDecoration(

                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon:  IconButton(
                            icon:const Icon(Icons.calendar_today_outlined),
                            onPressed: ()=> selectDateFromPicker(context),
                          ),
                          labelText: " Date Of Birth",
                          hintText: "Enter your Date Of Birth",
                          floatingLabelBehavior: FloatingLabelBehavior.always,

                        ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Gender shouldn't be empty";
                          }
                        },
                        controller: genderController,
                        decoration: InputDecoration(

                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: DropdownButton<String>(
                            items: gender.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                                onTap: () {
                                  setState(() {
                                    genderController.text = value;
                                  });
                                },
                              );
                            }).toList(),
                            onChanged: (_) {},
                          ),
                          labelText: " Gender",
                          hintText: "Choose your Gender",
                          floatingLabelBehavior: FloatingLabelBehavior.always,

                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Age shouldn't be empty";
                          }
                        },
                        controller: ageController,
                        decoration: const InputDecoration(

                          fillColor: Colors.white,
                          filled: true,
                          labelText: " Age",
                          hintText: "Enter your Age",
                          floatingLabelBehavior: FloatingLabelBehavior.always,

                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 311,
                      height: 53,
                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius: BorderRadius.circular(
                          4,
                        ),
                      ),

                      child: MaterialButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            sendUserDataToDB();
                             Navigator.pushReplacement(
                                 context,
                                 MaterialPageRoute(
                                    builder: (context) => const HomeLayout()));
                          }
                        },
                        child: const Text(
                          "Continue",
                          style: TextStyle(color: Colors.black,fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
