import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:weight_tracking_app/models/weight_model.dart';

class AddWeight{
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future <WeightModel> getWeights ()async{
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap = await FirebaseFirestore.instance.collection("Weight").doc(currentUser.uid).get();
    return WeightModel.fromSnapshot(snap);
  }

 Future<String> weightMethod(
  {
    required weight,
  }
 )async{
 String res ="some Error Occured";
  try{
    if(weight.isNotEmpty){
      WeightModel weightModel = WeightModel(weight: weight, dateTime:DateTime.now());
      _firestore.collection('Weight').add(weightModel.toJson());
      res = "added Successfully";
    }
  }catch(err){
   return err.toString();
  }
  return res;
  }
}