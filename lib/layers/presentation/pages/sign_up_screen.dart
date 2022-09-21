import 'package:column_scroll_view/column_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sqin_task/layers/presentation/routes.dart';

import '../bloc/authentication_bloc/auth_bloc.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _showPassword = false;
  bool _showEmail = false;


  TextEditingController passController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,

      ),

      extendBodyBehindAppBar: false,


      body: ColumnScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [

                  Container(
                    margin: const EdgeInsets.all(
                      15,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Sign Up",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                         const Text(
                            "Enter your credentials to continue",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Form(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // const Text(
                                //   "Username",
                                //   style: TextStyle(
                                //       fontSize: 12,
                                //       fontWeight: FontWeight.w500,
                                //       color: Colors.grey),
                                // ),
                                // SizedBox(
                                //   width: 500,
                                //   child: TextFormField(
                                //     // keyboardType: TextInputType.emailAddress,
                                //     controller: emailController,
                                //     autocorrect: true,
                                //     decoration: InputDecoration(
                                //       isDense: true,
                                //       contentPadding:const EdgeInsets.symmetric(
                                //         vertical: 10.0,
                                //         horizontal: 0,
                                //       ),
                                //       hintText: 'Username',
                                //       hintStyle:const TextStyle(
                                //         color: Colors.black,
                                //         fontSize: 10,
                                //       ),
                                //       filled: true,
                                //       fillColor: Colors.white,
                                //       enabledBorder:const UnderlineInputBorder(
                                //         borderSide: BorderSide(
                                //           color: Colors.grey,
                                //           width: 2,
                                //         ),
                                //       ),
                                //       focusedBorder: UnderlineInputBorder(
                                //         borderSide: BorderSide(
                                //           color:
                                //           Theme.of(context).primaryColor,
                                //           width: 2,
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                const SizedBox(
                                  height: 20,
                                ),
                               const Text(
                                  "Email",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                                Container(
                                  width: 500,
                                  child: TextFormField(
                                    // keyboardType: TextInputType.emailAddress,
                                    controller: emailController,
                                    autocorrect: true,
                                    decoration: InputDecoration(
                                      suffixIcon: !_showEmail
                                          ? IconButton(
                                        icon: const Icon(
                                          Icons.check,
                                          size: 15,
                                          color: Colors.blue,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _showEmail = true;
                                          });
                                        },
                                      )
                                          : IconButton(
                                        icon: Icon(
                                          Icons.close,
                                          size: 15,
                                          color: Theme.of(context)
                                              .indicatorColor,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _showEmail = false;
                                          });
                                        },
                                      ),
                                      isDense: true,
                                      contentPadding:const EdgeInsets.symmetric(
                                        vertical: 10.0,
                                        horizontal: 0,
                                      ),
                                      hintText: 'Email Address',
                                      hintStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 2,
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                          Theme.of(context).primaryColor,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                 SizedBox(
                                  height: 20.h,
                                ),
                                const Text(
                                  "Password",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                                SizedBox(
                                  width: 500.w,
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    controller: passController,
                                    obscureText: !_showPassword,
                                    autocorrect: true,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding:const EdgeInsets.symmetric(
                                        vertical: 10.0,
                                        horizontal: 0,
                                      ),
                                      hintText: 'Password',
                                      hintStyle:const TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      suffixIcon: !_showPassword
                                          ? IconButton(
                                        icon:const Icon(
                                          Icons.visibility_off,
                                          size: 15,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _showPassword = true;
                                          });
                                        },
                                      )
                                          : IconButton(
                                        icon: Icon(
                                          Icons.visibility,
                                          size: 15,
                                          color: Theme.of(context)
                                              .indicatorColor,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _showPassword = false;
                                          });
                                        },
                                      ),
                                      enabledBorder:const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 2,
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                          Theme.of(context).primaryColor,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'By Continuing you argee to our \ ',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey.shade700),
                              children: const <TextSpan>[
                                TextSpan(
                                    text: 'Terms of Service',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue)),
                                TextSpan(
                                  text: ' and ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                                TextSpan(
                                    text: 'Privacy Policy',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue)),
                              ],
                            ),
                          ),
                          Container(
                            height: 20,
                          ),

                        ]),
                  )
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding:const EdgeInsets.all(4),
                    child: RaisedButton(
                      highlightElevation: 3.0,
                      elevation: 3.0,
                      onPressed: () {

                        BlocProvider.of <AuthBloc>(context).signUP(context, emailController.text, passController.text);


                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          80.0,
                        ),
                      ),
                      padding: EdgeInsets.all(0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient:const LinearGradient(
                              colors: [
                                Color.fromRGBO(19, 67, 195, 1),
                                Color.fromRGBO(8, 48, 159, 1),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ),
                        ),
                        constraints:const BoxConstraints(
                          maxWidth: 290,
                          minHeight: 35,
                        ),
                        alignment: Alignment.center,
                        child:const Text(
                          "Sign Up",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const  SizedBox(
                    height: 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const  Text(
                        "Already have an account?",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, loginScreenRoute);

                          //navigationService.navigateTo(LoginScreenRoute);
                        },
                        child:const Text(
                          ' Log In',
                          style: TextStyle(
                            color: Color.fromRGBO(47, 147, 255, 1),
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                    SizedBox(
                    height: 20.h,
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
