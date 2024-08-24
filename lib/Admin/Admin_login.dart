import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/Support_widget.dart';
import 'Home_Admin.dart';

class Adminlogin extends StatefulWidget {
  const Adminlogin({super.key});

  @override
  State<Adminlogin> createState() => _AdminloginState();
}

class _AdminloginState extends State<Adminlogin> {
  TextEditingController usernamecontroller = new TextEditingController();
  TextEditingController userpasswordcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(

        child: Container(
          margin: EdgeInsets.only(top: 10,bottom: 30),
          child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.asset("images/login.jpeg",height: 300,)),
                Center(child: Text("Admin Pannel" , style: Appwidget.boldTextFeildStyle(),)),
                SizedBox(height: 20,),
                Container(margin:EdgeInsets.only(left: 20),
                    child: Text("Username" , style: Appwidget.SemiBoldTextFeildStyleBlack(),)),
                SizedBox(height: 10,),
                Container(
                    margin: EdgeInsets.only(left: 15,right: 15),
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(color: Color(0xFFF4F5F9),borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      controller: usernamecontroller,
                      decoration: InputDecoration(border:InputBorder.none,hintText: "Username"),
                    )),
                SizedBox(height: 20,),
                Container(margin:EdgeInsets.only(left: 20),
                    child: Text("Password" , style: Appwidget.SemiBoldTextFeildStyleBlack(),)),
                SizedBox(height: 10,),
                Container(
                    margin: EdgeInsets.only(left: 15,right: 15),
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(color: Color(0xFFF4F5F9),borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      obscureText: true,
                      controller: userpasswordcontroller,
                      decoration: InputDecoration(border:InputBorder.none,hintText: "Password"),
                    )),
                SizedBox(height: 5,),
                GestureDetector(
                  onTap: (){
                    LoginAdmin();
                  },
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20,top: 30),
                      width: 200,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(child: Text("LOGIN",style: TextStyle(color: Colors.white,fontSize: 18, fontWeight:FontWeight.bold),)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
  LoginAdmin(){
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot){
      snapshot.docs.forEach((result){
      if(result.data()['username']!=usernamecontroller.text.trim()){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent ,
            content: Text("Your ID is not correct",style: TextStyle(fontSize: 20),)));
      }
      else if(result.data()['password']!=userpasswordcontroller.text.trim() ){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent ,
            content: Text("Your Password is not correct",style: TextStyle(fontSize: 20),)));
      }
      else{
        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeAdmin()));
      }
      });
    });
  }
}
