import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:regiform/firebase_options.dart';
//import 'package:regiform/views/home/homescreen.dart';
import 'package:regiform/views/login/loginscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Locking device orientation to landscape
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    // Using FutureBuilder to wait for Firebase initialization
    return FutureBuilder(
      // Initializing Firebase asynchronously
      future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform),
      builder: (context, snapshot) {
        // Show a loading spinner while waiting for Firebase initialization
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(), // Loading indicator
              ),
            ),
          );
        }

        // Handle errors in Firebase initialization
        if (snapshot.hasError) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('Error initializing Firebase: ${snapshot.error}'),
              ),
            ),
          );
        }

        // Once Firebase is initialized, proceed to the login screen
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'RegiForm',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
            useMaterial3: true,
          ),
          //home: HomeScreen(),
          home: Loginscreen(),
        );
      },
    );
  }
}



// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     // Setting device orientation to landscape
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.landscapeRight,
//       DeviceOrientation.landscapeLeft,
//     ]);
//     return GetMaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'RegiForm',
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
//           useMaterial3: true,
//         ),
//         home: Container(
//           height: double.infinity,
//           width: double.infinity,
//           color: Colors.blueAccent,
//         ) //Loginscreen(),
//         );
//   }
// }
