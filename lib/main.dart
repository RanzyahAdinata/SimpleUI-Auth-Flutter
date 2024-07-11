import 'package:flutter/material.dart';
import 'main/dashboard.dart';
import 'main/login.dart';
import 'main/register.dart';
import 'main/landing.dart';
import 'user/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihanku App',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: 'Poppins'
      ),
      home: LandingScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/landing': (context) => LandingScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/profile' : (context) => ProfileScreen(),
      },
    );
  }
}