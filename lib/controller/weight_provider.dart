import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weight_tracking_app/models/weight_model.dart';
import 'package:weight_tracking_app/services/data_base_services.dart';
import 'package:weight_tracking_app/services/weight_methods.dart';

class WeightProvider with ChangeNotifier{

 WeightModel? _weight;
 final AddWeight weightC = AddWeight();

 WeightModel get getUser => _weight!;
 
 Future<void> refreshWeight()async{
  WeightModel weight = await weightC.getWeights();
  _weight = weight;
  notifyListeners();
 }

}




