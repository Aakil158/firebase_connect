import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_connect/pages/homepage.dart';
import 'package:firebase_connect/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return Homepage();
          }else{
            return Login();
          }
        },      ),
    );
  }
}