import 'dart:core';
import 'dart:io';

import 'package:column_scroll_view/column_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_auth/local_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sqin_task/layers/presentation/bloc/authentication_bloc/auth_bloc.dart';
import 'package:sqin_task/layers/presentation/resusable_widgets/snackBar_message.dart';
import 'package:sqin_task/layers/presentation/routes.dart';



class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool checkbox1 = false;
  bool _showPassword = false;
  bool _showEmail = false;


  TextEditingController passController = TextEditingController();
  TextEditingController emailController = TextEditingController();


  bool _isAuthenticating = false;
  String _authorized = 'Not Authorized';
  final LocalAuthentication auth = LocalAuthentication();




  // Future<void> handleSignInEmail() async {
  //
  //
  //   try{
  //     //setLoadingL(true);
  //     UserCredential result = await _auth.signInWithEmailAndPassword(email: emailController.text, password: passController.text);
  //     final User user = result.user!;
  //     print(user.email);
  //
  //
  //
  //
  //
  //   }on FirebaseAuthException catch (err) {
  //     // setLoadingL(false);
  //     // utilService.showToast(err.toString());
  //
  //   }
  //
  //   //return user;
  // }
  //
  // Future<void> handleSignUp() async {
  //
  //
  //
  //   try{
  //
  //     // if(fullNameController.text.isEmpty || emailController.text.isEmpty || passController.text.isEmpty){
  //     //   utilService.showToast("Please Enter all Fields");
  //     //   return;
  //     // }
  //     // else{
  //       //setLoadingS(true);
  //       UserCredential result = await _auth.createUserWithEmailAndPassword(email: emailController.text, password: passController.text);
  //       final User user = result.user!;
  //       print("sing up");
  //
  //      // setUserData('${user.email}','${fullNameController.text}');
  //
  //
  //
  //       // _firebase.collection('userData')
  //       //     .add({
  //       //   'email': '${user.email}',
  //       //   'fullName': '${fullNameController.text}',
  //       // });
  //     //}
  //
  //
  //
  //     // navigationService.navigateTo(HomeScreenRoute);
  //     // setLoadingS(false);
  //
  //
  //   } on FirebaseAuthException catch (err) {
  //     //setLoadingS(false);
  //     if (err.code == 'user-not-found') {
  //      // utilService.showToast('Invalid email.');
  //     } else if (err.code == 'network-request-failed') {
  //       //utilService.showToast("network error");
  //     } else if (err.code == 'too-many-requests') {
  //      // utilService.showToast("We have blocked all requests from this device due to unusual activity. Try again later.");
  //     } else if (err.code == 'email-already-in-use') {
  //      // utilService.showToast("The email address is already in use by another account.");
  //     } else if (err.code == 'invalid-email') {
  //      // utilService.showToast('Invalid email.');
  //     } else if (err.code == 'wrong-password') {
  //      // utilService.showToast('Invalid password.');
  //     }  else {
  //      // utilService.showToast(err.toString());
  //     }
  //   }
  //  // notifyListeners();
  //
  // }
  //
  //
  //
  //
  // Future<void> _authenticateWithBiometrics() async {
  //   bool authenticated = false;
  //   try {
  //     setState(() {
  //       _isAuthenticating = true;
  //       _authorized = 'Authenticating';
  //     });
  //     authenticated = await auth.authenticate(
  //       localizedReason:
  //       'Scan your fingerprint (or face or whatever) to authenticate',
  //       options: const AuthenticationOptions(
  //         stickyAuth: true,
  //         biometricOnly: true,
  //       ),
  //     );
  //     setState(() {
  //       _isAuthenticating = false;
  //       _authorized = 'Authenticating';
  //     });
  //   } on PlatformException catch (e) {
  //     print(e);
  //     setState(() {
  //       _isAuthenticating = false;
  //       _authorized = 'Error - ${e.message}';
  //     });
  //     return;
  //   }
  //   if (!mounted) {
  //     return;
  //   }
  //
  //   final String message = authenticated ? 'Authorized' : 'Not Authorized';
  //   setState(() {
  //     _authorized = message;
  //   });
  // }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // leading: IconButton(
        //     icon: const Icon(
        //       Icons.arrow_back,
        //       size: 18,
        //       color: Colors.black,
        //     ),
        //     onPressed: () {
        //       //navigationService.navigateTo(SelectLocationScreenRoute);
        //     }),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: ColumnScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,


              children: [

                SizedBox(
                  height: 20.h,
                ),
                Container(
                  margin: EdgeInsets.all(
                    15.r,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Log In",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const Text(
                          "Enter your emails and password",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: 60.h,
                        ),
                        Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                             const Text(
                                "Email",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                              ),
                              SizedBox(
                                width: 500,
                                child: TextFormField(
                                  // keyboardType: TextInputType.emailAddress,
                                  controller: emailController,
                                  autocorrect: true,
                                  decoration: InputDecoration(
                                    suffixIcon: !_showEmail
                                        ? IconButton(
                                      icon:const Icon(
                                        Icons.check,
                                        size: 15,
                                        color: Colors.green,
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
                                    hintStyle:const TextStyle(
                                      color: Colors.black,
                                      fontSize: 11,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
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
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Password",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                              ),
                              Container(
                                width: 500,
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
                                    hintStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    suffixIcon: !_showPassword
                                        ? IconButton(
                                      icon: const Icon(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            TextButton(
                              onPressed: () {
                                // navigationService
                                //     .navigateTo(ResetPasswordScreenRoute);
                              },
                              child: const Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),


                        SizedBox(height: 30.h,),



                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.blueAccent,
                          child: TextButton(
                              onPressed: (){


                                BlocProvider.of <AuthBloc>(context).login(context, emailController.text, passController.text);

                              },
                              child: const Text("Submit",style: TextStyle(color: Colors.white),)
                          ),

                        ),


                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [

                            ElevatedButton(
                              onPressed: () async {

                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                textStyle: TextStyle(
                                    fontSize: MediaQuery.of(context)
                                        .size
                                        .height *
                                        0.03,
                                    fontWeight: FontWeight.w600),
                                fixedSize: Size(
                                    MediaQuery.of(context).size.width *
                                        0.38,
                                    MediaQuery.of(context).size.height *
                                        0.060),
                                primary: Colors.white,
                                shape:  RoundedRectangleBorder(
                                    borderRadius:
                                     BorderRadius.circular(50.0),
                                    side: const BorderSide(
                                        width: 1, color: Colors.grey)),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0),
                                    child: Image.asset(
                                      'assets/images/Login-Facebook.png',
                                      height: 20,
                                    ),
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(
                                          left: 5.w, right: 10.w),
                                      child: const Text(
                                        "Facebook",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () async {

                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                textStyle: TextStyle(
                                    fontSize: MediaQuery.of(context)
                                        .size
                                        .height *
                                        0.03,
                                    fontWeight: FontWeight.w600),
                                fixedSize: Size(
                                    MediaQuery.of(context).size.width *
                                        0.38,
                                    MediaQuery.of(context).size.height *
                                        0.060),
                                primary: Colors.white,
                                shape:  RoundedRectangleBorder(
                                    borderRadius:
                                     BorderRadius.circular(50.0),
                                    side: const BorderSide(
                                        width: 1, color: Colors.grey)),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0),
                                    child: Image.asset(
                                      'assets/images/Login-Google.png',
                                      height: 20,
                                    ),
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(
                                          left: 5.w, right: 10.w),
                                      child: const Text(
                                        "Google",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ],),
                       const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, signUpScreenRoute);
                                //navigationService.navigateTo(SignUpScreenRoute);
                              },
                              child:const Text(
                                ' Sign up',
                                style: TextStyle(
                                  color: Color.fromRGBO(47, 147, 255, 1),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                        //Text('Current State: $_authorized\n'),





                      ]
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,

                      borderRadius:BorderRadius.circular(12)
                  ),
                  child: Center(
                    child: TextButton(
                      onPressed: (){
                        BlocProvider.of <AuthBloc>(context).fingerPrint(context);

                      },
                      child: Icon(Icons.fingerprint,size: 50,color: Colors.white,),
                      // Row(
                      //   mainAxisSize: MainAxisSize.min,
                      //   children: <Widget>[
                      //     Text(_isAuthenticating
                      //         ? 'Cancel'
                      //         : 'Authenticate: biometrics only'),
                      //     const Icon(Icons.fingerprint,size: 20,),
                      //   ],
                      // ),
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
