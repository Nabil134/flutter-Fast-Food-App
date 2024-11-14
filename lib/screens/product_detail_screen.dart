import 'package:flutter/material.dart';
import 'package:flutterfastfoofapp/data/product_list.dart';
import 'package:flutterfastfoofapp/methods/cart_bag_method.dart';
import 'package:flutterfastfoofapp/methods/favourite_bag_method.dart';
import 'package:flutterfastfoofapp/models/product_model.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key,required this.product});
  final ProductModel product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool isFavorite=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isFavorite=favouriteBag.contains(widget.product);
  }
  /*toggleFavorite start here*/
  toggleFavorite(){
    setState(() {
      if(isFavorite){
        favouriteBag.remove(widget.product);
      }
      else{
        FavouriteBagMethod().addToFavourite(context, widget.product);
      }
      isFavorite=!isFavorite;
    });
  }
  /*toggleFavorite end here*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              /*first portion start here*/
              Container(
                alignment: Alignment.topLeft,
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.product.image),
                  ),
                ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back_ios),),
              IconButton(onPressed: (){
                toggleFavorite();
              }, icon: Icon(isFavorite?Icons.favorite:Icons.favorite_border_outlined,color:isFavorite? Colors.red:Colors.black),),
            ],),
              ),
       /*first portion end here*/
                SizedBox(height: 10,),
              /*second portion start here*/
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.product.title,style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),),
                      Text('\$${widget.product.price.toString()}',style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),),
                    ],
                  ),
                  Text(widget.product.description,style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),),
                ],),
              ),
              /*second portion end here*/
                /*last portion start here*/
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    minimumSize: Size(400,60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: (){
                    CartBagMethod().addToCart(context, widget.product);
                    print(widget.product.price);
                  }, child: Text('Cart View',style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),),
                /*last portion end here*/
            ],),
          ),
        ),),
      ),
    );
  }
}
