
import 'package:flutter/material.dart';
import 'package:project/AdminScreen.dart';
import 'package:project/SignUpScreen.dart';
import 'package:project/StudentScreen.dart';
import 'package:project/TeacherScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String useremail = '';
  
  login()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    String Email = sp.getString('email')!;
    if(Email == emailController.text){
      sp.setBool('isLogin', true);
      String type = sp.getString('userType')!;
      if(type=='student'){

        Navigator.push(context, MaterialPageRoute(builder: (context)=>const StudentScreen()));
      }
      else if(type =='teacher'){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const TeacherScreen()));
    } 
    else{
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const AdminScreen()));
    }}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Screen'),),
      body: Container(padding: EdgeInsets.all(20),
        child: Column(
        children: [
          TextField(controller: emailController,
          decoration: const InputDecoration(hintText: 'email'),),
          SizedBox(height: 20,),
          TextField(controller: passwordController,
          decoration: const InputDecoration(hintText: 'password'),),
          
          SizedBox(height: 40,),
          ElevatedButton(onPressed: (){
            login();
          }, child: const Text('Log In')),
          SizedBox(height: 20,),
          Row(children: [
            Text('Donot have account?'),
            SizedBox(width: 10,),
            ElevatedButton(onPressed: (){
              Navigator.push(context, (MaterialPageRoute(builder: (context)=>const SignUp())));
            }, child: Text('Sign Up'))
          ],)
        ],
      ),),
    );
  }
}