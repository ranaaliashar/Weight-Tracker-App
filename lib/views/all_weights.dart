import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weight_tracking_app/controller/weight_provider.dart';
import 'package:weight_tracking_app/models/weight_model.dart';

class AllWeights extends StatelessWidget {
  const AllWeights({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // model.User user = Provider.of<UserProvider>(context).getUser;

    WeightModel weightModel = Provider.of<WeightProvider>(context).getUser;

    return weightModel != null? 
    
    Scaffold(
      appBar: AppBar(title: Text(weightModel.weight),),
    ) : CircularProgressIndicator();
  }
}