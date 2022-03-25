import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:evenizer/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'app/landing_page.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );


  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFFFFFFFF),
      statusBarIconBrightness: Brightness.dark
  ));

}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description: 'This channel is used for important notifications.', // description
  importance: Importance.high,
  playSound: true,
);

// flutter local notification
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget splash = SplashScreenView(
      navigateRoute: LandingPage(),
      backgroundColor: Colors.white,
      duration: 2000,
      text: "Evenizer",
      imageSize: 600,
      imageSrc: 'assets/images/logo.jpg',
      textType: TextType.ColorizeAnimationText,
      textStyle: TextStyle(
          fontSize: 40.0,
          fontWeight: FontWeight.bold
      ),
      colors: [
        Colors.black,
        Colors.white,
        Colors.black54,
        Colors.black,
      ],
    );
    return Provider<AuthBase>(
      create: (context) => Auth(),
      child: MaterialApp(
          title: 'Evenizer',
          theme: ThemeData(
              primaryColor: Color(0xFF4646FF),
              appBarTheme: AppBarTheme(
                color: Color(0xFFFFFFFF),
              )
          ), //Themedata
          // home: LandingPage(), //container
          home: splash
      ),
    );
  }

}