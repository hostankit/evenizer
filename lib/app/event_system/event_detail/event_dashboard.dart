import 'package:evenizer/app/event_system/event_detail/event_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EventDashboard extends StatefulWidget {
  const EventDashboard({Key? key}) : super(key: key);

  @override
  State<EventDashboard> createState() => _EventDashboardState();
}

class _EventDashboardState extends State<EventDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Events Dashboard',
          style: TextStyle(
            color: Color(0xFF3fd0d5)
          ),
        ),
        elevation: 1,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffe7f7ff),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xffe7f7ff),
          statusBarIconBrightness: Brightness.dark
        ),
      ),
      backgroundColor: Color(0xfff5fbff),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            'Upcoming Events',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewEvent(eventdata: 'AICTEWy7fdHa2',)),
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width*0.9,
              height: 210,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  color: Color(0xffe7f7ff),
                  boxShadow: [new BoxShadow(
                    color: Color(0xffe0e0e0),
                    blurRadius: 5.0,
                  ),]
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/audience.jpg"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                      ),
                      color: Colors.black,
                    ),
                    width: MediaQuery.of(context).size.width*0.3,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                      // color: Colors.red
                    ),
                    width: MediaQuery.of(context).size.width*0.6,
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Text(
                          'Cybercrime',
                          style: TextStyle(
                              fontWeight:FontWeight.w500,
                              fontSize: 18
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Date & Time:\n30 Mar 2022 & 11:30AM-12:00PM',
                          style: TextStyle(
                              fontWeight:FontWeight.w400,
                              fontSize: 16
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Conducted by:\nNational Education Alliance for Technology',
                          maxLines: 3,
                          softWrap: true,
                          style: TextStyle(
                              fontWeight:FontWeight.w400,
                              fontSize: 16,
                              overflow: TextOverflow.ellipsis
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Hosted Events',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
            ),
          ),
          SizedBox(height: 50),
          Text(
            'Invited Events',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
            ),
          ),
          SizedBox(height: 50),
          Text(
            'Expired Events',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
