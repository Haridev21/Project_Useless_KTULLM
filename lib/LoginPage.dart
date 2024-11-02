import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true; // For toggling password visibility
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance; // Initialize Firebase Auth

  void _login() async {
    try {
      String email = _emailController.text.trim();
      String password = _passwordController.text;

      // Implement Firebase login logic
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // If login is successful, navigate to MessagePage
      print("Logged in: ${userCredential.user?.email}");
      Navigator.pushNamed(context, '/home');
    } catch (e) {
      print("Login failed: $e");
      // Show error message to the user
    }
  }

  void _signUp() {
    // Navigate to the signup page
    Navigator.pushNamed(context, '/_signup');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: 320,
              height: 240,
              child: Image.asset(
                'assets/login.png', // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 39.58,
            top: 270,
            child: Container(
              width: 381,
              height: 48,
              child: Text(
                "Let’s Connect With Us!",
                style: TextStyle(
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.bold,
                  fontSize: 29.6,
                  color: Colors.black,
                  shadows: [
                    Shadow(
                      offset: Offset(1, 1),
                      blurRadius: 2.0,
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 39.58,
            top: 350,
            child: Container(
              width: 300,
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
            ),
          ),
          Positioned(
            left: 39.58,
            top: 420,
            child: Container(
              width: 300,
              child: TextField(
                controller: _passwordController,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText; // Toggle visibility
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 39.58,
            top: 490,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/forget');
                // Implement your forgot password logic here
              },
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Positioned(
            left: 21.4,
            top: 570.37,
            child: InkWell(
              onTap: _login,
              child: Container(
                width: 350.21,
                height: 53.49,
                decoration: BoxDecoration(
                  color: Color(0xFF0098FF),
                  borderRadius: BorderRadius.circular(85.58),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontFamily: 'Work Sans',
                    fontWeight: FontWeight.bold,
                    fontSize: 26.74,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: _signUp,
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
