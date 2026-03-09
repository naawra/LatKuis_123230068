import 'package:flutter/material.dart';
import '../screen/login_page.dart'; 

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false, 
      title: 'Aplikasi Film By You Scope',
      theme: ThemeData(
        primarySwatch: Colors.blue, 
      ),
      home: LoginPage(), 
    );
  }
}