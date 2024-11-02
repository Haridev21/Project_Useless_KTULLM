import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgetPass extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance; // Initialize Firebase Auth

  void _resetPassword(BuildContext context) async {
    String email = _emailController.text;

    if (email.isEmpty) {
      // Show an error message if the email field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter your email address.")),
      );
      return;
    }

    try {
      // Send password reset email
      await _auth.sendPasswordResetEmail(email: email);
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password reset link sent to $email.")),
      );
      Navigator.pop(context); // Navigate back to the previous screen
    } catch (e) {
      // Show error message if sending reset fails
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset Password"),
        backgroundColor: Color(0xFF0098FF),
      ),
      body: Stack(
        children: [
          // Background color
          Container(
            color: Colors.white,
          ),
          // Email TextField
          Positioned(
            left: 39.58, // X position
            top: 150, // Y position
            child: Container(
              width: 300, // Width
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
          // Reset Password Button
          Positioned(
            left: 22.4, // X position
            top: 230, // Y position
            child: InkWell(
              onTap: () => _resetPassword(context), // Handle reset password action
              child: Container(
                width: 340.21, // Width
                height: 53.49, // Height
                decoration: BoxDecoration(
                  color: Color(0xFF0098FF), // Button color
                  borderRadius: BorderRadius.circular(85.58), // Corner radius
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1), // Shadow color
                      blurRadius: 4, // Shadow blur radius
                      offset: Offset(0, 2), // Shadow offset
                    ),
                  ],
                ),
                alignment: Alignment.center, // Center the text
                child: Text(
                  "Reset Password",
                  style: TextStyle(
                    fontFamily: 'Work Sans', // Font family
                    fontWeight: FontWeight.bold, // Font weight
                    fontSize: 26.74, // Font size
                    color: Colors.white, // Text color
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
