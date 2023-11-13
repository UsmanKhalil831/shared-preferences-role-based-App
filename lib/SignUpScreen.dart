
import 'package:flutter/material.dart';
import 'package:project/HomeScreen.dart';
import 'package:project/LoginScreen.dart';
import 'package:project/StudentScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  setvalues()async{
    SharedPreferences sp = await SharedPreferences.getInstance(); // ye future return karta hai isliay async await lagaengay
    sp.setString('email',emailController.text );
    //sp.setBool('isLogin', true);
    sp.setString('userType', typeController.text);//admin,student,teacher
    
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up Screen'),automaticallyImplyLeading: false,),
      body: Container(padding: EdgeInsets.all(20),
        child: Column(
        children: [
          TextField(controller: emailController,
          decoration: const InputDecoration(hintText: 'email'),),
          SizedBox(height: 20,),
          TextField(controller: passwordController,
          decoration: const InputDecoration(hintText: 'password'),),
          SizedBox(height: 20,),
          TextField(controller: typeController,
          decoration: const InputDecoration(hintText: 'type'),),
          SizedBox(height: 40,),
          ElevatedButton(onPressed: (){
            setvalues();
          }, child: const Text('Sign Up'))
        ],
      ),),
    );
  }
}