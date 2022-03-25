import 'package:evenizer/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({Key? key}) : super(key: key);

  @override
  _AccountSettingsState createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    final user = auth.currentUser!;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'My Account',
            style: TextStyle(
                color: Colors.black
            ),
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: Color(0xFFFFFFFF)
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(user.photoURL.toString()),
                    radius: 40,
                    backgroundColor: Colors.grey,
                  ),
                  SizedBox(height: 10),
                  Text(
                    user.displayName.toString(),
                    style: TextStyle(
                        fontSize: 18
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(user.email.toString()),
                  SizedBox(height: 10),
                  Text('Admin - AICTE'),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(height: 1, color: Color(0xFF4646FF),),
            // TextButton(
            //   child: Padding(
            //     padding: EdgeInsets.all(8),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: <Widget>[
            //         Text(
            //             'Account Setup',
            //             textAlign: TextAlign.left,
            //             style:TextStyle(
            //                 fontSize: 18.0,
            //                 fontWeight: FontWeight.w500,
            //                 color: Colors.black
            //             )
            //         ),
            //         SizedBox(
            //           width:5,
            //         ),
            //         Icon(
            //           Icons.manage_accounts,
            //           color: Colors.black,
            //           size: 30.0,
            //         ),
            //       ],
            //     ),
            //   ),
            //   style: TextButton.styleFrom(
            //     primary: Colors.red,
            //     alignment: Alignment.centerLeft,
            //     textStyle: TextStyle(
            //       fontSize: 20.0,
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => AccountSetupPage()),
            //     );
            //   },
            // ),
            // TextButton(
            //   child: Padding(
            //     padding: EdgeInsets.all(8),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: <Widget>[
            //         Text(
            //             'Notifications',
            //             textAlign: TextAlign.left,
            //             style:TextStyle(
            //                 fontSize: 18.0,
            //                 fontWeight: FontWeight.w500,
            //                 color: Colors.black
            //             )
            //         ),
            //         SizedBox(
            //           width:5,
            //         ),
            //         Icon(
            //           Icons.notifications,
            //           color: Colors.black,
            //           size: 30.0,
            //         ),
            //       ],
            //     ),
            //   ),
            //   style: TextButton.styleFrom(
            //     primary: Colors.red,
            //     alignment: Alignment.centerLeft,
            //     textStyle: TextStyle(
            //       fontSize: 20.0,
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => MainNotificationsPage()),
            //     );
            //   },
            // ),
            // TextButton(
            //   child: Padding(
            //     padding: EdgeInsets.all(8),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: <Widget>[
            //         Text(
            //             'Privacy & Security',
            //             textAlign: TextAlign.left,
            //             style:TextStyle(
            //                 fontSize: 18.0,
            //                 fontWeight: FontWeight.w500,
            //                 color: Colors.black
            //             )
            //         ),
            //         SizedBox(
            //           width:5,
            //         ),
            //         Icon(
            //           Icons.lock,
            //           color: Colors.black,
            //           size: 30.0,
            //         ),
            //       ],
            //     ),
            //   ),
            //   style: TextButton.styleFrom(
            //     primary: Colors.red,
            //     alignment: Alignment.centerLeft,
            //     textStyle: TextStyle(
            //       fontSize: 20.0,
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => AccountPrivacySecurity()),
            //     );
            //   },
            // ),
            TextButton(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                        'Troubleshooting',
                        textAlign: TextAlign.left,
                        style:TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                        )
                    ),
                    SizedBox(
                      width:5,
                    ),
                    Icon(
                      Icons.device_unknown,
                      color: Colors.black,
                      size: 30.0,
                    ),
                  ],
                ),
              ),
              style: TextButton.styleFrom(
                primary: Colors.red,
                alignment: Alignment.centerLeft,
                textStyle: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => SendFeedbackHostelHub()),
                // );
              },
            ),

            SizedBox(height: 50),
            Center(
              child: Column(
                children: [
                  Text('Built by'),
                  Text(
                      'Team QuantaBit',
                      style: TextStyle(
                          fontSize: 20
                      )
                  )
                ],
              ),
            )
            // const Divider(
            //   height: 10,
            //   thickness: 2,
            //   indent: 5,
            //   endIndent: 5,
            // ),
          ],
        )
    );
  }
}