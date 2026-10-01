import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(CupertinoIcons.heart, size: 100,),
          Text("Favourites")
        ],
      ),),
    );
  }
}