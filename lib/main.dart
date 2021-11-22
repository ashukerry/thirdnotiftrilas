import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:thirdnotiftrilas/local_lotification.dart';
// import 'package:secondfirebasetest/greenpage.dart';
// import 'package:secondfirebasetest/redpage.dart';
/// Receive message when the app is in background solution for onMassage

// Future<void>backgroundHandler(RemoteMessage message)async{
//   if (Firebase.apps.isEmpty) await Firebase.initializeApp();
//   print('Handling a background message ${message.notification!.title}');
//   print('Handling a background message ${message.notification!.body}');

//   print(message.data.toString());
//   print(message.notification!.title);

// }
// LocalNotification local = LocalNotification();
// void main()async {
//   WidgetsFlutterBinding.ensureInitialized();
//   local.initializeNotifications();
//   await Firebase.initializeApp();
//   FirebaseMessaging.onBackgroundMessage(backgroundHandler);

//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
       
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//       routes: {
//         // "red":(_)=>RedPage(),
//         // "green":(_)=>GreenPAge(),
//       },
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);

 

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
  
// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     ///gives you the message on which user taps
//     ///and open the app from terminated  state

//     FirebaseMessaging.instance.getInitialMessage().then((message) {
      
//        if(message !=null){
//          final routeFromMessage=message.data["route"];
        
//        Navigator.of(context).pushNamed(routeFromMessage);


//        }

//     }
//     );


//     //foreground work
//     FirebaseMessaging.onMessage.listen((message) {

//        RemoteNotification? notification = message.notification;
//       AndroidNotification? android = message.notification?.android;
//        if (notification != null && android != null) {
//         local.singleNotification(notification.title ?? 'Title', notification.body ?? 'Body');
//       }

//       if (notification != null && android != null) {
//         showDialog(
//             context: context,
//             builder: (_) {
//               return AlertDialog(
//                 title: Text(notification.title ?? 'Title'),
//                 content: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [Text(notification.body ?? 'Body')],
//                   ),
//                 ),
//               );
//             });
//       }
    

//       if(message.notification !=null){
//         print( message.notification!.body);
//       print( message.notification!.title);
//       }
//      });

//      //works when in bacground and not terminated// and the user tapps on the notif
//      //
//      FirebaseMessaging.onMessageOpenedApp.listen((message) {
//        final routeFromMessage=message.data["route"];
//        print(routeFromMessage);
//        Navigator.of(context).pushNamed(routeFromMessage);
       
//      });
//   }
//   @override
//   Widget build(BuildContext context) {
   
//     return   Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(padding: const EdgeInsets.all(18.0),
//       child: Center(
//         child: Center(child: Text("You will receive a message soon"),),
//       ),
//       ),
      
//     );
    
//   }
// }

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
     if (Firebase.apps.isEmpty) await Firebase.initializeApp();
     print('Handling a background message ${message.notification!.title}');
     print("####################################################################################################");
    }


handleNotifications() async {
FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(badge: true, alert: true, sound: true);//presentation options for Apple notifications when received in the foreground.

FirebaseMessaging.onMessage.listen((message) async {
print('Got a message whilst in the FOREGROUND!');
return;
}).onData((data) {
print('Got a DATA message whilst in the FOREGROUND!');
print('data from stream: ${data.notification!.title}');
});

FirebaseMessaging.onMessageOpenedApp.listen((message) async {
  print('NOTIFICATION MESSAGE TAPPED');
return;
}).onData((data) {
print('NOTIFICATION MESSAGE TAPPED');
print('data from stream: ${data.notification!.title}');
});

FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.instance
      .getInitialMessage()
      .then((value) => value != null ? _firebaseMessagingBackgroundHandler : false);
return;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  handleNotifications(); 
  runApp(MyApp ());
}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        // "red":(_)=>RedPage(),
        // "green":(_)=>GreenPAge(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

 

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    ///gives you the message on which user taps
    ///and open the app from terminated  state

   
  


  }
  @override
  Widget build(BuildContext context) {
   
    return   Scaffold(
      backgroundColor: Colors.white,
      body: Padding(padding: const EdgeInsets.all(18.0),
      child: Center(
        child: Center(child: Text("You will receive a message soon"),),
      ),
      ),
      
    );
    
  }
}