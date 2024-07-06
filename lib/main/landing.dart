import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/landing.png',
               height: 300,
            ),
            SizedBox(height: 25),
            Container(
              width: 200, // Panjang teksnya 200px
              child: Text(
                'Welcome to LatihanKu',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  fontSize: 24, 
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 350, // Panjang teksnya 300px
              child: Text(
                'Aplikasi ini akan membantu anda dalam penelusuran dan latihan flutter. Temukan minat anda di Flutter!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black, // Warna background hitam
                minimumSize: Size(250, 50), // Ukuran button 300 x 100 px
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Sisi melengkung 20
                ),
              ),
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white, // Warna teks putih
                ),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white, // Warna background hitam
                minimumSize: Size(250, 50), // Ukuran button 300 x 100 px
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Sisi melengkung 20
                  side: BorderSide(color: Colors.black, width: 0.5), // Border line hitam dengan ketebalan 2
                ),
              ),
              child: Text(
                'Register',
                style: TextStyle(
                  color: Colors.black, // Warna teks putih
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}