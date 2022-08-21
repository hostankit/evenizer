import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ManageSystem extends StatefulWidget {
  const ManageSystem({Key? key}) : super(key: key);

  @override
  State<ManageSystem> createState() => _ManageSystemState();
}

class _ManageSystemState extends State<ManageSystem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Manage System',
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
      body: ListView(
        children: [
          Padding(
              padding: EdgeInsets.all(16),
              child: Text('Meeting Rooms'),
          ),
          SizedBox(height: 20),
          Container(
            height: 250,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 10,
                  bottom: 10
              ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      constraints: BoxConstraints(minWidth: 250, maxWidth: 350, minHeight: 80, maxHeight: 170),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color(0xFF4646FF),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Icon(
                              Icons.add,
                              size: 80,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 20,),
                          Center(
                            child: Text(
                              'Setup Meeting Room',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text('Bureau Management'),
          ),
          SizedBox(height: 20),
          Container(
            height: 250,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 10,
                  bottom: 10
              ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      constraints: BoxConstraints(minWidth: 250, maxWidth: 350, minHeight: 80, maxHeight: 170),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color(0xFF4646FF),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Icon(
                              Icons.add,
                              size: 80,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 20,),
                          Center(
                            child: Text(
                              'Setup Bureau/Cell',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
