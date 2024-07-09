import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_pro/components/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
  TextEditingController? nameController;
  TextEditingController? phoneController;
  TextEditingController? ageController;

  setDataToTextField(data) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 150,
              height: 150,
              child: Image.asset(
                'assets/images/person.png',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: nameController =
                  TextEditingController(text: data['name']),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: " Name",
                fillColor: Colors.white,
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: phoneController =
                  TextEditingController(text: data['phone']),
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.phone,
                ),
                labelText: " Phone",
                fillColor: Colors.white,
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: ageController =
                  TextEditingController(text: data['age']),
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.support_agent,
                ),
                labelText: " Age",
                fillColor: Colors.white,
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
            const SizedBox(
              height: 20,
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
                    onPressed: () => updateData(),
                    child: const Text("Update"))),
          ],
        ),
      ),
    );
  }

  updateData() {
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("users-form-data");
    return _collectionRef.doc(FirebaseAuth.instance.currentUser!.email).update({
      "name": nameController!.text,
      "phone": phoneController!.text,
      "age": ageController!.text,
    }).then((value) => print("Updated Successfully"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightBlue,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("users-form-data")
              .doc(FirebaseAuth.instance.currentUser!.email)
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            var data = snapshot.data;
            if (data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return setDataToTextField(data);
          },
        ),
      )),
    );
  }
}
