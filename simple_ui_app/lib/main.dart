import 'package:flutter/material.dart';

void main() {
  runApp(MyCoolApp());
}

class MyCoolApp extends StatefulWidget {
  @override
  _MyCoolAppState createState() => _MyCoolAppState();
}

class _MyCoolAppState extends State<MyCoolApp> {
  bool isDarkTheme = false; // Theme toggle state
  String userName = ''; // Holds the user's name

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cool UI App'),
          actions: [
            // Theme Toggle Button
            IconButton(
              icon: Icon(isDarkTheme ? Icons.dark_mode : Icons.light_mode),
              onPressed: () {
                setState(() {
                  isDarkTheme = !isDarkTheme;
                });
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Welcome Message
              Text(
                'Welcome to the Cool UI App!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),

              // TextField for User Input
              TextField(
                onChanged: (value) {
                  setState(() {
                    userName = value;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your name',
                ),
              ),
              SizedBox(height: 20),

              // Dynamic Greeting Button
              ElevatedButton(
                onPressed: () {
                  final snackBar = SnackBar(
                    content: Text('Hello, ${userName.isEmpty ? 'Guest' : userName}!'),
                    duration: Duration(seconds: 2),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Text('Greet Me'),
              ),
              SizedBox(height: 20),

              // Animated Image
              AnimatedContainer(
                duration: Duration(seconds: 1),
                curve: Curves.easeInOut,
                child: Image.network(
                  'https://flutter.dev/images/flutter-logo-sharing.png',
                  height: 150,
                  width: 150,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
