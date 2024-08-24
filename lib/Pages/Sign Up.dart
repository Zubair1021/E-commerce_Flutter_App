import 'package:ecommerce_app_final/Pages/Login.dart';
import 'package:ecommerce_app_final/services/Database.dart';
import 'package:ecommerce_app_final/services/Shared_pref.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

import '../widget/Support_widget.dart';
import 'Bottom Navigation.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
   String? name, email ,password;
   TextEditingController namecontroller = new TextEditingController();
   TextEditingController emailcontroller = new TextEditingController();
   TextEditingController passwordcontroller = new TextEditingController();

   final _formkey = GlobalKey<FormState>();

   registration() async{
      if(password!=null && name!=null && email!=null){
        try{
          UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email!, password: password!);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.redAccent ,
              content: Text("Registered Successfully",style: TextStyle(fontSize: 20),)));
          String Id = randomAlphaNumeric(10);
          await SharedPreferenceHelper().saveUserEmail(emailcontroller.text);
          await SharedPreferenceHelper().saveUserId(Id);
          await SharedPreferenceHelper().saveUserName(namecontroller.text);
          await SharedPreferenceHelper().saveUserImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQATpvYXdKwqUk4jgyMT2sBSG0cAev1x3aIpNlATtpj2-UW2OuAQMp_-7uWxsNoj3Zf0CM&usqp=CAU");
          Map<String,dynamic> userInfoMap={
            "Name": namecontroller.text,
            "Email": emailcontroller.text,
            "Id": Id,
            "Image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQATpvYXdKwqUk4jgyMT2sBSG0cAev1x3aIpNlATtpj2-UW2OuAQMp_-7uWxsNoj3Zf0CM&usqp=CAU",
          };
          await DatabaseMethods().addUserDetails(userInfoMap, Id);
          Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNav()));
        } on FirebaseException catch(e){
          if(e.code=='weak-password'){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.redAccent ,
                content: Text("Password Provided is too Weak",style: TextStyle(fontSize: 20),)));
          }
          else if(e.code=='email-already-in-use'){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.redAccent ,
                content: Text("Account Already exists",style: TextStyle(fontSize: 20),)));
          }
        }
      }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(

        child: Container(
          margin: EdgeInsets.only(top: 10,bottom: 30),
          child: Form(
            key:_formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.asset("images/login.jpeg",height: 300,)),
                Center(child: Text("Sign Up" , style: Appwidget.boldTextFeildStyle(),)),
                SizedBox(height: 10,),
                Center(child: Text("Please enter the details below to continue." , style: Appwidget.lightTextFeildStyle(),)),
                SizedBox(height: 20,),
                Container(margin:EdgeInsets.only(left: 20),
                    child: Text("Name" , style: Appwidget.SemiBoldTextFeildStyleBlack(),)),
                SizedBox(height: 10,),
                Container(
                    margin: EdgeInsets.only(left: 15,right: 15),
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(color: Color(0xFFF4F5F9),borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      validator: (value){
                        if(value==null|| value.isEmpty)
                          return 'Please enter your Name';
                        else
                          return null;
                      },
                      controller: namecontroller,
                      decoration: InputDecoration(border:InputBorder.none,hintText: "Name"),
                    )),
                SizedBox(height: 20,),
                Container(margin:EdgeInsets.only(left: 20),
                    child: Text("Email" , style: Appwidget.SemiBoldTextFeildStyleBlack(),)),
                SizedBox(height: 10,),
                Container(
                    margin: EdgeInsets.only(left: 15,right: 15),
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(color: Color(0xFFF4F5F9),borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      validator: (value){
                        if(value==null|| value.isEmpty)
                          return 'Please enter your Email';
                        else
                          return null;
                      },
                      controller: emailcontroller,
                      decoration: InputDecoration(border:InputBorder.none,hintText: "Email"),
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
                      validator: (value){
                        if(value==null|| value.isEmpty)
                          return 'Please enter your Password';
                        else
                          return null;
                      },
                      controller: passwordcontroller,
                      decoration: InputDecoration(border:InputBorder.none,hintText: "Password"),
                    )),
                SizedBox(height: 5,),
                GestureDetector(
                  onTap: (){
                    if(_formkey.currentState!.validate()){
                      setState(() {
                        name=namecontroller.text;
                        email=emailcontroller.text;
                        password=passwordcontroller.text;
                      });
                    }
                    registration();
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
                      child: Center(child: Text("SIGN UP",style: TextStyle(color: Colors.white,fontSize: 18, fontWeight:FontWeight.bold),)),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
            
                    Text("Already have an account? ",style: Appwidget.lightTextFeildStyle(),),
                    GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> loginpage()));
                        },
                        child: Text("Sign In",style: TextStyle(color: Colors.purple,fontSize: 14),)),
            
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
