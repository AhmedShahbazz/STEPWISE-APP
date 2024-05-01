import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:setpwise/home.dart';
import 'dart:async';
import 'package:setpwise/navigation.dart';



class splashservices{

  void ishome(BuildContext context){
    final auth =FirebaseAuth.instance;
    final User =auth.currentUser;
    if(User!=null) {
      Timer(const Duration(seconds: 3),
              () =>
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => navigation()))
      );
    }else{
      Timer(const Duration(seconds: 3),
              () =>
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => home()))
      );

    }
  }
}