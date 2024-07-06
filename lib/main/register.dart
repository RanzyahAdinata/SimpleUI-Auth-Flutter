import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: Colors.black, // Warna App bar menjadi hitam
        iconTheme: IconThemeData(color: Colors.white), // Warna icon back menjadi putih
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Image.asset(
              './images/icon/register.png',
                height: 120,
                width: 120
            ),
            SizedBox(height: 30),
            Container(
              width: 300, // Panjang teksnya 300px
              child: Text(
                'Create your account',
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
              width: 350, // Panjang teksnya 300px
              child: Text(
                'Buat akunmu terlebih dahulu untuk bisa mengakses semua fitur dalam aplikasi ini. Pastikan kamu mengingat username dan passwordnya !',
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
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
              decoration: InputDecoration(
                labelText: 'Enter your password',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              obscureText: true,
              onChanged: (value) {
                // Dummy confirm password
              },
              decoration: InputDecoration(
                labelText: 'Confirm your password',
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Dummy register validation
                if (email.isNotEmpty && password.isNotEmpty) {
                  Navigator.pushNamed(context, '/dashboard');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please fill out all fields')),
                  );
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
                'Register',
                style: TextStyle(
                  color: Colors.white, // Warna teks putih
                ),
              ),
            ),
          SizedBox(height: 15,),
          ElevatedButton(
            onPressed: () {
              // Arahkan ke link "https://myaccount.google.com/?utm_source=account-marketing-page&utm_medium=go-to-account-button&pli=1"
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    appBar: AppBar(
                      title: Text('Google Account'),
                    ),
                    body: Center(
                      child: Text('Redirecting to Google Account...'),
                    ),
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.white, // Warna background putih
              fixedSize: Size(330, 53), // Ukuran button 350 x 60 px
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30), // Sisi melengkung 20
                side: BorderSide(color: Colors.black, width: 0.5), // Border line hitam dengan ketebalan 0.5
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  './images/icon/google.png', // Path icon google
                  height: 24,
                  width: 24,
                ),
                SizedBox(width: 10),
                Text(
                  'Register with Google Account',
                  style: TextStyle(
                    color: Colors.black, // Warna teks hitam
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sudah punya akun?",
                  style: TextStyle(
                    color: Colors.grey, // Warna teks abu-abu
                  ),
                ), // Menambahkan jarak horizontal 5px
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
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
                      'Login',
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
