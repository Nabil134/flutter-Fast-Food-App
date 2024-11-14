import 'package:flutter/material.dart';
import 'package:flutterfastfoofapp/data/splash_screen_data.dart';
import 'package:flutterfastfoofapp/screens/auth_screen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage=0;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height= MediaQuery.of(context).size.height;
    return Scaffold(
      body:SafeArea(
        child: Center(
          child: Container(
            height: height*0.95,
            width: width*0.95,
            color: Colors.teal,
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: 20),
              child: Column(children: [
                /*first portion start here*/
                Expanded(
                  child: PageView.builder(
                      onPageChanged: (page){
                        setState(() {
                          currentPage=page;
                        });
                      },
                      itemCount: splashproducts.length,
                      itemBuilder: (context,index){

                        return Column(
                          children:  [
                            Container(
                              alignment: Alignment.topRight,
                              height: height*0.26,
                              width: width*0.8,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(
                                  splashproducts[index].img,
                                ),),
                              ),
                              child: TextButton(
                                onPressed:(){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => AuthScreen(),),
                                  );
                                },
                                child: Text(
                                  'Skip',style: TextStyle(
                                  color: Colors.white,
                                ),),
                              ),
                            ),
                            Text(splashproducts[index].title,style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),),
                            Text(
                              textAlign:TextAlign.center,
                              splashproducts[index].description,style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),),
                          ],
                        );
                      }),
                ),
                /*first portion end here*/
                /*second portion start here*/
                SizedBox(
                  height: 10,
                  child: ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        return Container(
                          height: 10,
                          width: currentPage==index?25:10,
                          color: currentPage==index?Colors.red:Colors.white,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                        );
                      }),
                ),
                /*second portion end her*/
                /*last portion start here*/
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    currentPage==2?
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AuthScreen(),),
                        );
                      },
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                    ):Container(),
                  ],
                ),

                /*last portion end here*/

              ],),
            ),
          ),
        ),
      ),
    );
  }
}
