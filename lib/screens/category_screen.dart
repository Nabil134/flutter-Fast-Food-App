import 'package:flutter/material.dart';
import 'package:flutterfastfoofapp/data/product_list.dart';
import 'package:flutterfastfoofapp/models/product_model.dart';
import 'package:flutterfastfoofapp/screens/cart_bag_screen.dart';
import 'package:flutterfastfoofapp/screens/favourite_screen.dart';
import 'package:flutterfastfoofapp/screens/product_detail_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String searchText='';
  int categoryIndex=0;
 late List<ProductModel> filterProduct;
 @override
 void initState() {
    // TODO: implement initState
    super.initState();
    filterProduct=categorizeList();
  }

  /*_filteredProducts method start here*/
  void _filterProducts(String value) {
    setState(() {
      searchText = value.toLowerCase();
      filterProduct = categorizeList()
          .where((product) => product.title.toLowerCase().contains(searchText))
          .toList();
    });
  }
  /*_filteredProducts end here*/
  /*categoriesList() start here*/
  List<ProductModel> categorizeList(){
    switch(categoryIndex){
      case 0: return burgerList;
      case 1: return iceCreamList;
      case 2: return pizzaList;
      default:return [];
    }

  }
/*categoriesList() end here*/
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Home Screen',style: TextStyle(
          color: Colors.teal,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
    actions: [
      Stack(children: [
        Padding(
          padding: const EdgeInsets.only(top: 15) ,
          child: IconButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartBagScreen(),
              ),
            );

            setState(() {
            });
          }, icon:const Icon(Icons.shopping_bag_outlined,color: Colors.black,size: 28,),),
        ),
        Positioned(
          right: 6,
          top: 20,
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.amber,
            ),
            child: Center(child: Text(cartBag.length.toString(),style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),),
          ),
        ),
      ],),
      Stack(children: [
        Padding(
          padding: const EdgeInsets.only(top: 15) ,
          child: IconButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FavouriteScreen(),
              ),
            );

            setState(() {
            });
          }, icon:const Icon(Icons.favorite_border_outlined,color: Colors.black,size: 28,),),
        ),
        Positioned(
          right: 6,
          top: 20,
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.amber,
            ),
            child: Center(child: Text(favouriteBag.length.toString(),style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),),
          ),
        ),
      ],),
    ],
      ),
   body: Padding(
     padding: const EdgeInsets.all(8.0),
     child: SingleChildScrollView(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           /*first portion start here*/
           TextFormField(
             decoration: InputDecoration(
               hintText: "Search",
               prefixIcon: Icon(Icons.search),
             ),
        onChanged: _filterProducts,
           ),
           /*first portion end here*/
           SizedBox(height: 10,),
           /*second portion start here*/
            Text('Category',style: TextStyle(
             color: Colors.teal,
             fontWeight: FontWeight.bold,
             fontSize: 25,
           ),),
           /*second portion end here*/
           SizedBox(height: 10,),
           /*third portion start here*/
           SizedBox(
             height: 70,
               child: ListView.separated(
                 scrollDirection: Axis.horizontal,
                   itemBuilder: (context,index){
                 return InkWell(
                   onTap: (){
                     setState(() {
                       categoryIndex=index;
                       filterProduct=categorizeList();
                     });
                   },
                   child: Container(
                     height: 70,
                     width: 160,
                     decoration: BoxDecoration(
                       border: Border.all(color: Colors.grey.shade400),
                       borderRadius: BorderRadius.circular(10),
                       color:categoryIndex==index?Colors.teal: Colors.grey.shade100,
                     ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    Image.asset(categorys[index].image,height:60),
                    Text(categorys[index].title,style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: categoryIndex==index?Colors.white:Colors.grey,
                    ),),
                ],),
                   ),
                 );
               }, separatorBuilder: (context,index)=>SizedBox(width: 10,), itemCount:categorys.length),),
           /*third portion end here*/
          SizedBox(height: 10,),
           /*four portion start here*/
           Text('Category',style: TextStyle(
             color: Colors.teal,
             fontWeight: FontWeight.bold,
             fontSize: 25,
           ),),
           /*four portion end here*/
           SizedBox(height: 10,),
           /*last portion start here*/
           SizedBox(
             height: MediaQuery.of(context).size.height*0.4,
             child: ListView.separated(
               scrollDirection: Axis.horizontal,
                 itemBuilder: (context,index){

               return Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: InkWell(
                   onTap: (){
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => ProductDetailScreen(
                         product: filterProduct[index],
                       ),),
                     );
                   },
                   child: Container(
                     width: 160,
                     height: 250,
                     padding:EdgeInsets.all(8),
                     decoration: BoxDecoration(
                       border: Border.all(
                         color: Colors.teal,
                       ),
borderRadius: BorderRadius.circular(10),
                       color: Colors.grey.shade100,
                     ),
              child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    Image.asset(filterProduct[index].image,height: 120,),
                    Text(filterProduct[index].title,style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),),
                    Text(filterProduct[index].subtitle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text("Price",style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),),
                      Text("\$${filterProduct[index].price.toString()}",style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),),
                    ],),

              ],),
                   ),
                 ),
               );
             }, separatorBuilder: (context,index){
               return SizedBox(width: 10,);
             }, itemCount:filterProduct.length),
           ),
           /*last portion end here*/

         ],
       ),
     ),
   ),
    );
  }

}
