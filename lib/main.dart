  import 'package:flutter/material.dart';
  import 'screens/login_page.dart';  // Import your login screen

  void main() {
    runApp(WorkExchangeApp());
  }

  class WorkExchangeApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'WorkExchange',
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        debugShowCheckedModeBanner: false,
        home: LoginPage(), // Start with login
      );
    }
  }
