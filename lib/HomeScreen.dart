
import 'package:flutter/material.dart';
import 'package:project/SignUpScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  var Useremail = '';
  loadData()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    Useremail = sp.getString('email')?? '';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen'),
      automaticallyImplyLeading: false,),
      body: Center(child: Container(padding: EdgeInsets.all(15),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              loadData();
              setState(() {
                
              });
            }, child: Text('Get data')),
            SizedBox(height: 20,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Email'),
                Text(Useremail)
              ],
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: ()async{
              SharedPreferences sp = await SharedPreferences.getInstance();
              //sp.remove(key) remove men hum aik aik key batatay hen jo hum remove karna chahtay hen to sirf wo key value sharedpreference is remove hogi
              sp.clear();
             // Navigator.push(context, MaterialPageRoute(builder: (context)=>const ));
            }, child: const Text('Log Out'))
          ],
        ),
      ),),
    );
  }
}