import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  IconData icon;
  String title;
  DrawerWidget({Key? key, required this.icon, required this.title})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 100,
          child: Icon(icon, color: Colors.white, size: 30,),
        ),
        
        Expanded(
          child: Text(
            title,
            style: TextStyle(
                // color: Colors.black,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                ),
          ),
        ),
      ],
    );
  }
}
