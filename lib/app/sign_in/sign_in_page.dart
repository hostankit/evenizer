import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:evenizer/app/sign_in/sign_in_manager.dart';
import 'package:evenizer/app/sign_in/sign_in_button.dart';
import 'package:evenizer/app/sign_in/social_sign_in_button.dart';
import 'package:evenizer/common_widgets/show_exception_alert_dialog.dart';
import 'package:evenizer/services/auth.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import 'email_sign_in_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key, required this.manager, required this.isLoading}) : super(key: key);
  final SignInManager manager;
  final bool isLoading;

  static Widget create(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return ChangeNotifierProvider<ValueNotifier<bool>>(
      create: (_) => ValueNotifier<bool>(false),
      child: Consumer<ValueNotifier<bool>>(
        builder: (_, isLoading, __) =>  Provider<SignInManager>(
          create: (_) => SignInManager(auth: auth, isLoading: isLoading),
          child: Consumer<SignInManager>(
            builder: (_, manger, __) => SignInPage(manager: manger, isLoading: isLoading.value,),
          ),
        ),
      ),
    );
  }

  void _showSignInError(BuildContext context, Exception exception) {
    if (exception is FirebaseException && exception.code == 'ERROR_ABORTED_BY_USER') {
      return;
    }
    showExceptionAlertDialog(
        context,
        title: 'Sign in failed',
        exception: exception
    );
  }

  Future<void> _signInAnonymously(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await manager.signInAnonymously();
    } on Exception catch(e) {
      _showSignInError(context, e);
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await manager.signInWithGoogle();
    } on Exception catch(e) {
      _showSignInError(context, e);
    }
  }
  // void _signInWithPhone(BuildContext context) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute<void>(
  //         fullscreenDialog: true,
  //         builder: (context) => PhoneSignInPage()
  //     ),
  //   );
  // }

  void _signInWithEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
          fullscreenDialog: true,
          builder: (context) => EmailSignInPage()
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        child: Scaffold(
          body: _buildContent(context),
          backgroundColor: Colors.white,
        ),
        value: SystemUiOverlayStyle(
            statusBarColor: Color(0xFF4646ff),
            statusBarIconBrightness: Brightness.light
        )
    );
  }

  Widget _buildContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomBackClip(),
          child: Container(
            color: Color(0xFF4646FF),
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Container(
                          //   child: Column(
                          //     mainAxisAlignment: MainAxisAlignment.start,
                          //     crossAxisAlignment: CrossAxisAlignment.stretch,
                          //     children: <Widget>[
                          //       Row(
                          //         mainAxisAlignment: MainAxisAlignment.start,
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: [
                          //           SizedBox(width: 40,),
                          //           Column(
                          //             mainAxisAlignment: MainAxisAlignment.start,
                          //             crossAxisAlignment: CrossAxisAlignment.start,
                          //             children: <Widget>[
                          //               SizedBox(height: 40,),
                          //               Text(
                          //                 'Streamline\nProcess \nbetween',
                          //                 softWrap: true,
                          //                 style: TextStyle(
                          //                   fontSize: 40,
                          //                   fontWeight: FontWeight.w900,
                          //                   color: Colors.white,
                          //                 ),
                          //               ),
                          //               Text(
                          //                 'Hostels &',
                          //                 style: TextStyle(
                          //                   fontSize: 40,
                          //                   fontWeight: FontWeight.w900,
                          //                   color: Colors.white,
                          //                 ),
                          //               ),
                          //               Text(
                          //                 'Students',
                          //                 style: TextStyle(
                          //                   fontSize: 40,
                          //                   fontWeight: FontWeight.w900,
                          //                   color: Colors.white,
                          //                 ),
                          //               ),
                          //               SizedBox(height: 60,),
                          //               Text(
                          //                 'through',
                          //                 style: TextStyle(
                          //                   fontSize: 40,
                          //                   fontWeight: FontWeight.w500,
                          //                   color: Colors.white,
                          //                 ),
                          //               ),
                          //               Text(
                          //                 'HostelHub.',
                          //                 style: TextStyle(
                          //                   fontSize: 40,
                          //                   fontWeight: FontWeight.w900,
                          //                   color: Colors.white,
                          //                 ),
                          //               ),
                          //             ],
                          //           )
                          //         ],
                          //       )
                          //     ],
                          //   ),
                          // ),
                          SizedBox(height: 10),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Card(
                                  elevation: 2.0,
                                  color: Color(0xFFF0F7FF),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0)
                                  ),
                                  child: Container(
                                      padding: EdgeInsets.all(20.0),
                                      child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            SizedBox(
                                                height: 50.0,
                                                child: _buildHeader()
                                            ),
                                            SizedBox(height: 38.0),
                                            SocialSignInButton(
                                              assetName: 'assets/images/google-logo.png',
                                              text: 'Sign in with Google',
                                              color: Colors.white,
                                              textColor: Colors.black87,
                                              onPressed: isLoading ? null : () => _signInWithGoogle(context),
                                            ),
                                            SizedBox(height: 16.0),
                                            // SocialSignInButton(
                                            //   assetName: 'assets/images/phone.png',
                                            //   text: 'Sign in with Phone',
                                            //   color: Colors.white,
                                            //   textColor: Colors.blue,
                                            //   onPressed: isLoading ? null : () => _signInWithPhone(context),
                                            // ),
                                            // SizedBox(height: 16.0),
                                            //
                                            SocialSignInButton(
                                              assetName: 'assets/images/email.jpg',
                                              text: 'Sign in with Email',
                                              color: Colors.white,
                                              textColor: Colors.black87,
                                              onPressed: isLoading ? null : () => _signInWithEmail(context),
                                            ),
                                            // SizedBox(height: 8.0),
                                            // Text(
                                            //   'or',
                                            //   textAlign: TextAlign.center,
                                            //   style: TextStyle(
                                            //     fontSize: 15.0,
                                            //     fontWeight: FontWeight.w600,
                                            //   ),
                                            // ),
                                            // SizedBox(height: 8.0),
                                            // TextButton(
                                            //   child: Row(
                                            //     mainAxisAlignment: MainAxisAlignment.end,
                                            //     children: <Widget>[
                                            //       Text(
                                            //           'Continue without login',
                                            //           textAlign: TextAlign.left,
                                            //           style:TextStyle(
                                            //               fontSize: 18.0,
                                            //               fontWeight: FontWeight.w500,
                                            //               color: Colors.black
                                            //           )
                                            //       ),
                                            //       Icon(
                                            //         Icons.arrow_forward,
                                            //         color: Colors.black,
                                            //         size: 30.0,
                                            //       ),
                                            //     ],
                                            //   ),
                                            //   style: TextButton.styleFrom(
                                            //     primary: Colors.black54,
                                            //     alignment: Alignment.centerLeft,
                                            //     textStyle: TextStyle(
                                            //       fontSize: 14.0,
                                            //       fontWeight: FontWeight.w300,
                                            //     ),
                                            //   ),
                                            //   onPressed: isLoading ? null : () => _signInAnonymously(context),
                                            // ),
                                          ]
                                      )
                                  ),
                                ),
                              ],
                            ),
                          )
                        ]
                    ),
                  ),
                )
              ],
            )
        )
      ],
    );
  }

  Widget _buildHeader() {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Text(
      'Sign In',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class CustomBackClip extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();

    path.moveTo(0.0, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.71, size.width * 0.4, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.7, size.height * 0.68, size.width * 1.0, size.height * 0.8);
    // path.lineTo(size.width, size.height * 0.8);
    path.lineTo(size.width, size.height*0);
    path.lineTo(size.width*0, size.height*0);
    path.lineTo(0.0, size.height*0.8);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}