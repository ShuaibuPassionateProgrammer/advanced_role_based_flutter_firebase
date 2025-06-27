import "package:flutter/material.dart";
import "package:firebase_core/firebase_core.dart";
import "package:role_based_auth/firebase_options.dart";

void main() {
  FlutterWidgetsBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Role Based App",
      home: LoginScreen(),
    );
  }
}