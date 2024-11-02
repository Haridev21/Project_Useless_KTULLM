import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _signUp() async {
    String username = _usernameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text;

    if (username.isEmpty || email.isEmpty || password.isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("All fields are required")),
      );
      return;
    }

    try {

      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );


      await userCredential.user?.updateDisplayName(username);

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Account created successfully!")),
      );

      // next page
      Navigator.pushNamed(context, '/home');
    } catch (e) {
      print("Sign-up failed: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Sign-up failed: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        backgroundColor: Color(0xFF0098FF),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Text(
              "Create an Account",
              style: TextStyle(
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email Address',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: InkWell(
                onTap: _signUp,
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
                    "Sign Up",
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
          ],
        ),
      ),
    );
  }
}
