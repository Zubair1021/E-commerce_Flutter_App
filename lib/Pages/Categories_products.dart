import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app_final/Admin/Add_products.dart';
import 'package:ecommerce_app_final/services/Database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/Support_widget.dart';
import 'Product Detail.dart';

class CategoriesProduct extends StatefulWidget {
   String category;
    CategoriesProduct({required this.category});

  @override
  State<CategoriesProduct> createState() => _CategoriesProductState();
}

class _CategoriesProductState extends State<CategoriesProduct> {
   Stream? CategoryStream;

   getontheload() async{
     CategoryStream = await DatabaseMethods().getProducts(widget.category);
     setState(() {

     });
   }

   @override
  void initState() {
   getontheload();
  }


   Widget allproducts(){
     return StreamBuilder(stream: CategoryStream, builder: (context,AsyncSnapshot snapshot ){
        return snapshot.hasData? GridView.builder(

          padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 , childAspectRatio: 0.6 , mainAxisSpacing: 10 , crossAxisSpacing: 10),itemCount: snapshot.data.docs.length,
            itemBuilder: (context,index){
            DocumentSnapshot ds = snapshot.data.docs[index];
            return Container(
              height: 80,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.only(right: 50),
              child: Column(
                children: [
                  Image.network(ds["Image"],height: 100,width: 100,fit: BoxFit.cover,),
                  Text(ds["Name"],style: Appwidget.SemiBoldTextFeildStyleBlack()),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text("\$"+ds["Price"] , style: TextStyle(color: Color(0xFFfd6f3e),fontWeight: FontWeight.bold,fontSize: 22)),
                      const SizedBox(width:40),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetail(detail: ds["Product Detail"], image: ds["Image"], price: ds["Price"],name: ds["Name"],)));
                        },
                        child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(color:const Color(0xFFfd6f3e),borderRadius: BorderRadius.circular(7) ),
                            child: const Icon(Icons.add,color: Colors.white,)),
                      )
                    ],)
                ],
              ),
            );
            }):Container();
     });
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      appBar: AppBar(
        backgroundColor: Color(0xfff2f2f2),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(  child: allproducts())
          ],
        ),
      ),
    );
  }
}
