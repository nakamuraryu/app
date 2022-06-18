import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:app/main.dart';
import 'package:app/view/counter.dart';
import 'package:app/view/completed_signup.dart';
import 'package:app/view/signup.dart';
import 'package:flutter/material.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User? user = auth.currentUser;
  FirebaseFirestore.instance;
  
  // m.main();
  // runApp(const sub.NextPage());
  // runApp(const sub2.RegisterApp());
  runApp(const CompletedSignupPage());
}
