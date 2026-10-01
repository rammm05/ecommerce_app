import 'package:ecommerce_ui/screens/dashboard_bottom_nav/bottom_navigation_pages/cart_page_ecommerce_app.dart';
import 'package:ecommerce_ui/screens/dashboard_bottom_nav/bottom_navigation_pages/category_page.dart';
import 'package:ecommerce_ui/screens/dashboard_bottom_nav/bottom_navigation_pages/favourite_page.dart';
import 'package:ecommerce_ui/screens/dashboard_bottom_nav/bottom_navigation_pages/home_page_ecommerce_app.dart';
import 'package:ecommerce_ui/screens/dashboard_bottom_nav/bottom_navigation_pages/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>{

  int selectedPage = 2;

  List<Widget> mPages = [
    CategoryPage(),
    FavouritePage(),
    HomePageEcommerceApp(),
    CartPageEcommerceApp(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mPages[selectedPage],
      bottomNavigationBar: NavigationBar(

        destinations: [
          NavigationDestination(
            selectedIcon: Icon(CupertinoIcons.square_grid_2x2_fill, color: Colors.deepOrange,),
              icon: Icon(CupertinoIcons.square_grid_2x2),
              label: "Category"
          ),
          NavigationDestination(
              selectedIcon: Icon(CupertinoIcons.heart_fill, color: Colors.deepOrange,),
              icon: Icon(CupertinoIcons.heart),
              label: "Favourite"
          ),
          NavigationDestination(
              selectedIcon: Icon(Icons.home, color: Colors.deepOrange,),
              icon: Icon(Icons.home_outlined),
              label: "Home"
          ),
          NavigationDestination(
              selectedIcon: Icon(CupertinoIcons.cart_fill, color: Colors.deepOrange,),
              icon: Icon(CupertinoIcons.cart),
              label: "Cart"
          ),
          NavigationDestination(
              selectedIcon: Icon(Icons.account_circle, color: Colors.deepOrange,),
              icon: Icon(Icons.account_circle_outlined),
              label: "Profile Page"
          )
        ],

        selectedIndex: selectedPage,
        indicatorColor: Colors.deepOrange.shade100,
        onDestinationSelected: (value){
          selectedPage = value;
          setState(() {

          });
        },
      ),

    );
  }
}