import 'package:flutter/material.dart';
import 'package:sqin_task/layers/presentation/pages/episode_detail_screen.dart';
import 'package:sqin_task/layers/presentation/pages/home_screen.dart';
import 'package:sqin_task/layers/presentation/pages/listing_page.dart';
import 'package:sqin_task/layers/presentation/pages/login_screen.dart';
import 'package:sqin_task/layers/presentation/pages/season_details.dart';
import 'package:sqin_task/layers/presentation/pages/sign_up_screen.dart';



const getScreenRoute = '/get-todoList-screen';
const seasonDetailScreenRoute = '/season-detail-screen';
const loginScreenRoute = '/login-screen';
const signUpScreenRoute = '/sign-up-screen';
const homeScreenRoute = '/home-screen';


Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {

    case getScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => const ListingPage());


    case loginScreenRoute:
      return MaterialPageRoute(
        builder: (BuildContext context) =>  LoginScreen(),
      );

    case signUpScreenRoute:
      return MaterialPageRoute(
        builder: (BuildContext context) =>  SignUpScreen(),
      );

    case homeScreenRoute:
      return MaterialPageRoute(
        builder: (BuildContext context) => const HomeScreen(),
      );






    default:
      return MaterialPageRoute(
          builder: (BuildContext context) => const ListingPage());
  }
}
