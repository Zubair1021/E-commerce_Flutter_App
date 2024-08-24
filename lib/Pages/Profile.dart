import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Admin/Add_products.dart';
import '../widget/Support_widget.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
          child: Column(
            children:[
              Container( margin: EdgeInsets.only(top: 20),child: Text("User Profile",style: Appwidget.SemiBoldTextFeildStyleBlack(),)),
              SizedBox(height: 50,),
              Text("If you want to sell any product you can do this..",style: Appwidget.lightTextFeildStyle(),),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Addproducts()));
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 30,left: 15,right: 15),
                  padding: EdgeInsets.symmetric(vertical:10 ),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color(0xFFfd6f3e),
                      borderRadius: BorderRadius.circular(10)

                  ),
                  child: Center(child: Text("Add Sell Product",style: TextStyle(color: Colors.white,fontSize: 20, fontWeight:FontWeight.bold),)),
                ),
              ),
            ],
          ),
      )
    );
  }
}
