// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:workmanager/workmanager.dart';

// void callbackDispatcher() {
//   Workmanager().executeTask((task, inputData) {
//     // initialise the plugin of flutterlocalnotifications.
//     FlutterLocalNotificationsPlugin flip = FlutterLocalNotificationsPlugin();

//     // app_icon needs to be a added as a drawable
//     // resource to the Android head project.
//     var android = const AndroidInitializationSettings('@mipmap/ic_launcher');
//     var iOS = const DarwinInitializationSettings();

//     // initialise settings for both Android and iOS device.
//     var settings = InitializationSettings(android, iOS);
//     flip.initialize(settings);
//     _showNotificationWithDefaultSound(flip);
//     return Future.value(true);
//   });
// }

// Future _showNotificationWithDefaultSound(flip) async {
// // Show a notification after every 15 minute with the first
// // appearance happening a minute after invoking the method
//   var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
//       'your channel id', 'your channel name', 'your channel description',
//       importance: Importance.max, priority: Priority.high);
//   var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();

// // initialise channel platform for both Android and iOS device.
//   var platformChannelSpecifics = NotificationDetails(
//       androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
//   await flip.show(
//       0,
//       'GeeksforGeeks',
//       'Your are one step away to connect with GeeksforGeeks',
//       platformChannelSpecifics,
//       payload: 'Default_Sound');
// }

// class NotificationExample extends StatefulWidget {
//   const NotificationExample({Key? key}) : super(key: key);
// // This widget is the home page of your application.
// // It is stateful, meaning
// // that it has a State object (defined below)
// // that contains fields that affect
// // how it looks.

// // This class is the configuration for the state.
// // It holds the values (in this
// // case the title) provided by the parent
// // (in this case the App widget) and
// // used by the build method of the State.
// // Fields in a Widget subclass are
// // always marked "final".

//   @override
//   _NotificationExampleState createState() => _NotificationExampleState();
// }

// class _NotificationExampleState extends State<NotificationExample> {
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called.
//     // The Flutter framework has been optimized
//     // to make rerunning build methods
//     // fast, so that you can just rebuild
//     // anything that needs updating rather
//     // than having to individually change
//     //instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from
//         // the MyHomePage object that was created by
//         // the App.build method, and use it
//         // to set our appbar title.
//         title: const Text('Notification Example'),
//       ),
//       body: Container(),
//     );
//   }
// }
