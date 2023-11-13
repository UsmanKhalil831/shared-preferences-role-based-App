import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project/AdminScreen.dart';
import 'package:project/HomeScreen.dart';
import 'package:project/LoginScreen.dart';
import 'package:project/SignUpScreen.dart';
import 'package:project/StudentScreen.dart';
import 'package:project/TeacherScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState(){
    super.initState();
  isLogin();
  }
  void isLogin() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool islogin = sp.getBool('isLogin') ?? false;
    String Type = sp.getString('userType') ?? '';
    
    if(islogin == true){
            if(Type == 'student'){
            Timer(Duration(seconds: 3), () { });
            Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentScreen()));
          }
          else if(Type == 'teacher'){
            Timer(Duration(seconds: 3), () { });
            Navigator.push(context, MaterialPageRoute(builder: (context)=>TeacherScreen()));
          }
          else{
            Timer(Duration(seconds: 3), () { });
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminScreen()));
          }
    }
    else{
      Timer(Duration(seconds: 3), () { });
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Image.asset('assets/images/tree.jpeg'),
        ),
      ),
    );
  }
}