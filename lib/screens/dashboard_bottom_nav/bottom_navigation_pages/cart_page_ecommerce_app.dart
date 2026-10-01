import 'package:ecommerce_ui/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartPageEcommerceApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(height: 30,),
            titleMyCart(context),
            SizedBox(height: 30,),
            listOfSelectedItems(),
            totalAndCheckout()
          ],
        ),
      ),
    );
  }

  ///...titleMyCart part 1
  Widget titleMyCart(BuildContext context){
    return Row(
      children: [
        CircleAvatar(
          minRadius: 25,
          maxRadius: 25,
          backgroundColor: Colors.white,
          child: InkWell(
              onTap: (){
                Navigator.pushNamed(context, AppRoutes.DASHBOARD_BOTTOM_NAV_PAGE);
              },
              child: Icon(CupertinoIcons.back)),
        ),
        Expanded(child: Center(child: Text("My Cart", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)))
      ],
    );
  }

  ///...listOfSelectedItems part 2
  Widget listOfSelectedItems(){
    return Expanded(
      flex: 3,
      child: ListView.builder(
        //shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context, index){
            return Container(
              height: 120,
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                        image: DecorationImage(image: NetworkImage("https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcR7OCQ5SNMDG3PZ_NgAi5RW7YKckjS5xRGXxQRvCEjnCmHFGdOZ7vc5Zz3GKDzvBNPl1GriOwKT"))

                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("SanDisk luxe", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),),
                            Icon(CupertinoIcons.delete, color: Colors.red,)
                          ],
                        ),
                        Text("Electronics", style: TextStyle(color: Colors.black87),),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("\$20.00", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                            Container(
                              height: 30,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey.shade300
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(CupertinoIcons.minus, size: 15,),
                                  Text("1", style: TextStyle(fontSize: 15),),
                                  Icon(CupertinoIcons.add, size: 15,),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  ///...totalAndCheckout part 3
  Widget totalAndCheckout(){
    return Expanded(
      flex: 2,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            border: Border.all(),
            color: Colors.white
        ),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  hint: Text("Enter Discount Code", style: TextStyle(fontSize: 20),),
                  suffix: Text("Apply", style: TextStyle(color: Colors.orange.shade900, fontSize: 20, fontWeight: FontWeight.bold),),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Subtotal", style: TextStyle(fontSize: 20),),
                Text("\$245.00", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

              ],
            ),
            Divider(),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                Text("\$245.00", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

              ],
            ),
            Spacer(),
            SizedBox(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(onPressed: (){}, child: Text("Checkout", style: TextStyle(fontSize: 25, color: Colors.white),),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade900),
                ))
          ],
        ),
      ),
    );
  }
}