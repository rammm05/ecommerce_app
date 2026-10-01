import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductPageEcommerceApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ProductPageEcommerceAppState();
}

class _ProductPageEcommerceAppState extends State<ProductPageEcommerceApp>{

  int selectedColor = 0;

  int selectedQuantity = 1;
  int selectedBtn = 0; /// 0 -> desc , 1 -> specifications , 2 -> reviews

  ///info of desc or specifications or reviews
  Widget txtAboutBtn(){

    if(selectedBtn == 0){
      return Text(
        "Lorem ipsum dolor sit amet consectetur. Placerat in semper vitae a. Blandit amet purus eget sed vitae morbi tellus. Integer ornare. Purus risus urna sed fermentum. Neque dolor tempus egestas nunc volutpat ullamcorner aliquam velit",
        style: TextStyle(fontSize: 18),);

    } else if (selectedBtn == 1){
      return Text(
        "product mst chalega, raste ka maal saste me",
        style: TextStyle(fontSize: 18),);

    } else {
      return Text(
        "ek number product h",
        style: TextStyle(fontSize: 18),);
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                topCardWithBtns(),
                infoOfProduct()
              ],
            ),
          ),
        ),
        floatingActionButton: floatingActionBtn()
    );
  }


  ///...topCardWithBtns part 1
  Widget topCardWithBtns(){
    return Container(
      height: 330,
      margin: EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRx-lUnUAwDrwO6oO8LHOh8UzH4dPDdAsdG-d95U56eYA&s"), fit: BoxFit.cover),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: CircleAvatar(
              backgroundColor: Colors.white,
              maxRadius: 25,
              minRadius: 25,
              child: Icon(CupertinoIcons.back),
            ),
          ),
          Spacer(),
          CircleAvatar(
            backgroundColor: Colors.white,
            maxRadius: 25,
            minRadius: 25,
            child: Icon(Icons.share),
          ),
          SizedBox(width: 15,),
          CircleAvatar(
            backgroundColor: Colors.white,
            maxRadius: 25,
            minRadius: 25,
            child: Icon(Icons.favorite_outline),
          ),
        ],
      ),
    );
  }

  ///...all info of product part 2
  Widget infoOfProduct() {
    return Container(
      width: double.infinity,
      //color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          Text("Snadisk External SSD 1TB", style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold
          ),
            maxLines: 2, overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("\$199.00", style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.star, color: Colors.white, size: 15,),
                            Text("4.8", style: TextStyle(color: Colors.white),)
                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                      Text("(320 Review)",
                        style: TextStyle(color: Colors.black87),)

                    ],
                  )
                ],
              ),
              Text("Seller: Rammm2005",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),)
            ],
          ),
          SizedBox(height: 10,),
          Text("Color",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),


          Row(
            children: [
              InkWell(
                onTap: (){
                  selectedColor = 0;
                  setState(() {

                  });
                },
                child: Container(
                  margin: EdgeInsets.only(right: 15),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    border: selectedColor == 0 ? Border.all(width: 3, color: Colors.amber) : null,
                      borderRadius: BorderRadius.circular(30), color: Colors.red),
                ),
              ),
              InkWell(
                onTap: () {
                  selectedColor = 1;
                  setState(() {

                  });
                },
                child: Container(
                  margin: EdgeInsets.only(right: 15),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      border: selectedColor == 1 ? Border.all(width: 3, color: Colors.amber) : null,
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.black),
                ),
              ),
              InkWell(
                onTap: () {
                  selectedColor = 2;
                  setState(() {

                  });
                },
                child: Container(
                  margin: EdgeInsets.only(right: 15),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      border: selectedColor == 2 ? Border.all(width: 3, color: Colors.amber) : null,
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blue),
                ),
              ),
              InkWell(
                onTap: () {
                  selectedColor = 3;
                  setState(() {

                  });
                },
                child: Container(
                  margin: EdgeInsets.only(right: 15),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      border: selectedColor == 3 ? Border.all(width: 3, color: Colors.amber) : null,
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.brown),
                ),
              ),
              InkWell(
                onTap: () {
                  selectedColor = 4;
                  setState(() {

                  });
                },
                child: Container(
                  margin: EdgeInsets.only(right: 15),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      border: selectedColor == 4 ? Border.all(width: 3, color: Colors.amber) : null,
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey.shade400),
                ),
              ),
            ],
          ),


          SizedBox(height: 20,),
          SizedBox(
            height: 50,
            child: ListView(
              //shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                ElevatedButton(
                  onPressed: () {
                    selectedBtn = 0;
                    setState(() {

                    });
                  },
                  child: Text("Description",
                    style: TextStyle(color: selectedBtn == 0 ? Colors.white : Colors.black),),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: selectedBtn == 0 ? Colors.orange.shade900 : Colors.white),
                ),
                SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: () {
                    selectedBtn = 1;
                    setState(() {

                    });
                  },
                  child: Text("Specifications",
                    style: TextStyle(color: selectedBtn == 1 ? Colors.white : Colors.black),),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: selectedBtn == 1 ? Colors.orange.shade900 : Colors.white),
                ),
                SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: () {
                    selectedBtn = 2;
                    setState(() {

                    });
                  },
                  child: Text("Reviews",
                    style: TextStyle(color: selectedBtn == 2 ? Colors.white : Colors.black),),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: selectedBtn == 2 ? Colors.orange.shade900 : Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          txtAboutBtn(),
        ],
      ),
    );
  }

  ///...floating action btn part 3
  Widget floatingActionBtn(){
    return Container(
      padding: EdgeInsets.all(10),
      //margin: EdgeInsets.all(10),
      width: 380,
      decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(50)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              height: 40,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                children: [
                  InkWell(
                      onTap: (){
                        if(selectedQuantity>1){
                          selectedQuantity--;
                        }
                        setState(() {

                        });
                      },
                      child: Icon(CupertinoIcons.add, color: Colors.white, size: 20,)),
                  Spacer(),
                  Text("$selectedQuantity", style: TextStyle(color: Colors.white,)),
                  Spacer(),
                  InkWell(
                      onTap: (){
                        selectedQuantity++;
                        setState(() {

                        });
                      },
                      child: Icon(CupertinoIcons.minus, color: Colors.white, size: 20,)),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              margin: EdgeInsets.only(left: 30),
              height: 50,
              child: ElevatedButton(
                onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("not added to cart")));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade900,
                ),
                child: Text("Add to Cart", style: TextStyle(color: Colors.white,)),),
            ),
          ),
        ],
      ),
    );
  }

}