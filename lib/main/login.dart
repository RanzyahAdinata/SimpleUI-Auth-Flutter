import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password;

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text('Email dan Password harus terisi'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.black, // Warna App bar menjadi hitam
        iconTheme: IconThemeData(color: Colors.white), // Warna icon back menjadi putih
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins'), // Warna teks menjadi putih
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            ClipOval(
              child: Image.asset(
                './images/icon/login.png',
                height: 180,
                width: 180,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: 300, // Panjang teksnya 200px
              child: Text(
                'Let`s log you in.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  fontSize: 25, 
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: 300, // Panjang teksnya 300px
              child: Text(
                'Silahkan login menggunakan data yang sudah kamu registrasikan sebelumnya. Pastikan email dan password terisi dan benar !',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  color: Colors.grey
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 15,),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // 
                },
                child: Text(
                  'Forget your password?',
                  style: TextStyle(
                    color: Color.fromARGB(250, 79, 68, 68),
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (email.isEmpty || password.isEmpty) {
                  _showAlertDialog(context);
                } else {
                  // Dummy login validation
                  if (email == 'test@test.com' && password == 'password') {
                    Navigator.pushNamed(context, '/dashboard');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Mas loginnya belum bisa, akunmu salah kali')),
                    );
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black, // Warna background hitam
                minimumSize: Size(350, 60), // Ukuran button 250 x 50 px
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Sisi melengkung 20
                ),
              ),
              child: Text(
                'Log In',
                style: TextStyle(
                  color: Colors.white, // Warna teks putih
                ),
              ),
            ),
            
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    color: Colors.grey, // Warna teks abu-abu
                  ),
                ), // Menambahkan jarak horizontal 5px
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  child: MouseRegion(
                    onEnter: (_) {
                      // Change text style on hover
                    },
                    onExit: (_) {
                      // Revert text style when not hovering
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}