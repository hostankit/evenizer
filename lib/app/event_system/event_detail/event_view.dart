import 'package:evenizer/common_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ViewEvent extends StatefulWidget {
  final eventdata;

  const ViewEvent({Key? key, required this.eventdata}) : super(key: key);

  @override
  State<ViewEvent> createState() => _ViewEventState(this.eventdata);
}

class _ViewEventState extends State<ViewEvent> {
  final eventdata;
  _ViewEventState(this.eventdata);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Color(0xFFe7f7ff),
          statusBarIconBrightness: Brightness.dark
        ),
      child: Scaffold(
        backgroundColor: Color(0xFFe7f7ff),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            SizedBox(height: 50),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/audience.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                color: Colors.black,
              ),
              width: MediaQuery.of(context).size.width*0.9,
              height: 210,
            ),
            SizedBox(height: 20),
            Text(
              eventdata['title'],
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Event ID: '+eventdata['eventid'],
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black
              ),
            ),
            SizedBox(height: 20),
            Text(
              'About',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black87
              ),
            ),
            SizedBox(height: 10),
            Text(
              eventdata['description'],
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87
              ),
            ),
            SizedBox(height: 10),
            Container(height: 1,color: Colors.black54,),
            SizedBox(height: 10),
            Text(
              'Meeting Room: '+eventdata['room'],
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87
              ),
            ),
            SizedBox(height: 10),
            Container(height: 1,color: Colors.black54,),
            SizedBox(height: 10),
            Text(
              'Date: '+DateFormat('dd MMM, yyyy').format(eventdata['date']).toString(),
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87
              ),
            ),
            SizedBox(height: 10),
            Container(height: 1,color: Colors.black54,),
            SizedBox(height: 10),
            Container(height: 1,color: Colors.black54,),
            SizedBox(height: 40),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomElevatedButton(
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(
                                'Send\nEmail Invite',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            )
                          ],
                        ),
                        borderRadius: 14.0,
                        height: 80,
                        color: Color(0xFF3fd0d5),
                        onPressed: () {

                        }
                    ),
                    SizedBox(height: 20),
                    CustomElevatedButton(
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(
                                'Post on\nSocial Media',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            )
                          ],
                        ),
                        height: 80,
                        borderRadius: 14.0,
                        color: Color(0xFF3fd0d5),
                        onPressed: () {

                        }
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomElevatedButton(
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(
                                'Event\nReport',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            )
                          ],
                        ),
                        borderRadius: 14.0,

                        height: 80,
                        color: Color(0xFF3fd0d5),
                        onPressed: () {

                        }
                    ),
                    SizedBox(height: 20),
                    CustomElevatedButton(
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(
                                'Event\nSettings',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            )
                          ],
                        ),
                        height: 80,
                        borderRadius: 14.0,
                        color: Color(0xFF3fd0d5),
                        onPressed: () {

                        }
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 30),
            CustomElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Conclude Event',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    )
                  ],
                ),
                height: 50,
                borderRadius: 14.0,
                color: Color(0xff02d223),
                onPressed: () {

                }
            ),
            SizedBox(height: 30),
            CustomElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Postpone Event',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    )
                  ],
                ),
                height: 50,
                borderRadius: 14.0,
                color: Color(0xFF5E5E5E),
                onPressed: () {

                }
            ),
            SizedBox(height: 30),
            CustomElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Cancel Event',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    )
                  ],
                ),
                height: 50,
                borderRadius: 14.0,
                color: Color(0xffff6060),
                onPressed: () {

                }
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
