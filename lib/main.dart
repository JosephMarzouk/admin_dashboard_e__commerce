import 'package:admin_dashboard_e__commerce/features/Auth/presentation/Views/LoginView.dart';
import 'package:admin_dashboard_e__commerce/features/Home/presentation/HomeView.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: const HomeView(),
    );
  }
}



