import 'package:cloud_firestore/cloud_firestore.dart';

class WeightModel {
  String weight;
  DateTime dateTime;
 

  WeightModel({
    required this.weight,
    required this.dateTime,
  });

  Map<String, dynamic> toJson() => {
        "dateTime": dateTime,
        "weight": weight,
      
      };

  static WeightModel fromSnapshot(DocumentSnapshot snapshot) {
    return WeightModel(
      weight: snapshot['weight'],
      dateTime: snapshot['dateTime'],
     
    );
  }
}
