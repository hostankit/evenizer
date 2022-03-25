import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:evenizer/common_widgets/show_alert_dialog.dart';

Future<void>? showExceptionAlertDialog(
    BuildContext context, {
      required String title,
      required Exception exception,
    }) =>
    showAlertDialog(
        context,
        title: title,
        content: _message(exception),
        defaultActionText: 'OK'
    );

String? _message(Exception exception) {
  if (exception is FirebaseException) {
    return exception.message;
  }
  return exception.toString();
}