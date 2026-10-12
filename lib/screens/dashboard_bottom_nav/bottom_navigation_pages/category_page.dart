import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget{

  List<String> productCat = [
    "For you",
    "Mobile",
    "Electronics",
    "Fashion",
    "Sports & fitness",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.square_grid_2x2,size: 30,),
                    SizedBox(width: 7,),
                    Text("Categories", style: TextStyle(fontSize: 20),)
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: ListView(
                        shrinkWrap: true,
                        children: List.generate(productCat.length, (index){
                          return Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.lightBlueAccent,
                              borderRadius: BorderRadius.circular(10),

                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                                child: Text(productCat[index])),
                          );
                        }),

                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}