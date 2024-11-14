import 'package:flutter/material.dart';
import 'package:flutterfastfoofapp/data/product_list.dart';
import 'package:flutterfastfoofapp/methods/cart_bag_method.dart';
import 'package:flutterfastfoofapp/models/product_model.dart';
import 'package:flutterfastfoofapp/screens/category_screen.dart';

class CartBagScreen extends StatefulWidget {
  const CartBagScreen({super.key});

  @override
  State<CartBagScreen> createState() => _CartBagScreenState();
}

class _CartBagScreenState extends State<CartBagScreen> {
  /*onDelete start here*/
  void onDelete(ProductModel data){
    setState(() {
      if(cartBag.length==1) {
cartBag.clear();
      }
      else{
        cartBag.removeWhere((element) => element==data);
      }
    });
  }
  /*onDelete end here*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Screen',style: TextStyle(
          color: Colors.teal,
        ),),
        actions: [
          Text('Total ${cartBag.length} Items',style: TextStyle(
            color: Colors.black,
          ),),
        ],
      ),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          /*first portion start here*/
          Expanded(
            child:cartBag.isNotEmpty? ListView.separated(itemBuilder: (context,index){
              return Container(
                width: double.infinity,
                height: 100,
                color: Colors.grey.shade100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: 110,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.teal,
                          ),
                        ),
                        child: Image(image: AssetImage(cartBag[index].image),),),
                    Column(children: [
                      Text(cartBag[index].title,style:TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),),
                      Text(cartBag[index].subtitle,style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),),
                      Row(children: [
                        IconButton(onPressed:  (){
                          setState(() {
                            if(cartBag[index].quantity>=1){
                              cartBag[index].quantity++;
                            }
                            else{
                              cartBag[index].quantity==1;
                            }
                          });
                        }, icon: Icon(Icons.add_circle_outline,),),
                        Text(cartBag[index].quantity.toString()),
                        IconButton(onPressed: (){
                          setState(() {
                            if(cartBag[index].quantity>1){
                              cartBag[index].quantity--;
                            }
                            else{
                              cartBag[index].quantity==1;
                            }
                          });
                        }, icon: Icon(Icons.remove_circle_outline),),
                        SizedBox(width: 30,),
                        Text('\$${cartBag[index].price.toString()}',style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),),
                      ],),
                    ],),
                    IconButton(onPressed: (){
                      onDelete(cartBag[index]);
                    }, icon: Icon(Icons.clear,),),
                  ],
                ),
              );
            }, separatorBuilder: (context,index){
              return SizedBox(height: 10,);
            },
                itemCount:cartBag.length):Center(
                  child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                    Text('no Item added',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),),
              Text('Once you have added, come back:',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
              ),),
            ],),
                ),
          ),
       /*first portion end here*/
          Divider(),
          /*second portion start here*/
          Expanded(
            child: Column(children: [
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey.shade100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text('SubTotal'),
                    Text(calculateSubTotal().toString()),
                  ],),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Delivery Charges'),
                      Text(calculateDeliveryTotal().toString()),
                    ],),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total',style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                      Text(calculateTotal().toString()),
                    ],),
                ],
              ),
            ),
          ],),),
          /*second portion end here*/
          /*last portion start here*/
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:Colors.teal,
              minimumSize: Size(400, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: (){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) =>CategoryScreen(),),
              );
            }, child: Text('Check Out',style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),),),
          /*last portion end here*/
        ],
      ),
    ),
    );
  }
}
