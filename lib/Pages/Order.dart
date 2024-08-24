import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/Support_widget.dart';
import 'Bottom Navigation.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container( margin: EdgeInsets.only(top: 20),child: Text("Your Orders",style: Appwidget.SemiBoldTextFeildStyleBlack(),)),
            SizedBox(height: 50,),
            Text("Nothing in your Carts..",style: Appwidget.lightTextFeildStyle(),),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNav()));
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 30,left: 15,right: 15),
                padding: EdgeInsets.symmetric(vertical:10 ),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xFFfd6f3e),
                    borderRadius: BorderRadius.circular(10)

                ),
                child: Center(child: Text("Buy Products",style: TextStyle(color: Colors.white,fontSize: 20, fontWeight:FontWeight.bold),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
