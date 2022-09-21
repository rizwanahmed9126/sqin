import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqin_task/layers/data/services/storage.dart';
import 'package:sqin_task/layers/presentation/routes.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var storageService = StorageService();


  navigateDecision() async {

    if (await storageService.getBoolData('isShowHome') == true) {
      Navigator.pushNamed(context, homeScreenRoute);

    } else {

      Navigator.pushNamed(context, loginScreenRoute);
    }
  }


  late String abc;


  @override
  void initState() {
    super.initState();


    Timer(Duration(seconds: 3), () async {

      navigateDecision();
    });
  }

  @override
  Widget build(BuildContext context) {


    return WillPopScope(
      onWillPop: null,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          // fit: StackFit.expand,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo.jpeg'),
                  ),
                ),
              ),

            ]),
      )
    );
  }
}






