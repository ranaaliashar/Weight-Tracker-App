import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:weight_tracking_app/auth/login_screen.dart';
import 'package:weight_tracking_app/image_method.dart';
import 'package:weight_tracking_app/services/data_base_services.dart';
import 'package:weight_tracking_app/utils/colors.dart';
import 'package:weight_tracking_app/widgets/text_input_filed.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _usernameController = TextEditingController();
  Uint8List? file;

  showImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      file = im;
    });
  }

  // String uid = Uuid().v4,

  signUPUser() async {
   String res = await DatabaseServices().signUpUser(
      email: _emailController.text,
      username: _usernameController.text,
      password: _passwordController.text,
      file: file!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Weight Tracker',
              style: TextStyle(
                color: buttonColor,
                fontSize: 35,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Sign Up',
              style: TextStyle(
                // color: buttonColor,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Stack(
              children: [
                file != null
                    ? CircleAvatar(
                        radius: 64,
                        backgroundColor: buttonColor,
                        backgroundImage: MemoryImage(file!))
                    : const CircleAvatar(
                        radius: 64,
                        backgroundColor: buttonColor,
                        backgroundImage: const NetworkImage(
                            'https://img.freepik.com/free-photo/horizontal-shot-stupefied-young-man-looks-surprisingly-indicates-down-being-stunned-by-something-unbelievable-wears-casual-bright-red-t-shirt-stands-against-white-wall_273609-16255.jpg?w=2000')),
                Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                        onPressed: () {
                          print('pick image');
                          showImage();
                        },
                        icon: Icon(
                          Icons.camera_alt,
                          color: buttonColor,
                        )))
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                controller: _usernameController,
                icon: Icons.person,
                labelText: "username",
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                controller: _emailController,
                icon: Icons.email,
                labelText: "e-mail",
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                controller: _passwordController,
                icon: Icons.lock,
                labelText: "password",
                isObsecure: true,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width - 40,
              height: 50,
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: InkWell(
                onTap: () {
                  signUPUser();
                  print('working');
                },
                child: const Text(
                  'Register',
                  style: TextStyle(
                    // color: buttonColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Have an account? ",
                  style: TextStyle(
                    // color: buttonColor,
                    fontSize: 20,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {
                    // print('Navigator user');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => LoginScreen()));
                  },
                  child:const Text(
                    "Login ",
                    style: TextStyle(
                      color: buttonColor,
                      fontSize: 20,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
