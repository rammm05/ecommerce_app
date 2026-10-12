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

      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          onPressed: (){
            selectedPage = 2;
            setState(() {

            });
          },
          child: Icon(Icons.home_outlined , color: Colors.white,),
          backgroundColor: Colors.deepOrange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100)
          ),),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        height: 70,
        elevation: 11,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  selectedPage = 0;
                  setState(() {

                  });
                },
                icon: Icon(CupertinoIcons.square_grid_2x2, color: selectedPage==0? Colors.deepOrange : null)),
            IconButton(
                onPressed: () {
                  selectedPage = 1;
                  setState(() {

                  });
                },
                icon: Icon(CupertinoIcons.heart, color: selectedPage==1? Colors.deepOrange : null)),

            SizedBox(width: 30,),
            IconButton(onPressed: () {
              selectedPage = 3;
              setState(() {

              });
            },
                icon: Icon(CupertinoIcons.cart, color: selectedPage==3? Colors.deepOrange : null)),
            IconButton(
                onPressed: () {
                  selectedPage = 4;
                  setState(() {

                  });
                },
                icon: Icon(Icons.account_circle_outlined, color: selectedPage==4? Colors.deepOrange : null)),
          ],
        ),
      ),

      /*NavigationBar(

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
      ),*/


    );
  }
}