import 'package:evenizer/app/account/account_dashboard.dart';
import 'package:evenizer/app/event_system/event_invite.dart';
import 'package:evenizer/app/information_desk/information_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'event_system/event_detail/event_dashboard.dart';
import 'event_system/schedule_event.dart';

class HomerPage extends StatefulWidget {
  const HomerPage({Key? key}) : super(key: key);

  @override
  _HomerPageState createState() => _HomerPageState();
}

class _HomerPageState extends State<HomerPage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        child: Scaffold(
          body: _buildContent(context),
          backgroundColor: Colors.white,
        ),
        value: SystemUiOverlayStyle(
            statusBarColor: Color(0xFF3fd0d5),
            statusBarIconBrightness: Brightness.light
        )
    );
  }

  Widget _buildContent(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: CustomBackClip(),
          child: Container(
            color: Color(0xFF3fd0d5),
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 18
          ),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello,',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            Text(
                              'Admin !',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => AccountSettings()),
                                );
                              },
                              icon: Icon(
                                Icons.account_circle,
                                color: Colors.white,
                                size: 50,
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25)
                      ),
                      color: Colors.white
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                            height: 700.0,
                          child: ListView(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => ScheduleEvent()),
                                          );
                                        },
                                        child: Container(
                                          height: 200,
                                          width: 130,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SizedBox(height: 10),
                                              Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage("assets/images/calendar.png"),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                width: 100,
                                                height: 100,
                                              ),
                                              SizedBox(height: 10),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [Text(
                                                  'Schedule\nevent',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Color(0xff00bfc4),
                                                      fontWeight: FontWeight.w500
                                                  ),
                                                )],
                                              )
                                            ],
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(25),
                                              color: Color(0xffccf5ff)
                                          ),
                                          padding: EdgeInsets.all(16),
                                        ),
                                      ),
                                      SizedBox(height: 40,),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => EventInvite()),
                                          );
                                        },
                                        child: Container(
                                          height: 200,
                                          width: 130,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SizedBox(height: 10),
                                              Icon(
                                                Icons.settings_suggest,
                                                size: 80,
                                                color: Colors.red,
                                              ),
                                              SizedBox(height: 10),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [Text(
                                                  'Manage\nSystem',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Color(0xff00bfc4),
                                                      fontWeight: FontWeight.w500
                                                  ),
                                                )],
                                              )
                                            ],

                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(25),
                                              color: Color(0xffccf5ff)
                                          ),
                                          padding: EdgeInsets.all(16),
                                        ),
                                      ),
                                      SizedBox(height: 40,),

                                    ],
                                  ),

                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => EventDashboard()),
                                          );
                                        },
                                        child: Container(
                                          height: 200,
                                          width: 130,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SizedBox(height: 10),
                                              Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage("assets/images/schedule-event.png"),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                width: 100,
                                                height: 100,
                                              ),
                                              SizedBox(height: 10),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [Text(
                                                  'View all\nevents',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Color(0xff00bfc4),
                                                      fontWeight: FontWeight.w500
                                                  ),
                                                )],
                                              )

                                            ],

                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(25),
                                              color: Color(0xffccf5ff)
                                          ),
                                          padding: EdgeInsets.all(16),
                                        ),
                                      ),
                                      SizedBox(height: 40,),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => InformationDashboard()),
                                          );
                                        },
                                        child: Container(
                                          height: 200,
                                          width: 130,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SizedBox(height: 10),
                                              Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage("assets/images/sofa.png"),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                width: 100,
                                                height: 100,
                                              ),
                                              SizedBox(height: 10),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [Text(
                                                  'Info\nDesk',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Color(0xff00bfc4),
                                                      fontWeight: FontWeight.w500
                                                  ),
                                                )],
                                              )

                                            ],

                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(25),
                                              color: Color(0xffccf5ff)
                                          ),
                                          padding: EdgeInsets.all(16),
                                        ),
                                      ),
                                      SizedBox(height: 40,),
                                    ],
                                  )
                                ],
                              )
                            ],
                          )
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}


class CustomBackClip extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();

    path.moveTo(0.0, size.height);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height*0);
    path.lineTo(size.width*0, size.height*0);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}