import 'package:flutter/material.dart';
import 'package:flutterfastfoofapp/screens/category_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey <FormState> _formKey=GlobalKey();
  final TextEditingController _nameController=TextEditingController();
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final TextEditingController _confirmpasswordController=TextEditingController();

  bool _isPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;
  /*_togglePasswordVisibility start here*/
  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordObscured = !_isPasswordObscured;
    });
  }
  /*_togglePasswordVisibility end here*/
  /*_togglePasswordVisibility start here*/
  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _isConfirmPasswordObscured = !_isConfirmPasswordObscured;
    });
  }
  /*_togglePasswordVisibility end here*/
  bool isLoading=false;

  /*_submittedForm start here*/

  Future<void> _submittedForm() async {
    if (isLoading) return;
    setState(() {
      isLoading=true;
    });
    String name=_nameController.text;
    String email=_emailController.text;
    String password=_passwordController.text;
    String confirmpassword=_confirmpasswordController.text;
    if(_formKey.currentState!.validate()){
      await Future.delayed(Duration(seconds: 2),);
      if(email=='mohammad.nabil.ashraf@gmail.com'&& password=='123456' && name=="Muhammad Nabil" && confirmpassword==password){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CategoryScreen(),),
        );
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Email or password or Name or confirmPassword is incorrect'),
            backgroundColor:Colors.teal,
          ),
        );
      }
    }
    setState(() {
      isLoading=false;
    });
  }
  /*_login function end here*/
  /*_submittedForm end here*/
  /*validateName start here*/
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter Name';
    }
    String namePattern = r"^[a-zA-Z\s]+$";

    if (!RegExp(namePattern).hasMatch(value)) {
      return 'Please enter a valid name without numbers or special characters';
    }

    return null;
  }

  /*validateName end here*/
  /*validateEmail start here*/
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address.';
    }

    String emailPattern =
        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';

    if (!RegExp(emailPattern).hasMatch(value)) {
      return 'Please enter a valid email address.';
    }

    return null;
  }
  /*validateEmail end here*/
  /* validatePassword start here */
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password.';
    }

    if (value.length < 6) {
      return 'Password should be at least 6 characters long.';
    }

    final passwordPattern = r'^[a-zA-Z0-9!@#\$%\^&\*\(\)]+$';
    if (!RegExp(passwordPattern).hasMatch(value)) {
      return 'Password should contain only letters, numbers, or common symbols.';
    }

    return null; // If all checks pass
  }
  /* validatePassword end here */
  /*confirmValidatePassword start here*/
  /* confirmValidatePassword start here */
  String? confirmValidatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your confirm password.';
    }

    if (value != _passwordController.text) {
      return 'Passwords do not match.';
    }

    return null; // If all checks pass
  }
  /* confirmValidatePassword end here */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen',style: TextStyle(
          color: Colors.black,
        ),),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(children: [
              /*first portion start here*/
              Center(child: Image.asset('assets/images/logo.png',height: 250,width: 150,),),
              /*first portion end here*/
              SizedBox(height: 20,),
              /*second portion start here*/
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      textAlign:TextAlign.justify,
                      'Create \n New Account',style: TextStyle(
                      fontSize: 35,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold, height: 1,
                    ),),
                    SizedBox(height: 20,),
                    TextFormField(
                      validator: (value)=>validateName(value),
                      controller: _nameController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: "Name",
                      ),
                    ),
                    TextFormField(
                      validator: (value)=>validateEmail(value),
                      controller: _emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: "Email",
                      ),
                    ),
                    TextFormField(
                      validator: validatePassword,
                      controller: _passwordController,

                      obscureText:_isPasswordObscured,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(onPressed: _togglePasswordVisibility,
                          icon:_isPasswordObscured?Icon(Icons.visibility_off): Icon(Icons.visibility),),
                        prefixIcon: Icon(Icons.password),
                        hintText: "Password",
                      ),
                    ),
                    TextFormField(
                      validator: confirmValidatePassword,
                      controller: _confirmpasswordController,
                      obscureText: _isConfirmPasswordObscured,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(onPressed:
                        _toggleConfirmPasswordVisibility,icon:_isConfirmPasswordObscured?Icon(Icons.visibility_off): Icon(Icons.visibility),),
                        prefixIcon: Icon(Icons.password),
                        hintText: "Confirm Password",
                      ),
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: Colors.teal,
                        minimumSize: Size(400, 50),
                      ),
                      onPressed: (){
                        _submittedForm();
                      }, child: Text('Create',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),),),
                  ],),),
              /*second portion end here*/

            ],),
          ),
        ),
      ),
    );
  }
}
