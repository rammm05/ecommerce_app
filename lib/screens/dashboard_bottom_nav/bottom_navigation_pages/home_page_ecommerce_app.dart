import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageEcommerceApp extends StatelessWidget{

  bool isTapSearch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    minRadius: 25,
                    maxRadius: 25,
                    backgroundColor: Colors.grey.shade200,
                    child: Icon(Icons.grid_view_rounded,
                        color: Colors.black54
                    ),
                  ),
                  CircleAvatar(
                    minRadius: 25,
                    maxRadius: 25,
                    backgroundColor: Colors.grey.shade200,
                    child: Icon(CupertinoIcons.bell,
                        color: Colors.black54
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              StatefulBuilder(
                builder: (context, ss) {
                  return TextField(
                    onTap: (){
                      isTapSearch = true;
                      ss((){});
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none),
                        hint: isTapSearch
                            ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(""),
                            Spacer(),
                            Container(
                              color: Colors.black,
                              height: 20,
                              width: 1,
                            ),
                            SizedBox(width: 15,),
                            Icon(CupertinoIcons.arrow_right_arrow_left_square)
                          ],
                        )
                            : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(CupertinoIcons.search),
                            SizedBox(width: 15,),
                            Text("Search..."),
                            Spacer(),
                            Container(
                              color: Colors.black,
                              height: 20,
                              width: 1,
                            ),
                            SizedBox(width: 15,),
                            Icon(CupertinoIcons.arrow_right_arrow_left_square)
                          ],
                        )
                    ),
                  );
                }
              ),
              SizedBox(height: 15,),
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(image: NetworkImage("https://i0.wp.com/360rumors.com/wp-content/uploads/2020/12/insta360holiday.jpg?resize=1024%2C402&ssl=1"), fit: BoxFit.fill)
                ),
              ),
              SizedBox(height: 25,),
              //listview
              Container(
                height: 130,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 13,
                    itemBuilder: (context, index){
                      return Container(
                        margin: EdgeInsets.only(right: 20),
                        width: 60,
                        //color: Colors.grey,
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  image: DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaZ3eQC8Rcs4I8zrwjlDSotZLzf-qNgxS6ZUrTZiEDtg&s"), fit: BoxFit.cover,)
                              ),
                            ),
                            Text("Insta 360 x4", style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500
                            ),maxLines: 3, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,)
                          ],
                        ),
                      );
                    }),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Special For You", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  Text("See all"),
                ],
              ),
              //SizedBox(height: 10,),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                  itemCount: 5,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 5/6,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context , index){
                    return Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey)
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                image: DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRx-lUnUAwDrwO6oO8LHOh8UzH4dPDdAsdG-d95U56eYA&s"), fit: BoxFit.cover),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomLeft: Radius.circular(10))

                                    ),
                                    child: Icon(CupertinoIcons.heart, color: Colors.white,),
                                  )
                                ],
                              ),

                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                                //color: Colors.red,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Snadisk External SSD 1TB",
                                    maxLines: 2,overflow: TextOverflow.ellipsis,
                                  ),
                                  Row(
                                    children: [
                                      Text("\$120.00", style: TextStyle(fontWeight: FontWeight.bold),),
                                      Spacer(),
                                      Icon(Icons.circle, color: Colors.black, size: 18,),
                                      Icon(Icons.circle, color: Colors.blue, size: 18,),
                                      Icon(Icons.circle, color: Colors.orange, size: 18,),
                                      Icon(Icons.circle, color: Colors.white, size: 18,),
                                    ],
                                  )

                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  })
        
            ],
          ),
        ),
      ),
    );
  }
}