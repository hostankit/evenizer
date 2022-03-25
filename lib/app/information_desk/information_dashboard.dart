import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InformationDashboard extends StatefulWidget {
  const InformationDashboard({Key? key}) : super(key: key);

  @override
  State<InformationDashboard> createState() => _InformationDashboardState();
}

class _InformationDashboardState extends State<InformationDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Information Dashboard',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            'List of Cells',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500
            ),
          ),
          SizedBox(height: 10),
          Text(
            'ATAL Academy',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400
            ),
          ),
          SizedBox(height: 10),
          Text(
            'SWAYAM',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400
            ),
          ),
          SizedBox(height: 10),
          Text(
            'PMSSS',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Vigilance',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Parliament',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Faculty Development',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Student\'s Development',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Media',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400
            ),
          ),
          SizedBox(height: 10),
          Text(
            'e-Governance',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Innovation',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
