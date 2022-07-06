import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:weight_tracking_app/models/user_model.dart';
import 'package:weight_tracking_app/services/storage_methods.dart';

class DatabaseServices {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String email,
    required String username,
    required String password,
    // required String userid,
    required Uint8List file,
  }) async {
      String res = "Some error occured";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        // uplodading image
        String profilePic =
            await StorageMethods().uplodImagetoStorage(file, 'ProfilePic');

        UserModel user = UserModel(
          email: email,
          profilePic: profilePic,
          uid: cred.user!.uid,
          username: username,
        );

        _firestore.collection('Users').doc(cred.user!.uid).set(user.toJson());
       res = "Registered Successfully";

      }
    } catch (err) {
       err.toString();
    }
    return res;

  }

  signInUser(
   { required String email,
    // required String username,
    required String password,}
  )async{
   await _auth.signInWithEmailAndPassword(email: email, password: password);
  }
  
  signOut()async{
    await _auth.signOut();
  }
  
}
