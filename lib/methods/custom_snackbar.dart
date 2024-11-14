import 'package:flutter/material.dart';

class CustomSnackBar{
  successSnackBar()=>SnackBar(
    backgroundColor: Colors.teal,
    content:Text('Successfully added to your bag'),);
  failedSnackBar()=>SnackBar(
    backgroundColor: Colors.red,
    content:Text('You have already added this item before'),);
}
class CustomSnackBarForFavouriteBag{
  successSnackBar()=>SnackBar(
    backgroundColor: Colors.teal,
    content:Text('Successfully added to your Whistlist'),);
  failedSnackBar()=>SnackBar(
    backgroundColor: Colors.red,
    content:Text('You have already added this item before'),);
}