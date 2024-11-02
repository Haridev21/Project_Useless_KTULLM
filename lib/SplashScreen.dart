import 'package:flutter/material.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE04A4A),
      body: Stack(
        children: [
          // "SHA" Text
          Positioned(
            left: 48,
            top: 120,
            width: 219,
            height: 68,
            child: Text(
              'SHA',
              style: TextStyle(
                fontSize: 48,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    offset: const Offset(3, 3),
                    blurRadius: 5.0,
                    color: Colors.black.withOpacity(0.3),
                  ),
                ],
              ),
            ),
          ),
          // "CHATBOT" Text
          Positioned(
            left: 48,
            top: 175,
            width: 219,
            height: 68,
            child: Text(
              'CHATBOT',
              style: TextStyle(
                fontSize: 42,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
                color: Colors.white,
                shadows: [
                  Shadow(
                    offset: const Offset(3, 3),
                    blurRadius: 5.0,
                    color: Colors.black.withOpacity(0.3),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            left: 52,
            top: 370,
            width: 292,
            height: 101,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Specialized For KTU',
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(3, 3),
                        blurRadius: 5.0,
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Student',
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(3, 3),
                        blurRadius: 5.0,
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Rectangle Button
          Positioned(
            left: 55,
            top: 670,
            child: ElevatedButton(
              onPressed: () {

                Navigator.pushNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                elevation: 5, // Add elevation for shadow
              ),
              child: Container(
                width: 250,
                height: 60,
                alignment: Alignment.center,
                child: const Text(
                  "Let's Start",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Risque',
                    color: Color(0xFFE20A0A), // Text color E20A0A
                    fontWeight: FontWeight.normal,
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
