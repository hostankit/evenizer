import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evenizer/app/sign_in/sign_in_page.dart';
import 'package:evenizer/services/auth.dart';
import 'package:evenizer/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'canteen_interface/canteen_home.dart';
import 'home_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User?>(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          // ignore: unnecessary_null_comparison
          if (user == null) {
            return SignInPage.create(context);
          } else if (user != null) {
            CollectionReference users = FirebaseFirestore.instance.collection('users');
            return FutureBuilder<DocumentSnapshot>(
              future: users.doc(user.uid).get(),
              builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Some error');
                }
                if (snapshot.hasData && !snapshot.data!.exists) {
                  Future<void> addUser() {
                    DocumentReference userdoc = FirebaseFirestore.instance.collection('users').doc(user.uid);
                    if (user.providerData[0].providerId == 'google.com') {
                      return userdoc.set(
                          {
                            'name': user.displayName,
                            'email': user.email,
                            'uid': user.uid,
                            'creationTime': user.metadata.creationTime,
                            'lastSignInTime': user.metadata.lastSignInTime,
                            'avatar': user.photoURL,
                            'signintype': user.providerData[0].providerId
                          }
                      ).then((value) => print("User Added by google"))
                          .catchError((error) => print("Failed to add user: $error"));
                    } else if (user.providerData[0].providerId == 'password') {
                      return userdoc.set(
                          {
                            'name': user.displayName,
                            'email': user.email,
                            'uid': user.uid,
                            'creationTime': user.metadata.creationTime,
                            'lastSignInTime': user.metadata.lastSignInTime,
                            'avatar': user.photoURL,
                            'signintype': user.providerData[0].providerId
                          }
                      ).then((value) => print("User Added by password"))
                          .catchError((error) => print("Failed to add user: $error"));

                    } else if (user.providerData[0].providerId == 'phone') {
                      return userdoc.set(
                          {
                            'name': user.displayName,
                            'email': user.email,
                            'uid': user.uid,
                            'phoneNumber': user.phoneNumber,
                            'creationTime': user.metadata.creationTime,
                            'lastSignInTime': user.metadata.lastSignInTime,
                            'avatar': user.photoURL,
                            'signintype': user.providerData[0].providerId
                          }
                      ).then((value) => print("User Added by phone"))
                          .catchError((error) => print("Failed to add user: $error"));
                    }
                    else {
                      return userdoc.set(
                          {
                            'displayname': 'Null'
                          }
                      );
                    }
                  }

                  addUser();
                  Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                  if (data.containsKey('isAdmin') == true && data['isAdmin']==true) {
                    return Provider<Database>(
                        create: (_) => FirestoreDatabase(uid: user.uid),
                        child: HomePage());
                  } else if (data.containsKey('isCanteen') == true && data['isCanteen']==true) {
                    return Provider<Database>(
                        create: (_) => FirestoreDatabase(uid: user.uid),
                        child: CanteenHome(userdata: data));
                  } else {
                    return Provider<Database>(
                        create: (_) => FirestoreDatabase(uid: user.uid),
                        child: HomePage());
                  }
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                  print(data);
                  return Provider<Database>(
                      create: (_) => FirestoreDatabase(uid: user.uid),
                      child: HomePage());
                }

                return Material(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Thank you for choosing Evenizer',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        LinearProgressIndicator()
                      ],
                    ),
                  ),
                );
              }
            );
          }
        }

        return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            )
        );
      }
    );
  }
}
