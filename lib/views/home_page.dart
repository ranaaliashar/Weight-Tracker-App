import 'package:flutter/material.dart';
import 'package:weight_tracking_app/services/data_base_services.dart';
import 'package:weight_tracking_app/services/weight_methods.dart';
import 'package:weight_tracking_app/utils/colors.dart';
import 'package:weight_tracking_app/widgets/drawer_list.dart';
import 'package:weight_tracking_app/widgets/text_input_filed.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);

  TextEditingController controller = TextEditingController();

  addWeighttoDatabase()async{
   String res= await AddWeight().weightMethod(weight: controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      drawer: Drawer(
        backgroundColor: buttonColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
             const SizedBox(height: 30,),
              const CircleAvatar(
                radius: 65,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage('https://icon-library.com/images/male-avatar-icon/male-avatar-icon-11.jpg'),
              ),
              DrawerWidget(
                title: "All Weights",
                icon: Icons.person,
              ),
             const Divider(
              thickness : 1,
            color: Colors.white,
            ),
              DrawerWidget(
                title: "Update Weights",
                icon: Icons.update,
              ),
              const Divider(
              thickness : 1,
            color: Colors.white,
            ),
              DrawerWidget(
                title: "Delete Weights",
                icon: Icons.delete,
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width - 80,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: InkWell(
                  onTap: () {
                   DatabaseServices().signOut();
                  },
                  child: const Text(
                    'Sign Out',
                    style: TextStyle(
                      // color: buttonColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Weights',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.85,
              height: 200,
              decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                
                children: [
           const SizedBox(height: 20,),

                 const Text('Enter your Weight in kg',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),),
            SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
          labelStyle: const TextStyle(fontSize: 20),
          prefixIcon: Icon(Icons.perm_identity_sharp,),
          // labelText: 'Enter below',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: borderColor),
          ),
        ),
                ),
              ),
              // TextInputField(
                
              //   controller: controller, icon:  labelText: 'Enter below')
                ],
              ),
            ),
            SizedBox(height: 30,),
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
                  // print('working');
                  addWeighttoDatabase();
                },
                child: const Text(
                  'Add weight',
                  style: TextStyle(
                    // color: buttonColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


