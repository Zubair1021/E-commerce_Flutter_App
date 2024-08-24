import 'package:ecommerce_app_final/Pages/Categories_products.dart';
import 'package:flutter/material.dart';

import '../widget/Support_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List categories = [
    "images/headphone_icon.png",
    "images/laptop.png",
    "images/watch.png",
    "images/TV.png",
  ];

  List Categoryname = [
    "Headphones",
    "Laptop",
    "Watch",
    "TV"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hey, Zubair", style: Appwidget.boldTextFeildStyle()),
                      Text(
                        "Good Morning",
                        style: Appwidget.lightTextFeildStyle(),
                      ),
                    ],
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "images/boy.jpg",
                        height: 70,
                        width: 70,
                        fit: BoxFit.cover,
                      ))
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                child: ItemsSearchBox(),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: Appwidget.SemiBoldTextFeildStyleBlack(),
                  ),
                  Text(
                    "See all",
                    style: Appwidget.SemiBoldTextFeildStyleOrange(),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                      height: 130,
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                        color: const Color(0xFFfd6f3e),
                        borderRadius: BorderRadius.circular(10)),
                    // height: 90,
                    // width: 90,
                    child: const Center(child: Text("All",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),))
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 130,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: categories.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CategoriesTitle(image: categories[index],name: Categoryname[index]);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "All Products",
                    style: Appwidget.SemiBoldTextFeildStyleBlack(),
                  ),
                  Text(
                    "See all",
                    style: Appwidget.SemiBoldTextFeildStyleOrange(),
                  )
                ],
              ),
              const SizedBox(height: 20,),
              Container(
                margin: const EdgeInsets.only(bottom: 50, ),
                height: 250,

                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,

                  children: [
                     Container(
                       decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.circular(10)
                       ),
                       padding: const EdgeInsets.symmetric(horizontal: 20),
                       margin: const EdgeInsets.only(right: 50),
                       child: Column(
                         children: [
                           Image.asset("images/headphone2.png",height: 150,width: 150,fit: BoxFit.cover,),
                           Text("Headphone",style: Appwidget.SemiBoldTextFeildStyleBlack()),
                           const SizedBox(height: 15,),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                             const Text("\$100" , style: TextStyle(color: Color(0xFFfd6f3e),fontWeight: FontWeight.bold,fontSize: 22)),
                             const SizedBox(width:40),
                               Container(
                                 padding: const EdgeInsets.all(5),
                               decoration: BoxDecoration(color:const Color(0xFFfd6f3e),borderRadius: BorderRadius.circular(7) ),
                                 child: const Icon(Icons.add,color: Colors.white,))
                           ],)
                         ],
                       ),
                     ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      margin: const EdgeInsets.only(right: 50),
                      child: Column(
                        children: [
                          Image.asset("images/Watch2.png",height: 150,width: 150,fit: BoxFit.cover,),
                          Text("Apple Watch",style: Appwidget.SemiBoldTextFeildStyleBlack()),
                          const SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("\$300" , style: TextStyle(color: Color(0xFFfd6f3e),fontWeight: FontWeight.bold,fontSize: 22)),
                              const SizedBox(width:40),
                              Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(color:const Color(0xFFfd6f3e),borderRadius: BorderRadius.circular(7) ),
                                  child: const Icon(Icons.add,color: Colors.white,))
                            ],)
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      margin: const EdgeInsets.only(right: 50),
                      child: Column(
                        children: [
                          Image.asset("images/Laptop2.png",height: 150,width: 150,fit: BoxFit.cover,),
                          Text("Dell Laltop",style: Appwidget.SemiBoldTextFeildStyleBlack()),
                          const SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("\$800" , style: TextStyle(color: Color(0xFFfd6f3e),fontWeight: FontWeight.bold,fontSize: 22)),
                              const SizedBox(width:40),
                              Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(color:const Color(0xFFfd6f3e),borderRadius: BorderRadius.circular(7) ),
                                  child: const Icon(Icons.add,color: Colors.white,))
                            ],)
                        ],
                      ),
                    ),
                  ],
                ),
              ),





            ],
          ),
        ),
      ),
    );
  }

  //Search Box
  Widget ItemsSearchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: const TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
              size: 20,
            ),
            prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
            border: InputBorder.none,
            hintText: 'Search Item',
            hintStyle: TextStyle(color: Colors.grey)),
      ),
    );
  }
}

class CategoriesTitle extends StatelessWidget {
  String image,name;
  CategoriesTitle({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoriesProduct(category: name)));
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(right: 30),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        // height: 90,
        // width: 90,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(image, height: 50, width: 50, fit: BoxFit.cover),
            const Icon(Icons.arrow_forward)
          ],
        ),
      ),
    );
  }
}



