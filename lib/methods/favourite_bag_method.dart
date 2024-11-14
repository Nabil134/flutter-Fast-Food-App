import 'package:flutter/material.dart';
import 'package:flutterfastfoofapp/data/product_list.dart';
import 'package:flutterfastfoofapp/methods/custom_snackbar.dart';

class FavouriteBagMethod{
  void addToFavourite(context,data){
    if(favouriteBag.contains(data)){
      ScaffoldMessenger.of(context).showSnackBar(CustomSnackBarForFavouriteBag().failedSnackBar(),);
    }
    else{
      favouriteBag.add(data);
      ScaffoldMessenger.of(context).showSnackBar(CustomSnackBarForFavouriteBag().successSnackBar(),);
    }
  }
}