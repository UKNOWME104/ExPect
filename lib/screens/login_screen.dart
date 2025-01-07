import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to Petagram",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal[800],
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/paw_logo.png', // Add your logo to assets
              height: 150,
            ),
            SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () async {
                try {
                  await Provider.of<AuthService>(context, listen: false).signInWithGoogle();
                  Navigator.pushReplacementNamed(context, '/home');
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to log in: $e')),
                  );
                }
              },
              icon: Icon(Icons.pets),
              label: Text("Sign in with Google"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[400],
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
