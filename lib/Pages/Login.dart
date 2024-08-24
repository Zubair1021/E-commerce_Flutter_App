import 'package:ecommerce_app_final/widget/Support_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Bottom Navigation.dart';
import 'Sign Up.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {

  String email="";
  String password="";

  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  UserLogin() async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.redAccent ,
          content: Text("Login Successfully",style: TextStyle(fontSize: 20),)));
      Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNav()));
    } on FirebaseException catch(e){
      if(e.code=='user-not-found'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent ,
            content: Text("No User Found for that Email",style: TextStyle(fontSize: 20),)));
      }
      else if(e.code=='wrong-password'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent ,
            content: Text("Wrong Password Provided",style: TextStyle(fontSize: 20),)));
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
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Center(child: Image.asset("images/login.jpeg",height: 300,)),
                Center(child: Text("Sign In" , style: Appwidget.boldTextFeildStyle(),)),
                SizedBox(height: 10,),
                Center(child: Text("Please enter the details below to continue." , style: Appwidget.lightTextFeildStyle(),)),
                SizedBox(height: 20,),
                Container(margin:EdgeInsets.only(left: 20),
                  child: Text("Email" , style: Appwidget.SemiBoldTextFeildStyleBlack(),)),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.only(left: 15,right: 15),
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(color: Color(0xFFF4F5F9),borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      controller: emailcontroller,
                      validator: (value){
                        if(value==null|| value.isEmpty)
                          return 'Please enter your Email';
                        else
                          return null;
                      },
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
                      controller: passwordcontroller,
                      validator: (value){
                        if(value==null|| value.isEmpty)
                          return 'Please enter your Password';
                        else
                          return null;
                      },
                      decoration: InputDecoration(border:InputBorder.none,hintText: "Password"),
                    )),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container( margin: EdgeInsets.only(right: 20),child: Text("Forget Password",style: TextStyle(color: Colors.purple,fontSize: 14),)),
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    if(_formkey.currentState!.validate()){
                      setState(() {
                        email=emailcontroller.text;
                        password=passwordcontroller.text;
                      });
                    }
                    UserLogin();
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? ",style: Appwidget.lightTextFeildStyle(),),
                    GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Signuppage()));
                        },
                        child: Text("Sign Up",style: TextStyle(color: Colors.purple,fontSize: 14),)),
            
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
