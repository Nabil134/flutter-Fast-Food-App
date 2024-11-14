import 'package:flutter/material.dart';
import 'package:flutterfastfoofapp/data/product_list.dart';
import 'package:flutterfastfoofapp/methods/custom_snackbar.dart';

class CartBagMethod{
  void addToCart(context,data){
    if(cartBag.contains(data)){
      ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar().failedSnackBar(),);
    }
    else{
      cartBag.add(data);
      ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar().successSnackBar(),);
    }
  }
}
/*calculateSubTotal start here*/
double calculateSubTotal(){
  return cartBag.fold(0.0, (subTotal, data) => subTotal+data.price*data.quantity);
}
/*calculateSubTotal end here*/
/*calculateDeliveryTotal start here*/
double calculateDeliveryTotal(){
  if(cartBag.isEmpty){
    return 0.0;
  }
  else{
    return 3;
  }
}
/*calculateDeliveryTotal end here*/
/*calculateTotal start here*/
double calculateTotal(){
  return calculateDeliveryTotal() + calculateSubTotal();
}
/*calculateTotal end here*/