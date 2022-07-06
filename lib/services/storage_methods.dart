import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageMethods{

  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future<String> uplodImagetoStorage(Uint8List file, String childName)async{

   Reference ref = _firebaseStorage.ref().child(childName).child(_auth.currentUser!.uid);

   UploadTask uploadTask = ref.putData(file);

   TaskSnapshot snapshot = await uploadTask;

   String downloadUrl = await snapshot.ref.getDownloadURL();
   return downloadUrl;

  }
}