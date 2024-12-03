import 'package:flutter/material.dart';

void main() {
  runApp(SimpleApp());
}

class SimpleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple UI App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Simple UI App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Welcome Message
              Text(
                'Welcome to the Simple UI App!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),

              // ElevatedButton
              ElevatedButton(
                onPressed: () {
                  print('Button clicked: Hello, Flutter!');
                },
                child: Text('Click Me'),
              ),
              SizedBox(height: 20),

              // Display an Image
              Image.network(
                'https://flutter.dev/images/flutter-logo-sharing.png',
                height: 150,
                width: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
