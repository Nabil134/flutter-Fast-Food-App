import 'package:flutter/material.dart';
import 'package:flutterfastfoofapp/data/product_list.dart';
import 'package:flutterfastfoofapp/screens/category_screen.dart';

import '../models/product_model.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  /*onDelete start here*/
  void onDelete(ProductModel data){
    setState(() {
      if(favouriteBag.length==1) {
        favouriteBag.clear();
      }
      else{
        favouriteBag.removeWhere((element) => element==data);
      }
    });
  }
  /*onDelete end here*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Whistlist Screen',
          style: TextStyle(
            color: Colors.teal,
            fontWeight:FontWeight.bold,
          ),
        ),
      ),
  body: Column(children: [
    /*first portion start here*/
    Expanded(
      child:favouriteBag.isNotEmpty? ListView.separated(itemBuilder: (context,index){
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
                child: Image(image: AssetImage(favouriteBag[index].image),),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(favouriteBag[index].title,style:TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),),
                Text(favouriteBag[index].subtitle,style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),),
                Row(children: [


                  SizedBox(width: 30,),
                  Text('\$${favouriteBag[index].price.toString()}',style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),),
                ],),
              ],),
              IconButton(onPressed: (){
onDelete(favouriteBag[index]);
              }, icon: Icon(Icons.favorite,color: Colors.red,),),
            ],
          ),
        );
      }, separatorBuilder: (context,index){
        return SizedBox(height: 10,);
      },
          itemCount:favouriteBag.length):Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your Favourite List Is Empty',style: TextStyle(
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
  ],),
    );
  }
}
