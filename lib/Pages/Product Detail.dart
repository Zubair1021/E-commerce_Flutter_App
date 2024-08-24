import 'package:ecommerce_app_final/widget/Support_widget.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  String image,name,detail,price;
  ProductDetail({required this.image,required this.name,required this.price,required this.detail});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfef5f1),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 20,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                  Container(
                    margin:const  EdgeInsets.only(left: 20),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(30)),
                      child:  GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                          child: Icon(Icons.arrow_back_ios_new_outlined))),
                Center(
                    child: Image.network(
                  widget.image,
                  height: 350,
                ))
              ]),
                Container(
                  padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                  ),

                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.name,style: Appwidget.boldTextFeildStyle(),),
                          Text(
                            "\$"+widget.price,
                            style: Appwidget.BoldTextFeildStyleOrange(),
                          )
                        ],
                      ),
                      SizedBox(height: 20,),
                      Text("Detail",style: Appwidget.SemiBoldTextFeildStyleBlack(),),
                      SizedBox(height: 10,),
                      Text(widget.detail),
                      SizedBox(height: 30,),
                      Container(
                        margin: EdgeInsets.only(bottom: 30),
                        padding: EdgeInsets.symmetric(vertical:10 ),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color(0xFFfd6f3e),
                          borderRadius: BorderRadius.circular(10)

                        ),
                        child: Center(child: Text("Buy Now",style: TextStyle(color: Colors.white,fontSize: 20, fontWeight:FontWeight.bold),)),
                      )

                    ],
                  ),
                ),

            ],
          ),
        ),
      ),
    );
  }
}
