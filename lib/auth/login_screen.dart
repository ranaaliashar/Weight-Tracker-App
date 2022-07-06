import 'package:flutter/material.dart';
import 'package:weight_tracking_app/services/data_base_services.dart';
import 'package:weight_tracking_app/utils/colors.dart';
import 'package:weight_tracking_app/views/home_page.dart';
import 'package:weight_tracking_app/widgets/text_input_filed.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> signInUser()async{
   await DatabaseServices().signInUser(email: _emailController.text, password: _passwordController.text);
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
                'Login',
                style: TextStyle(
                  // color: buttonColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: double.infinity,
                margin:const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _emailController,
                  icon: Icons.email,
                  labelText: "e-mail",
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: double.infinity,
                margin:const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _passwordController,
                  icon: Icons.lock,
                  labelText: "password",
                  isObsecure: true,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width-40,
                height: 50,
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child:InkWell(
                  onTap: (){
                    signInUser().then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> HomePage())));
                    print('working');
                  },
                  child: const Text('Login', 
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
                children:   [
                 const Text("Don't have an account? ", 
                   style: TextStyle(
                    // color: buttonColor,
                    fontSize: 20,
                    // fontWeight: FontWeight.bold,
                  ),
                  ),
                  InkWell(
                    onTap: (){
                    print('Navigator user');
                  },
                    child: Text(
                      "Register ", 
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
          ),),
    );
  }
}
