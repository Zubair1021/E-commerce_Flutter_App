import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'Home Page.dart';
import 'Order.dart';
import 'Profile.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {

  late List<Widget> pages;
  late HomePage Home;
  late Order order;
  late Profile profile;
  int currentTabIndex=0;

  @override
  void initState() {
    Home = const HomePage();
    order=const Order();
    profile=const Profile();
    pages=[Home,order,profile];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: const Color(0xfff2f2f2),
        color: Colors.black,
        animationDuration: const Duration(milliseconds: 500),
        onTap: (int index){
          setState(() {
            currentTabIndex=index;
          });
        },
        items: const [
        Icon(Icons.home_outlined,color: Colors.white,),
        Icon(Icons.shopping_bag,color: Colors.white,),
        Icon(Icons.person_outlined,color: Colors.white,),
      ],),
      body: pages[currentTabIndex],
    );
  }
}
