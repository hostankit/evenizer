import 'dart:io';

import 'package:flutter/material.dart';

Future<dynamic>? showAlertDialog(
    BuildContext context, {
      required String title,
      required String? content,
      String? cancelActionText,
      required String defaultActionText,
    }) {
  if (!Platform.isIOS) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25))
        ),
        title: Center(child: Text(title)),
        content: Text(
          content!,
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (cancelActionText != null)
                  TextButton(
                    child: Text(
                      cancelActionText,
                      style: TextStyle(
                          color: Color(0xFFE5241E),
                          fontSize: 16
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color(0xFFFF0000)),
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)
                            )
                        ),
                        elevation: MaterialStateProperty.all(0),
                        fixedSize: MaterialStateProperty.all(const Size(100, 50))
                    ),
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text(
                      defaultActionText,
                      style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 16
                      ),
                    )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}