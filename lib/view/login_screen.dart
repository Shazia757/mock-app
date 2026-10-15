import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Username'),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(8),
              ),
              child: TextField(
                decoration: InputDecoration(contentPadding: EdgeInsets.all(16)),
              ),
            ),
            const SizedBox(height: 10),
            Text('Password'),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(8),
              ),
              child: TextField(
                decoration: InputDecoration(contentPadding: EdgeInsets.all(16)),
              ),
            ),
            FilledButton(onPressed: () {
              
            }, child: Text('Login'))
          ],
        ),
      ),
    );
  }
}
