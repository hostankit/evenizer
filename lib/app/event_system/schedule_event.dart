import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evenizer/common_widgets/custom_elevated_button.dart';
import 'package:evenizer/common_widgets/show_alert_dialog.dart';
import 'package:evenizer/common_widgets/show_exception_alert_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'dart:io' as io;
import 'package:path/path.dart' as Path;
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'event_detail/event_view.dart';

class ScheduleEvent extends StatefulWidget {
  const ScheduleEvent({Key? key}) : super(key: key);

  @override
  State<ScheduleEvent> createState() => _ScheduleEventState();
}

class _ScheduleEventState extends State<ScheduleEvent> {


  DateTime _date1 = DateTime.now();
  var meetdate = DateTime.now();

  File? _docFile=null;

  var filedata = null;

  void _selectDate1(setModalState) async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: _date1,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days:180)),
      helpText: 'Meeting Date',
    );
    if (newDate != null) {
      setState(() {
        _date1 = newDate;
        meetdate = _date1;
      });
    }
  }

  late TextEditingController _titleController = TextEditingController();
  late TextEditingController _descriptionController = TextEditingController();
  late String _durationController;
  late String _roomController;
  late String _capacityController;
  final picker = ImagePicker();

  String generateRandomString(int length) {
    final _random = Random();
    const _availableChars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    final randomString = List.generate(length,
            (index) => _availableChars[_random.nextInt(_availableChars.length)])
        .join();

    return randomString;
  }

  generateEventID(orgcode) {
    var eventid = orgcode + generateRandomString(8);
    return eventid;
  }

  void _pickFile() async {
    // opens storage to pick files and the picked file or files
    // are assigned into result and if no file is chosen result is null.
    // you can also toggle "allowMultiple" true or false depending on your need
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    // if no file is picked
    if (result == null) return;

    if (result != null) {
      print(result.files.first.name);
      print(result.files.first.size);
      print(result.files.first.path);
      setState(() {
        _docFile = File(result.files.first.path.toString());
        filedata = result.files.first.name;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Schedule Event',
          style: TextStyle(
            color: Colors.black
          ),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        centerTitle: true,
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
          TextButton(
            onPressed: () => _selectDate1(setState),
            child: date1(context),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0)
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Color(0xFF4646FF))
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          DropdownButtonFormField(
            hint: Text(
                'Meeting Duration (in Minutes)',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                )
            ),
            iconSize: 0.0,
            items: <String>['30', '60', '90', '120', '150', '180']
                .map<DropdownMenuItem<String>>((label)=> DropdownMenuItem<String>(
                child: Text(
                    label + ' minutes',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87
                    )
                ),
                value:label
            )).toList(),
            decoration: InputDecoration(
                fillColor: Colors.white,
                contentPadding: new EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Color(0xFF4646FF)),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Color(0xFF4646FF))
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Color(0xFF4646FF))
                ),
                filled: true,
                prefixIcon: Icon(
                  Icons.schedule,
                  color: Color(0xFF4646FF),
                )
            ),
            onChanged: (value) {
              setState(() {
                _durationController = value.toString();
              });
            },
          ),
          SizedBox(height: 10),
          Text(
            'Available Slots and Rooms',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
            ),
          ),
          SizedBox(height: 10),
          DropdownButtonFormField(
            hint: Text(
                'Select Room and Slot',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                )
            ),
            iconSize: 0.0,
            items: <String>['M101 - 09:00AM - 09:30PM', 'M201 - 11.30AM - 12.00PM', 'M201 - 12.30PM - 01.00PM', 'Auditorium - 12.30PM-01.00PM']
                .map<DropdownMenuItem<String>>((label)=> DropdownMenuItem<String>(
                child: Text(
                    label,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87
                    )
                ),
                value:label
            )).toList(),
            decoration: InputDecoration(
                fillColor: Colors.white,
                contentPadding: new EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Color(0xFF4646FF)),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Color(0xFF4646FF))
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Color(0xFF4646FF))
                ),
                filled: true,
                prefixIcon: Icon(
                  Icons.living,
                  color: Color(0xFF4646FF),
                )
            ),
            onChanged: (value) {
              setState(() {
                _roomController = value.toString();
              });
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: _titleController,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black87
            ),
            maxLines: 1,
            decoration: InputDecoration(
              fillColor: Colors.white,
              contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Color(0xFF4646FF)),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0)
                  ),
                  borderSide: BorderSide(color: Color(0xFF4646FF))
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Color(0xFF4646FF))
              ),
              filled: true,
              hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              hintText: 'Event Title',
              // prefixIcon: Icon(
              //   Icons.location_pin,
              //   color: Color(0xFFE5241E),
              // )
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: _descriptionController,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black87
            ),
            maxLines: 10,
            decoration: InputDecoration(
              fillColor: Colors.white,
              contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Color(0xFF4646FF)),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0)
                  ),
                  borderSide: BorderSide(color: Color(0xFF4646FF))
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Color(0xFF4646FF))
              ),
              filled: true,
              hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              hintText: 'Event Description',
              // prefixIcon: Icon(
              //   Icons.location_pin,
              //   color: Color(0xFFE5241E),
              // )
            ),
          ),
          // SizedBox(height: 10),
          // _fileSee(),
          // SizedBox(height: 10),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     GestureDetector(
          //       child: Stack(
          //         children: [
          //           fileurl(_docFile),
          //           new Positioned(
          //               right: 2.0,
          //               top: 2.0,
          //               child: Container(
          //                 height: 50,
          //                 width: 50,
          //                 decoration: BoxDecoration(
          //                     color: Colors.black26,
          //                     borderRadius: BorderRadius.circular(20)
          //                 ),
          //                 child: Icon(
          //                   Icons.photo_camera,
          //                   size: 34,
          //                   color: Colors.white,
          //                 ),
          //               )
          //           ),
          //         ],
          //       ),
          //       onTap: () => _pickFile(),
          //     )
          //   ],
          // ),
          SizedBox(height: 10),
          CustomElevatedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Continue',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                    ),
                  )
                ],
              ),
              borderRadius: 14.0,
              color: Color(0xFF4646FF),
              onPressed: () {
                if(_titleController.text.length != 0 && _roomController != null &&  _durationController !=null && _descriptionController.text.length != 0 && _date1 != null) {
                  var eventid = generateEventID('AICTE');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InviteInitForm(room: _roomController, title: _titleController.text, description: _descriptionController.text, duration: _durationController, date: _date1, imageurl: _docFile, eventid: eventid)),
                  );
                } else {
                  showExceptionAlertDialog(context, title: 'Something Missing', exception: Exception('check if any field is missing and try again'));
                }
              }
          )
        ],
      ),
    );
  }

  date1(context) {
    return Column(
      children: [
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(width: 10,),
            Icon(
              Icons.date_range,
              color: Color(0xFF4646FF),
              size: 24.0,
            ),
            SizedBox(
              width:10,
            ),
            Text(
                DateFormat('dd MMM, yyyy').format(meetdate) + ' (Meeting Date)',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87
                )
            ),
            Container(width: 5,),
          ],
        ),
        SizedBox(height: 10,),
      ],
    );
  }

  _addAttachment() {
    if (_docFile!=null) {
      return Container();
    } else {
      return InkWell(
        onTap: () {
          _pickFile();
          final snackBar = SnackBar(
            content: const Text('Attachment added'),
            action: SnackBarAction(
              label: 'Ok',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Row(
          children: [
            Icon(
              Icons.attach_file,
              size: 18,
              color: Colors.black,
            ),
            Text(
              ' Add attachments',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black
              ),
            ),
          ],
        ),
      );
    }
  }

  _fileSee() {
    if (_docFile != null) {
      return InkWell(
        onTap: () {
          setState(() {
            _docFile = null;
            filedata = null;
          });
          final snackBar = SnackBar(
            content: const Text('Attachment removed'),
            action: SnackBarAction(
              label: 'Ok',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Container(
          padding: EdgeInsets.all(2),
          width: MediaQuery.of(context).size.width*0.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                filedata,
                softWrap: true,
                maxLines: 1,
                style: TextStyle(
                    overflow: TextOverflow.ellipsis
                ),
              ),
              SizedBox(width: 5),
              Icon(
                  Icons.close
              )
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  fileurl(avatar) {
    if (avatar != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.file(
          avatar!,
          width: 300,
          height: 225,
        ),
      );
    } else {
      return Container(
        width: 300,
        height: 225,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black38
        ),
      );
    }
  }
}

class InviteInitForm extends StatefulWidget {
  final room;
  final title;
  final description;
  final duration;
  final date;
  final imageurl;
  final eventid;

  const InviteInitForm({Key? key, required this.room, required this.title, required this.description, required this.duration, required this.date, required this.imageurl, required this.eventid}) : super(key: key);

  @override
  State<InviteInitForm> createState() => _InviteInitFormState(this.room, this.title, this.description, this.duration, this.date, this.imageurl, this.eventid);
}

class _InviteInitFormState extends State<InviteInitForm> {
  final room;
  final title;
  final description;
  final duration;
  final date;
  final imageurl;
  final eventid;

  _InviteInitFormState(this.room, this.title, this.description, this.duration, this.date, this.imageurl, this.eventid);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Review Event',
          style: TextStyle(
              color: Colors.black
          ),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        centerTitle: true,
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
          SizedBox(height: 10),
          Text(
            'Event ID',
            style: TextStyle(
                fontSize: 12
            ),
          ),
          SizedBox(height: 5),
          Text(
            eventid,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Event Name',
            style: TextStyle(
              fontSize: 12
            ),
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
                fontSize: 18,
              fontWeight: FontWeight.w500
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Description',
            style: TextStyle(
                fontSize: 12
            ),
          ),
          SizedBox(height: 5),
          Text(
            description,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Date',
            style: TextStyle(
                fontSize: 12
            ),
          ),
          SizedBox(height: 5),
          Text(
            DateFormat('dd MMM, yyyy').format(date).toString(),
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Room & Slot',
            style: TextStyle(
                fontSize: 12
            ),
          ),
          SizedBox(height: 5),
          Text(
            room.toString(),
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Event Duration',
            style: TextStyle(
                fontSize: 12
            ),
          ),
          SizedBox(height: 5),
          Text(
            duration.toString(),
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500
            ),
          ),
          SizedBox(height: 10),
          CustomElevatedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Continue',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                    ),
                  )
                ],
              ),
              borderRadius: 14.0,
              color: Color(0xFF4646FF),
              onPressed: () {
                createEvent();
              }
          ),
        ],
      ),
    );
  }

  fileurl(avatar) {
    if (avatar != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.file(
          avatar!,
          width: 300,
          height: 225,
        ),
      );
    } else {
      return Container(
        width: 300,
        height: 225,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black38
        ),
      );
    }
  }

  createEvent() {
    var eventnewdata = addtoFirebase();
    print(eventnewdata);
    Navigator.pushAndRemoveUntil<Widget>(
        context,
        MaterialPageRoute(builder: (context) => ViewEvent(eventdata: eventid)),
            (Route<dynamic> route) => route.isFirst
    );
  }

  addtoFirebase() {
    final events = FirebaseFirestore.instance.collection('meetings');
    return events.add({
      'title': title,
      'description': description,
      'date': date,
      'eventid': eventid,
      'duration': duration,
      'room': room
    });
  }


}

